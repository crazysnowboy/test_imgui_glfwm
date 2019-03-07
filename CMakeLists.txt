CMAKE_MINIMUM_REQUIRED(VERSION 3.0.2) #cmake 版本限定
PROJECT(mytestimgui)  #工程名称

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
set(CMAKE_CXX_FLAGS "-std=c++11 -Wno-sign-compare ")


include(cmake/toolsets/BasicTools.cmake)

GobalInit(MODULES_INCLUDE_DIRS "")
GobalInit(MODULES_LIBRARIES "")
GobalInit(LOCAL_LIBRARIES "")


#include(cmake/toolsets/Manage3rdpartTools.cmake)
include(cmake/toolsets/IncludeTools.cmake)
include(cmake/toolsets/CompileTools.cmake)

include(cmake/toolsets/RemoveFIlesTools.cmake)

include(cmake/config/clear_incs_srcs.cmake)


include(cmake/config/define.cmake)
include(cmake/config/ConfigureDeps.cmake)
#include(cmake/config/Configure3rdpart.cmake)





ReadGlobal(MODULES_INCLUDE_DIRS MODULE_INCLUDE_DIRS_LIST)
separate_arguments(MODULE_INCLUDE_DIRS_LIST)
#foreach(inc ${MODULE_INCLUDE_DIRS_LIST})
#    message(${inc})
#endforeach()

ReadGlobal(MODULES_LIBRARIES MODULE_LIBS_LIST)
separate_arguments(MODULE_LIBS_LIST)
#foreach(lib ${MODULE_LIBS_LIST})
#    message(${lib})
#endforeach()



#SET(CMAKE_BUILD_TYPE "Release")

option(BUILD_PYTHON_LIB "if should build python libraries" OFF)
option(BUILD_MAIN "if should build main" ON)
option(BUILD_SHARED_LIBS "if build Shared Libs" OFF)
set( BUILD_SHARED_LIBS OFF CACHE BOOL "Build package with shared libraries." FORCE)


#########################################incs####################################

SET(ALL_INC_DIRS
        ${PROJECT_SOURCE_DIR}/include
        ${PROJECT_SOURCE_DIR}/include/GLFWM
        ${PROJECT_SOURCE_DIR}/include/imgui_sfml


        )

 SET(RINCLUDE_DIRS
         ${PROJECT_SOURCE_DIR}/include/imgui
         )
 foreach(curdir ${RINCLUDE_DIRS})
     MyIncludeRecursive(${curdir} Rec_INC_DIRS)
     set(ALL_INC_DIRS ${ALL_INC_DIRS} ${Rec_INC_DIRS})
 endforeach()

set(ALL_INC_DIRS ${ALL_INC_DIRS} ${MODULE_INCLUDE_DIRS_LIST})
include_directories(${ALL_INC_DIRS})

########################################libs#####################################
set(LIBRARIES ${MODULE_LIBS_LIST})
CompileLib(
            "${PROJECT_SOURCE_DIR}/include"
            "${PROJECT_SOURCE_DIR}/src"
            "imgui GL GLFWM imgui_sfml")


ReadGlobal(LOCAL_LIBRARIES LOCAL_LIBS_LIST)
separate_arguments(LOCAL_LIBS_LIST)
set(LIBRARIES ${LIBRARIES} ${LOCAL_LIBS_LIST})


foreach(lib ${LIBRARIES})
    message(${lib})
endforeach()

CompileMain(${PROJECT_SOURCE_DIR}/main "*.cpp")



IF(BUILD_PYTHON_LIB)
    message("build python libraries")
    include(cmake/ConfigurePython.cmake)
ENDIF(BUILD_PYTHON_LIB)


message("-----delete_files ${delete_files}---------")



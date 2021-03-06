
#set(BASICLIBS_PATH /home/collin/Space_0_5_T/code/NeteaseProjects/myLibraries)
set(BASICLIBS_PATH /home/collin/Documents/Projects/code/myLibraries)

SET(BASIC_PROJECT_ROOT ${BASICLIBS_PATH}/myBasiclibs)
set(BASIC_INC_PATH ${BASIC_PROJECT_ROOT}/include)
set(BASIC_LIB_PATH ${BASIC_PROJECT_ROOT}/libs/libBasicLibs.a)
#list(APPEND LIBRARIES ${BASIC_LIB_PATH})
list(APPEND Basiclibs_INCLUDE_DIR ${BASIC_INC_PATH})
list(APPEND INCLUDE_DIR  ${Basiclibs_INCLUDE_DIR} )


SET(BASIC_PROJECT_ROOT ${BASICLIBS_PATH}/myAssimp)
set(BASIC_INC_PATH ${BASIC_PROJECT_ROOT}/include)
set(BASIC_LIB_PATH ${BASIC_PROJECT_ROOT}/libs/libmyAssimp.a)
#list(APPEND LIBRARIES ${BASIC_LIB_PATH})
list(APPEND Assimp_INCLUDE_DIR ${BASIC_INC_PATH})
list(APPEND INCLUDE_DIR  ${Assimp_INCLUDE_DIR} )


SET(BASIC_PROJECT_ROOT ${BASICLIBS_PATH}/myOpenface)
set(BASIC_INC_PATH ${BASIC_PROJECT_ROOT}/include)
set(BASIC_LIB_PATH ${BASIC_PROJECT_ROOT}/libs/libmyOpenface.a)
list(APPEND LIBRARIES ${BASIC_LIB_PATH})
list(APPEND Openface_INCLUDE_DIR ${BASIC_INC_PATH})
list(APPEND INCLUDE_DIR  ${Openface_INCLUDE_DIR} )



SET(BASIC_PROJECT_ROOT ${BASICLIBS_PATH}/myPangolin)
set(BASIC_INC_PATH ${BASIC_PROJECT_ROOT}/include)
set(BASIC_LIB_PATH ${BASIC_PROJECT_ROOT}/libs/libmyPangolin.a)
list(APPEND LIBRARIES ${BASIC_LIB_PATH})

list(APPEND Pangolin_INCLUDE_DIR ${BASIC_INC_PATH})
list(APPEND INCLUDE_DIR  ${Pangolin_INCLUDE_DIR} )
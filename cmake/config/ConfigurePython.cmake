set(HEAD_DIR ${PROJECT_SOURCE_DIR}/include/crazy/to_python)
set(SRCS_DIR ${PROJECT_SOURCE_DIR}/src/crazy/to_python)
set(PYTHON_ROOT /home/collin/MySpace/anaconda3/envs/torch)

file(GLOB_RECURSE files_hpp "${HEAD_DIR}/*.hpp")
file(GLOB_RECURSE files_h "${HEAD_DIR}/*.h")


set(mid_file_save_path ${PROJECT_SOURCE_DIR}/python/cmake_generated)

#--------------headers.h---------------------
foreach(file ${files_hpp})
    list(APPEND incs "#include \"${file}\"\n")
endforeach(file)
foreach(file ${files_h})
    list(APPEND incs "#include \"${file}\" \n")
endforeach(file)
file(WRITE ${mid_file_save_path}/headers.h ${incs})

##--------------incs_for_wrap.i---------------------
foreach(file ${files_hpp})
    list(APPEND incs_2 "%include \"${file}\"\n")
endforeach(file)
foreach(file ${files_h})
    list(APPEND incs_2 "%include \"${file}\" \n")
endforeach(file)
file(WRITE ${mid_file_save_path}/incs_for_wrap.i ${incs_2})




#cmake_policy(SET CMP0078 NEW)
find_package(SWIG REQUIRED)
include(UseSWIG)
include_directories(${PYTHON_ROOT}/include
                    ${PYTHON_ROOT}/include/python3.5m
                    ${PYTHON_ROOT}/lib/python3.5/site-packages/numpy/core/include
                    ${PROJECT_SOURCE_DIR}/python)

if(${SWIG_FOUND})
        message(" SWIG Found SWIG_DIR  = " ${SWIG_DIR})
        message(" SWIG Found SWIG_EXECUTABLE  = " ${SWIG_EXECUTABLE})
        message(" SWIG Found SWIG_VERSION  = " ${SWIG_VERSION})
endif()
set_property(   SOURCE ${PROJECT_SOURCE_DIR}/python/pycrazy.i
                PROPERTY CPLUSPLUS ON)


file(GLOB_RECURSE CtoLIB_SRCS_c "${SRCS_DIR}/*.c")
file(GLOB_RECURSE CtoLIB_SRCS_cc "${SRCS_DIR}/*.cc")
file(GLOB_RECURSE CPP_SRCS "${SRCS_DIR}/*.cpp")
set(CPP_SRCS ${CPP_SRCS} ${CtoLIB_SRCS_c} ${CtoLIB_SRCS_cc})

set (UseSWIG_TARGET_NAME_PREFERENCE STANDARD)
set(PythonLIBName py${PROJECT_NAME})

swig_add_library(${PythonLIBName}
        LANGUAGE python
        TYPE SHARED
        OUTPUT_DIR ${PROJECT_SOURCE_DIR}/python/
        OUTFILE_DIR ${PROJECT_SOURCE_DIR}/python/outfile_dir
        SOURCES ${PROJECT_SOURCE_DIR}/python/pycrazy.i ${CPP_SRCS})

TARGET_LINK_LIBRARIES(${PythonLIBName} ${LIBRARIES} ${LOCAL_LIBS}
                ${PYTHON_ROOT}/lib/libpython3.5m.so
                -lz)

set_target_properties(${PythonLIBName} PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/python"
        LIBRARY_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/python"
        RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/python")



find_program(PYTHON "python3")
if (PYTHON)

    file(GLOB_RECURSE python_cpp "${PROJECT_SOURCE_DIR}/python/modergl/src/*.cpp")

    set(OUTPUT   "${PROJECT_SOURCE_DIR}/python/modergl/mgl")
    add_custom_command(OUTPUT ${OUTPUT}
                        COMMAND ${PYTHON}
                        ARGS setup.py build_ext --inplace
                        COMMENT "${PYTHON} setup.py ---"
                        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/python/modergl)

    add_custom_target(ModerGL ALL DEPENDS ${OUTPUT})

    set_target_properties(ModerGL PROPERTIES
            ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/python"
            LIBRARY_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/python"
            RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/python")


endif()

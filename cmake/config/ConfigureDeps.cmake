#opencv
#set(OpenCV_DIR /usr/local/opencv330/share/OpenCV)
#find_package(PkgConfig REQUIRED)
#pkg_check_modules(OPENCV REQUIRED opencv330)
#
#
#Gobal_Append(MODULES_LIBRARIES "${OPENCV_LDFLAGS}")
#Gobal_Append(MODULES_INCLUDE_DIRS "${OPENCV_INCLUDE_DIRS}")


#opengl
set(OpenGL_INC_DIR /usr/include/GL)
set(OpenGL_LIB_DIR /usr/lib/x86_64-linux-gnu)
link_directories("${OpenGL_LIB_DIR}")

find_package(glfw3 3.2 REQUIRED)

Gobal_Append( MODULES_LIBRARIES "glfw")

##boost
#find_package(Boost  REQUIRED COMPONENTS system filesystem)
#if(Boost_FOUND)
#    Gobal_Append( MODULES_INCLUDE_DIRS  ${Boost_INCLUDE_DIRS}/boost )
#    Gobal_Append( MODULES_INCLUDE_DIRS  "${Boost_INCLUDE_DIRS}" )
#    Gobal_Append( MODULES_LIBRARIES "${Boost_LIBRARIES}")
#
#else()
#    message("--------------Boost not FOUND------------")
#
#endif()
#
#glfwM
#
#find_package(glfwm 3.2 REQUIRED CONFIG)
#Gobal_Append( MODULES_LIBRARIES "glfwm")


#others

Gobal_Append( MODULES_LIBRARIES "-ldl -lGL")




#

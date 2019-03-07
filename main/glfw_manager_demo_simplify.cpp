

#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"
#include "imgui_dock.h"

#include <iostream>


#include <GLFWM/glfwm.hpp>


int main(int argc, char *argv[])
{
    glfwm::WindowManager::init();
    glfwm::WindowManager::setHint(GLFW_CLIENT_API, GLFW_NO_API);



    glfwm::WindowGroupPointer window_gropus = glfwm::WindowGroup::newGroup();



    glfwm::WindowPointer main_window = glfwm::WindowManager::createWindow(800, 600, std::string(),glfwm::EventType::MOUSE_BUTTON);
    main_window->setTitle(std::string("Main Window ") + std::to_string(main_window->getID()));

    window_gropus->attachWindow(main_window->getID());
    window_gropus->runLoopConcurrently();


    do
    {
        glfwm::WindowManager::PreUpate();

        glfwm::WindowManager::PostUpdate();


    }  while (glfwm::WindowManager::ShoudQuit()== false);


    glfwm::WindowManager::terminate();

    return 0;
}

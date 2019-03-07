
#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"
#include "imgui_dock.h"
#include <stdio.h>

#include <GL/gl3w.h>    // Initialize with gl3wInit()

// Include glfw3.h after our OpenGL definitions
#include <GLFW/glfw3.h>
#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"
#include "imgui_dock.h"
#include <iostream>
#include <GLFWM/glfwm.hpp>

class myIMGUI
{

private:
    GLFWwindow *local_window;
public:

    myIMGUI()
    {


    }

    myIMGUI(GLFWwindow *window)
    {

        this->Init(window);
    }

    int Init(GLFWwindow *window)
    {

        local_window = window;

        // Initialize OpenGL loader
        bool err = gl3wInit() != 0;
        if (err)
        {
            fprintf(stderr, "Failed to initialize OpenGL loader!\n");
            return 1;
        }

        IMGUI_CHECKVERSION();
        ImGui::CreateContext();
        ImGuiIO& io = ImGui::GetIO();

        ImGui::StyleColorsDark();
        // Setup Platform/Renderer bindings
        ImGui_ImplGlfw_InitForOpenGL(local_window, true);
        const char* glsl_version = "#version 130";
        ImGui_ImplOpenGL3_Init(glsl_version);
        ImGui::InitDock();
    }

    int update()
    {

        // Start the Dear ImGui frame
        ImGui_ImplOpenGL3_NewFrame();
        ImGui_ImplGlfw_NewFrame();
        ImGui::NewFrame();

        if(ImGui::Begin("Dock Demo"))
        {
            // dock layout by hard-coded or .ini file
            ImGui::BeginDockspace();

            if(ImGui::BeginDock("Dock 1"))
            {
                ImGui::Text("I'm Wubugui!");
            }
            ImGui::EndDock();

            if(ImGui::BeginDock("Dock 2"))
            {
                ImGui::Text("I'm BentleyBlanks!");
            }
            ImGui::EndDock();

            if(ImGui::BeginDock("Dock 3"))
            {
                ImGui::Text("I'm LonelyWaiting!");
            }
            ImGui::EndDock();

            ImGui::EndDockspace();
        }
        ImGui::End();


        // Rendering
        ImGui::Render();
        int display_w, display_h;
        glfwMakeContextCurrent(local_window);
        glfwGetFramebufferSize(local_window, &display_w, &display_h);
        glViewport(0, 0, display_w, display_h);

        ImVec4 clear_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);
        glClearColor(clear_color.x, clear_color.y, clear_color.z, clear_color.w);
        glClear(GL_COLOR_BUFFER_BIT);
        ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());


    }
};
int main(int argc, char *argv[])
{
    glfwm::WindowManager::init();
    glfwm::WindowManager::setHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwm::WindowManager::setHint(GLFW_CONTEXT_VERSION_MINOR, 0);


    glfwm::WindowPointer mainWin = glfwm::WindowManager::createWindow(800, 600, std::string(),glfwm::EventType::MOUSE_BUTTON);
    mainWin->setTitle(std::string("Main Window ") + std::to_string(mainWin->getID()));


    glfwm::WindowGroupPointer grp = glfwm::WindowGroup::newGroup();
    grp->attachWindow(mainWin->getID());
    grp->runLoopConcurrently();

    myIMGUI my_imgui(mainWin->GetglfwWindow());

    do
    {
        glfwm::WindowManager::PreUpate();

        my_imgui.update();

        glfwm::WindowManager::PostUpdate();

    }  while (glfwm::WindowManager::ShoudQuit()== false);


//     Finally, deletes all the resources: any group is destroyed and GLFW is terminated.
    glfwm::WindowManager::terminate();

    return 0;
}

#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <iostream>
#include<bits/stdc++.h>

void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
    glViewport(0, 0, width, height);
}

int main() {
    // Initialize GLFW
    if (!glfwInit()) {
        std::cerr << "Failed to initialize GLFW" << std::endl;
        return -1;
    }

    // Create a windowed mode window and its OpenGL context
    GLFWwindow* window = glfwCreateWindow(800, 600, "Hello OpenGL", nullptr, nullptr);
    if (!window) {
        std::cerr << "Failed to create GLFW window" << std::endl;
        glfwTerminate();
        return -1;
    }
    
    glfwMakeContextCurrent(window);
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

    // Initialize GLEW
    glewExperimental = GL_TRUE; 
    if (glewInit() != GLEW_OK) {
        std::cerr << "Failed to initialize GLEW" << std::endl;
        return -1;
    }
     float t=0;
    // Main loop
    while (!glfwWindowShouldClose(window)) {
        // Render
        glClear(GL_COLOR_BUFFER_BIT);
        glClearColor(std::abs(std::sin(t)),0,0,1);
        // Swap buffers and poll events
        glfwSwapBuffers(window);
        glfwPollEvents();
        t+=0.1f;
        std::cout<<"ha";
    }

    glfwDestroyWindow(window);
    glfwTerminate();
    return 0;
}


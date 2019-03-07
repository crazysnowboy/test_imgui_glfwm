

add_subdirectory_with_folder("assimp"
                            ${PROJECT_SOURCE_DIR}/3rdparty/assimp
                            ON)
add_subdirectory_with_folder("bgfx bx"
                            ${PROJECT_SOURCE_DIR}/3rdparty/bgfx
                            ON)
add_subdirectory_with_folder("rttr_core_lib"
        ${PROJECT_SOURCE_DIR}/3rdparty/rttr
        OFF)



add_subdirectory_with_folder("cereal"
                                ${PROJECT_SOURCE_DIR}/3rdparty/cereal
                                OFF)
add_subdirectory_with_folder("glm"
                            ${PROJECT_SOURCE_DIR}/3rdparty/glm
                            OFF)


add_subdirectory_with_folder("imgui"
                                ${PROJECT_SOURCE_DIR}/3rdparty/imgui
                                ON)


add_subdirectory_with_folder("filedialog"
                                ${PROJECT_SOURCE_DIR}/3rdparty/filedialog
                                ON)
add_subdirectory_with_folder("mml-window mml-system"
                            ${PROJECT_SOURCE_DIR}/3rdparty/mml
                            ON)
add_subdirectory_with_folder("stb_vorbis"
                            ${PROJECT_SOURCE_DIR}/3rdparty/stb
                            ON)
add_subdirectory_with_folder("spdlog"
                            ${PROJECT_SOURCE_DIR}/3rdparty/spdlog
                            OFF)

add_subdirectory_with_folder("OpenAL"
        ${PROJECT_SOURCE_DIR}/3rdparty/openal
        ON)





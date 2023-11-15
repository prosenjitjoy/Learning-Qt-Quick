cmake_minimum_required(VERSION 3.16)

project(RegisterCppInQml VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Multimedia)

qt_standard_project_setup()

qt_add_executable(appRegisterCppInQml
    main.cpp
    PlayerController.h PlayerController.cpp
)

qt_add_qml_module(appRegisterCppInQml
    URI RegisterCppInQml
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES AudioInfoBox.qml
    QML_FILES ImageButton.qml

    RESOURCES
    assets/icons/music.svg
    assets/icons/next-outline.svg
    assets/icons/pause-outline.svg
    assets/icons/play-outline.svg
    assets/icons/previous-outline.svg
    assets/images/air.jpeg
    assets/images/eine.jpeg
    assets/images/symphony.jpeg
    assets/audios/air.mp3
    assets/audios/eine.mp3
    assets/audios/symphony.mp3
    SOURCES AudioInfo.h AudioInfo.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appRegisterCppInQml PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appRegisterCppInQml
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appRegisterCppInQml
    PRIVATE Qt6::Quick Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS appRegisterCppInQml
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

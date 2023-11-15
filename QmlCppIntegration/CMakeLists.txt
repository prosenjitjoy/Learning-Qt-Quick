cmake_minimum_required(VERSION 3.16)

project(QmlCppIntegration VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appQmlCppIntegration
    main.cpp
)

qt_add_qml_module(appQmlCppIntegration
    URI QmlCppIntegration
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
    assets/videos/mozart.mp4
    SOURCES PlayerController.h PlayerController.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQmlCppIntegration PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQmlCppIntegration
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQmlCppIntegration
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQmlCppIntegration
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

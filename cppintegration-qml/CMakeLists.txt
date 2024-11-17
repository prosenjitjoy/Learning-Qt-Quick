cmake_minimum_required(VERSION 3.31)

project(cppintegration-qml VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appcppintegration-qml
    main.cpp
)

qt_add_qml_module(appcppintegration-qml
    URI cppintegration-qml
    VERSION 1.0
    QML_FILES
        Main.qml
    SOURCES
        cppbackend.h cppbackend.cpp
)

target_link_libraries(appcppintegration-qml
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appcppintegration-qml
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

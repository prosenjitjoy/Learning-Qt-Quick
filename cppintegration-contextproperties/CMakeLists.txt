cmake_minimum_required(VERSION 3.31)

project(cppintegration-contextproperties VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appcppintegration-contextproperties
    main.cpp
)

qt_add_qml_module(appcppintegration-contextproperties
    URI Cppintegration
    VERSION 1.0
    QML_FILES
        Main.qml
    SOURCES
        someclass.h someclass.cpp
)

target_link_libraries(appcppintegration-contextproperties
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appcppintegration-contextproperties
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

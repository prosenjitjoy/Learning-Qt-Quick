cmake_minimum_required(VERSION 3.31)

project(cppintegration-registerclass VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appcppintegration-registerclass
    main.cpp
)

qt_add_qml_module(appcppintegration-registerclass
    URI cppintegration-registerclass
    VERSION 1.0
    QML_FILES
        Main.qml
    SOURCES
        customobject.h customobject.cpp
)

target_link_libraries(appcppintegration-registerclass
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appcppintegration-registerclass
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

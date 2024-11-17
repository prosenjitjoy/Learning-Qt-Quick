cmake_minimum_required(VERSION 3.31)

project(cppintegration-qmlelement VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.7 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.7)

qt_add_executable(appcppintegration-qmlelement
    main.cpp
)

qt_add_qml_module(appcppintegration-qmlelement
    URI UsingElement
    VERSION 1.0
    QML_FILES
        Main.qml
    SOURCES
        usingelement.h usingelement.cpp
)

target_link_libraries(appcppintegration-qmlelement
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appcppintegration-qmlelement
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

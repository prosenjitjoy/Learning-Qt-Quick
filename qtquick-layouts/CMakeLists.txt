cmake_minimum_required(VERSION 3.31)

project(qtquick-layouts VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appqtquick-layouts
    main.cpp
)

qt_add_qml_module(appqtquick-layouts
    URI qtquick-layouts
    VERSION 1.0
    QML_FILES
        Main.qml
)

target_link_libraries(appqtquick-layouts
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appqtquick-layouts
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

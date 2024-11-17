cmake_minimum_required(VERSION 3.30)

project(hello-world VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(apphello-world
    main.cpp
)

qt_add_qml_module(apphello-world
    URI hello-world
    VERSION 1.0
    QML_FILES
    Main.ui.qml
)

target_link_libraries(apphello-world
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS apphello-world
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

cmake_minimum_required(VERSION 3.31)

project(mousearea VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.7 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.7)

qt_add_executable(appmousearea
    main.cpp
)

qt_add_qml_module(appmousearea
    URI mousearea
    VERSION 1.0
    QML_FILES
        Main.qml
)

target_link_libraries(appmousearea
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appmousearea
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

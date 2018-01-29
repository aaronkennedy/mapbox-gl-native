mason_use(optional VERSION f27e7908 HEADER_ONLY)
mason_use(tao_tuple VERSION 28626e99 HEADER_ONLY)

add_definitions(-DMBGL_WIN)

macro(mbgl_platform_core)

    target_sources(mbgl-core
        # Headless view
        PRIVATE platform/default/mbgl/gl/headless_frontend.cpp
        PRIVATE platform/default/mbgl/gl/headless_frontend.hpp
        PRIVATE platform/default/mbgl/gl/headless_backend.cpp
        PRIVATE platform/default/mbgl/gl/headless_backend.hpp

        # Thread pool
        PRIVATE platform/default/mbgl/util/shared_thread_pool.cpp
        PRIVATE platform/default/mbgl/util/shared_thread_pool.hpp
        PRIVATE platform/default/mbgl/util/default_thread_pool.cpp
        PRIVATE platform/default/mbgl/util/default_thread_pool.hpp
    )

    target_include_directories(mbgl-core
        PUBLIC platform/default
        PRIVATE platform/zing "c:/git/zing/windows/3rdparty/angle" "c:/git/zing/zing/zlib"
    )

    if (CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
        target_add_mason_package(mbgl-core PRIVATE optional)
        target_add_mason_package(mbgl-core PRIVATE tao_tuple)

        add_definitions("-DMBGL_USE_GLES2=1")
        add_definitions("-D_USE_MATH_DEFINES")

        add_definitions("-Wno-deprecated-declarations")
        add_definitions("-Wno-macro-redefined")
        add_definitions("-Wno-microsoft-exception-spec")
        add_definitions("-Wno-unknown-argument")
        add_definitions("-Wno-unknown-warning-option")
        add_definitions("-Wno-unused-command-line-argument")
        add_definitions("-Wno-unused-local-typedef")
        add_definitions("-Wno-unused-private-field")
    endif()

endmacro()

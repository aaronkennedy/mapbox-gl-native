
macro(mbgl_platform_core)

    target_sources(mbgl-core
        # Thread pool
        PRIVATE platform/default/mbgl/util/shared_thread_pool.cpp
        PRIVATE platform/default/mbgl/util/shared_thread_pool.hpp
        PRIVATE platform/default/mbgl/util/default_thread_pool.cpp
        PRIVATE platform/default/mbgl/util/default_thread_pool.hpp
    )

    target_include_directories(mbgl-core
        PUBLIC platform/default
        PRIVATE platform/zing
    )

    if (CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
        add_definitions(-D__WIN__)
        add_definitions(-DMBGL_USE_GLES2=1)
    endif()

endmacro()

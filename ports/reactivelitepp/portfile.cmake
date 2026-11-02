vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO herveer/ReactiveLitepp
    REF "v${VERSION}"
    SHA512 260f3ae35ec7880a801bd424af80aa8b0657a5ca3bc95affa0aa183d24fb6a80299b7b1c6723c0c917e817f29fd90bd8db52b05954fd6f47a3f5f58b05686a6a
    HEAD_REF main
)

set(VCPKG_BUILD_TYPE release)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTS=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/README.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
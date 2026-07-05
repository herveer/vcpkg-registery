vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO herve-er/hue4cpp
    REF "v${VERSION}"
    SHA512 82c8c0140fc5258fc93f6083cf5d54327baac1cca677e7e785b025fd5fa24552e70fcebbfc860534e12d26deb5282a77e76b00f1cbdde20781ec3711479d9834
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTS=OFF
        -DBUILD_EXAMPLES=OFF
        -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/hue4cpp)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/README.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO MersenneTwister-Lab/SFMT
  REF ${VERSION}
  SHA512 1f955e2565e3c983338af3c0d180006b92fc428c1197657a0baf3c3dbf963d9ed4942a883cea9846745e2ae9f2eccf06857847db4818fad031a8e98bfb2f045f
  HEAD_REF master
  PATCHES
    add-cmake-support.patch
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

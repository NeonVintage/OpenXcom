# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BUILD_SOURCE_DIRS "D:/Users/Syn/Nextcloud_sitrep/MorePython/Games/OpenXcom;D:/Users/Syn/Nextcloud_sitrep/MorePython/Games/OpenXcom/build")
set(CPACK_BUNDLE_ICON "D:/Users/Syn/Nextcloud_sitrep/MorePython/Games/OpenXcom/res/mac/AppIcon.icns")
set(CPACK_BUNDLE_NAME "OpenXcom")
set(CPACK_BUNDLE_PLIST "D:/Users/Syn/Nextcloud_sitrep/MorePython/Games/OpenXcom/build/openxcom.app/Contents/Info.plist")
set(CPACK_CMAKE_GENERATOR "Visual Studio 18 2026")
set(CPACK_COMPONENTS_ALL "")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "D:/Programs/CMake/share/cmake-4.2/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "OpenXcom built using CMake")
set(CPACK_DMG_SLA_USE_RESOURCE_FILE_LICENSE "ON")
set(CPACK_GENERATOR "TXZ")
set(CPACK_INNOSETUP_ARCHITECTURE "x64")
set(CPACK_INSTALL_CMAKE_PROJECTS "D:/Users/Syn/Nextcloud_sitrep/MorePython/Games/OpenXcom/build;OpenXcom;ALL;/")
set(CPACK_INSTALL_PREFIX "C:/Program Files (x86)/OpenXcom")
set(CPACK_MODULE_PATH "D:/Users/Syn/Nextcloud_sitrep/MorePython/Games/OpenXcom/cmake/modules")
set(CPACK_NSIS_DISPLAY_NAME "OpenXcom")
set(CPACK_NSIS_DISPLAY_NAME_SET "TRUE")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES64")
set(CPACK_NSIS_MODIFY_PATH "OFF")
set(CPACK_NSIS_PACKAGE_NAME "OpenXcom")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OUTPUT_CONFIG_FILE "D:/Users/Syn/Nextcloud_sitrep/MorePython/Games/OpenXcom/build/CPackConfig.cmake")
set(CPACK_PACKAGE_CONTACT "The OpenXcom project (http://www.openxcom.org)")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "D:/Users/Syn/Nextcloud_sitrep/MorePython/Games/OpenXcom/cmake/modules/Description.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Open-source clone of UFO: Enemy Unknown")
set(CPACK_PACKAGE_FILE_NAME "OpenXcom-1.0.1edb0a5a2-dirty-win64")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "OpenXcom 1.0.1edb0a5a2-dirty")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "OpenXcom 1.0.1edb0a5a2-dirty")
set(CPACK_PACKAGE_NAME "OpenXcom")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "The OpenXcom project")
set(CPACK_PACKAGE_VERSION "1.0.1edb0a5a2-dirty")
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "0")
set(CPACK_PACKAGE_VERSION_PATCH "1edb0a5a2-dirty")
set(CPACK_RESOURCE_FILE_LICENSE "D:/Users/Syn/Nextcloud_sitrep/MorePython/Games/OpenXcom/LICENSE.txt")
set(CPACK_RESOURCE_FILE_README "D:/Users/Syn/Nextcloud_sitrep/MorePython/Games/OpenXcom/README.md")
set(CPACK_RESOURCE_FILE_WELCOME "D:/Programs/CMake/share/cmake-4.2/Templates/CPack.GenericWelcome.txt")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_GENERATOR "TXZ")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "D:/Users/Syn/Nextcloud_sitrep/MorePython/Games/OpenXcom/build/CPackSourceConfig.cmake")
set(CPACK_SYSTEM_NAME "win64")
set(CPACK_THREADS "1")
set(CPACK_TOPLEVEL_TAG "win64")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "D:/Users/Syn/Nextcloud_sitrep/MorePython/Games/OpenXcom/build/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()

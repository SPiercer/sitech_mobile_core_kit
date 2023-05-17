#include "include/showcase/showcase_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "showcase_plugin.h"

void ShowcasePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  showcase::ShowcasePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <showcase/showcase_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) showcase_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ShowcasePlugin");
  showcase_plugin_register_with_registrar(showcase_registrar);
}

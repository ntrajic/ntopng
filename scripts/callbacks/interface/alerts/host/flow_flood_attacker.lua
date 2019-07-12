--
-- (C) 2019 - ntop.org
--

local alerts_api = require("alerts_api")
local alert_consts = require("alert_consts")

local check_module = {
  key = "flow_flood_attacker",
  alert_type = alert_consts.alert_types.threshold_cross,
  check_function = alerts_api.threshold_check_function,

  gui = {
    i18n_title = "entity_thresholds.flow_attacker_title",
    i18n_description = "entity_thresholds.flow_attacker_description",
    i18n_field_unit = alert_consts.field_units.flow_sec,
    input_builder = alerts_api.threshold_cross_input_builder,
    field_max = 65535
  }
}

-- #################################################################

function check_module.get_threshold_value(granularity, info)
  return(info["hits.flow_flood_attacker"] or 0)
end

-- #################################################################

return check_module

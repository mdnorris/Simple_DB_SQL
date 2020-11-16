-- cretae payor table
SELECT id AS payor_id,
  name AS payor_name,
  insurance_id AS payor_insurance_id,
  tag AS payor_tag,
  enabled_for_matching AS payor_matching_enabled,
  trading_partner_id AS payor_trading_id,
  trading_partner_name As payor_trading_name,
  type AS payor_type,
  network_state AS payor_state,
  eap AS eap_status,
  freshsales_tag AS payor_freshsales_tag
FROM provider_network_companies;

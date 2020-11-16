SELECT id AS claim_id,
  patient_id AS claim_patient_id,
  client_referral_id AS claim_referral_id,
  persona_provider_id AS claim_persona_provider_id,
  date_of_service AS claim_date_of_service,
  created_at AS claim_created_at,
  provider_submitted_at AS claim_submitted_on,
  last_submitted_to_insurance AS claim_last_submission
FROM super_bills;

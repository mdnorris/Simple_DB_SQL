SELECT sb.id as claim_id,
  sb.patient_id AS patient_claim_id,
  sb.date_of_service AS patient_date_of_service,
  sb.postal_code::TEXT AS patient_zip_code,
  FLOOR((CURRENT_DATE - sb.date_of_birth) / 365.25),
  sb.persona_provider_id AS patient_claim_provider,
  pa.id AS patient_id,
  pa.active AS patient_active,
  pa.gender_id AS patient_gender
FROM super_bills AS sb
LEFT JOIN patients AS pa
ON sb.patient_id = pa.id;

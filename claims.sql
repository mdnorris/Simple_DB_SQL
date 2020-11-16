-- query for claims TABLE

SELECT claim.id AS claim_id,
	claim.patient_id AS claim_patient_id,
  ROW_NUMBER() OVER(PARTITION BY claim.patient_id
  ORDER BY claim.patient_id, claim.date_of_service) AS
  patient_visit_number,
	claim.client_referral_id AS claim_inquiry_id,
	claim.client_referral_member_id AS claim_referral_member_id,
	claim.persona_provider_id AS claim_persona_provider_id,
	claim.date_of_service AS claim_service_date,
	claim.balance_responsible_party AS
	claim_balance_responsibility,
	claim.aasm_state AS claim_state,
	claim.updated_at AS claim_updated_at,
	claim.patient_responsibility AS
	claim_patient_responsibility,
	claim.negotiated_rate AS claim_negotiated_rate,
	claim.historical AS claim_historical,
	claim.not_responsible_for_payment AS
	claim_not_responsible,
  FLOOR((CURRENT_DATE - claim.date_of_birth) / 365.25) AS
	claim_patient_age,
	claim.postal_code AS claim_zip,
	claim.account_payment_method_id AS claim_payment_method,
	sbp.id AS claim_payment_id,
	sbp.paid_amount AS claim_paid_amount,
	sbp.payment_date AS claim_payment_date,
	sbp.created_at AS claim_payment_created_at,
	sbp.updated_at AS claim_payment_updated_at,
	sbp.aasm_state AS claim_payment_state,
	sbp.eob_identifier AS claim_eob_identifier,
	sbp.eob_id AS claim_eob_id,
	sbp.csc_id AS claim_csc_id,
	sbi.id AS claim_insurances_id,
	sbi.super_bill_id AS insurance_claim_id,
	sbi.patient_insurance_id AS claim_patient_insurance_id
FROM super_bills AS claim
LEFT JOIN super_bill_insurances AS sbi
ON claim.id = sbi.super_bill_id
LEFT JOIN super_bill_payments AS sbp
ON sbi.id = sbp.super_bill_insurance_id;

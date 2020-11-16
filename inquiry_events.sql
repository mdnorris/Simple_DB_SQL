--create referral_events TABLE

SELECT
	  cr.id AS inquiry_id,
	  cr.inquiry_number,
    cr.persona_client_id AS inquiry_client_id,
		crm.id AS client_referral_member_id,
    claim.patient_id AS claim_patient_id,
    crm.persona_provider_id AS persona_provider_id,
    cr.created_at AS inquiry_created_time,
    cr.notified_at AS client_portal_request,
    crm.notified_at AS inquiry_provider_notified_time,
    crm.accepted_at AS inquiry_provider_accepted_time,
    crm.scheduled_at AS inquiry_scheduled_time,
    claim.date_of_service AS claim_service_date,
		ce.client_referral_member_id,
		ce.start_time AS calendar_scheduled_time
FROM
  	( SELECT *
	FROM (
	SELECT * , ROW_NUMBER()
	OVER(PARTITION BY claim2.patient_id
  		ORDER BY claim2.patient_id, claim2.date_of_service)
		AS patient_visit_number
		FROM super_bills as claim2) AS claim2
    WHERE claim2.patient_visit_number = 1 OR
    claim2.date_of_service IS NULL) AS claim
RIGHT JOIN client_referral_members AS crm
ON claim.patient_id = crm.patient_id
LEFT JOIN
	( SELECT *
	 	FROM (
		SELECT * , ROW_NUMBER()
		OVER(PARTITION BY cr2.id
  		ORDER BY cr2.id, cr2.created_at, cr2.notified_at)
		AS inquiry_number
		FROM client_referrals as cr2) AS cr2) AS cr
--  WHERE (cr2.inquiry_number <= 2 AND
--		claim.date_of_service IS NULL)) AS cr
ON cr.id = crm.client_referral_id
LEFT JOIN calendar_events AS ce
ON crm.id = ce.client_referral_member_id;

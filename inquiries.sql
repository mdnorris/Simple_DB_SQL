-- gets data for inquiries table
SELECT cr.id AS inquiry_id,
	cr.referral_key AS inquiry_referral_key,
	cr.persona_client_id AS inquiry_persona_id,
	cr.gender_id AS inquiry_gender,
	cr.referral_source AS inquiry_referral_source,
	FLOOR((CURRENT_DATE - cr.contact_birthdate) / 365.25)
	AS inquiry_contact_age,
	pc.id AS persona_inquiry_id,
	pc.user_id AS inquiry_user_id,
	us.id AS user_id,
	us.sign_in_count AS inquiry_signin_count,
	us.last_sign_in_at AS inquiry_last_signin_at,
	us.account_state AS inquiry_account_state,
	us.expired_at AS inquiry_account_expired_at,
	crm.client_referral_id AS inquiry_referral_id,
	crm.notified_at AS inquiry_notified_at,
	crm.declined_at AS provider_declined_at,
	crm.decline_reason_id AS provider_declined_reason,
	crm.scheduled_at AS inquiry_scheduled_at
FROM client_referrals AS cr
LEFT JOIN persona_clients AS pc
ON cr.persona_client_id = pc.id
LEFT JOIN users AS us
ON pc.user_id = us.id
LEFT JOIN client_referral_members AS crm
ON cr.id = crm.client_referral_id;

-- pull inquiry_referral data

SELECT *
	FROM
	((SELECT id AS source_id, form_data::jsonb -> 6 ->> 'value' AS form_referral_source
			FROM client_referrals
		    WHERE form_data::jsonb -> 6 ->> 'name' = 'referralSource')
	UNION (SELECT id, form_data::jsonb -> 7 ->> 'value' AS referral_source
			FROM client_referrals
			WHERE form_data::jsonb -> 7 ->> 'name' = 'referralSource')
	UNION (SELECT id, form_data::jsonb -> 9 ->> 'value' AS referral_source
			FROM client_referrals
			WHERE form_data::jsonb -> 9 ->> 'name' = 'referralSource')) AS rs
	FULL JOIN
	((SELECT id AS ins_id, form_data::jsonb -> 13 ->> 'value' AS insurance_pref
		  FROM client_referrals
			WHERE form_data::jsonb -> 13 ->> 'name' = 'insurancePref')
	UNION (SELECT id, form_data::jsonb -> 14 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 14 ->> 'name' = 'insurancePref')
	UNION (SELECT id, form_data::jsonb -> 15 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 15 ->> 'name' = 'insurancePref')
	UNION (SELECT id, form_data::jsonb -> 16 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 16 ->> 'name' = 'insurancePref')
	UNION (SELECT id, form_data::jsonb -> 17 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 17 ->> 'name' = 'insurancePref')) AS ip
			ON rs.source_id = ip.ins_id
	FULL JOIN
	(SELECT id AS referral_id,
			created_at AS referral_created_at,
			referral_source AS inquiry_referral_source
	FROM client_referrals AS cr) AS cr
	ON rs.source_id = cr.referral_id;

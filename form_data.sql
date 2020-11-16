-- form data query

SELECT *
	FROM
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
	FULL JOIN
	((SELECT id AS time_pref_id, form_data::jsonb -> 13 ->> 'value' AS time_dist_pref
			FROM client_referrals
		    WHERE form_data::jsonb -> 13 ->> 'name' = 'distanceOrTimePref')
	UNION (SELECT id, form_data::jsonb -> 14 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 14 ->> 'name' = 'distanceOrTimePref')
	UNION (SELECT id, form_data::jsonb -> 15 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 15 ->> 'name' = 'distanceOrTimePref')
	UNION (SELECT id, form_data::jsonb -> 16 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 16 ->> 'name' = 'distanceOrTimePref')
	UNION (SELECT id, form_data::jsonb -> 17 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 17 ->> 'name' = 'distanceOrTimePref')) AS dtp
	ON ip.ins_id = dtp.time_pref_id
	FULL JOIN
	((SELECT id AS reason_id, form_data::jsonb -> 5 ->> 'value' AS reason
			FROM client_referrals
				WHERE form_data::jsonb -> 5 ->> 'name' = 'reason')
	UNION (SELECT id, form_data::jsonb -> 6 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 6 ->> 'name' = 'reason')
	UNION (SELECT id, form_data::jsonb -> 7 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 7 ->> 'name' = 'reason')
	UNION (SELECT id, form_data::jsonb -> 8 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 8 ->> 'name' = 'reason')
	UNION (SELECT id, form_data::jsonb -> 9 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 9 ->> 'name' = 'reason')
	UNION (SELECT id, form_data::jsonb -> 4 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 4 ->> 'name' = 'reason')
	UNION (SELECT id, form_data::jsonb -> 10 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 10 ->> 'name' = 'reason')
	UNION (SELECT id, form_data::jsonb -> 11 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 11 ->> 'name' = 'reason')
	UNION (SELECT id, form_data::jsonb -> 12 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 12 ->> 'name' = 'reason')) AS reason
	ON ip.ins_id = reason.reason_id
	FULL JOIN
	((SELECT id AS tg_id, form_data::jsonb -> 5 ->> 'value' AS therapist_gender
			FROM client_referrals
				WHERE form_data::jsonb -> 5 ->> 'name' = 'therapistGender')
	UNION (SELECT id, form_data::jsonb -> 6 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 6 ->> 'name' = 'therapistGender')
	UNION (SELECT id, form_data::jsonb -> 7 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 7 ->> 'name' = 'therapistGender')
	UNION (SELECT id, form_data::jsonb -> 8 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 8 ->> 'name' = 'therapistGender')
	UNION (SELECT id, form_data::jsonb -> 9 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 9 ->> 'name' = 'therapistGender')
	UNION (SELECT id, form_data::jsonb -> 4 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 4 ->> 'name' = 'therapistGender')
	UNION (SELECT id, form_data::jsonb -> 10 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 10 ->> 'name' = 'therapistGender')
	UNION (SELECT id, form_data::jsonb -> 11 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 11 ->> 'name' = 'therapistGender')
	UNION (SELECT id, form_data::jsonb -> 12 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 12 ->> 'name' = 'therapistGender')) AS tg
	ON ip.ins_id = tg.tg_id
	FULL JOIN
	((SELECT id AS pp_id, form_data::jsonb -> 7 ->> 'value' AS payment_prefererence
			FROM client_referrals
				WHERE form_data::jsonb -> 7 ->> 'name' = 'paymentPref')
	UNION (SELECT id, form_data::jsonb -> 8 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 8 ->> 'name' = 'paymentPref')
	UNION (SELECT id, form_data::jsonb -> 9 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 9 ->> 'name' = 'paymentPref')
	UNION (SELECT id, form_data::jsonb -> 10 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 10 ->> 'name' = 'paymentPref')
	UNION (SELECT id, form_data::jsonb -> 11 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 11 ->> 'name' = 'paymentPref')
	UNION (SELECT id, form_data::jsonb -> 12 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 12 ->> 'name' = 'paymentPref')
	UNION (SELECT id, form_data::jsonb -> 13 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 13 ->> 'name' = 'paymentPref')
	UNION (SELECT id, form_data::jsonb -> 14 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 14 ->> 'name' = 'paymentPref')
	UNION (SELECT id, form_data::jsonb -> 15 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 15 ->> 'name' = 'paymentPref')) AS pp
	ON ip.ins_id = pp.pp_id
	FULL JOIN
	((SELECT id AS dist_id, form_data::jsonb -> 7 ->> 'value' AS distance
			FROM client_referrals
			WHERE form_data::jsonb -> 7 ->> 'name' = 'distance')
	UNION (SELECT id, form_data::jsonb -> 8 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 8 ->> 'name' = 'distance')
	UNION (SELECT id, form_data::jsonb -> 9 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 9 ->> 'name' = 'distance')
	UNION (SELECT id, form_data::jsonb -> 10 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 10 ->> 'name' = 'distance')
	UNION (SELECT id, form_data::jsonb -> 11 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 11 ->> 'name' = 'distance')
	UNION (SELECT id, form_data::jsonb -> 12 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 12 ->> 'name' = 'distance')
	UNION (SELECT id, form_data::jsonb -> 13 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 13 ->> 'name' = 'distance')
	UNION (SELECT id, form_data::jsonb -> 14 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 14 ->> 'name' = 'distance')
	UNION (SELECT id, form_data::jsonb -> 15 ->> 'value'
			FROM client_referrals
			WHERE form_data::jsonb -> 15 ->> 'name' = 'distance')) AS dist
    ON ip.ins_id = dist.dist_id;

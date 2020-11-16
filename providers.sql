-- create provider TABLE

SELECT pp.id AS persona_provider_id,
	pp.user_id AS persona_provider_user_id,
	pp.npi AS provider_npi,
	pp.accepting_clients AS provider_accepting_clients,
	pp.education_level_id AS provider_education,
	pp.matching_enabled AS provider_matching_enabled,
	pp.freshsales_contact_id AS provider_freshsales_id,
	up.user_id,
	up.first_name AS provider_fname,
	up.middle_name AS provider_mname,
	up.birth_date AS provider_lname,
	up.phone_number AS provider_phone,
	up.mailing_address AS provider_address,
	up.mailing_address_line2 AS provider_address2,
	up.mailing_city AS provider_city,
	up.mailing_postal_code AS provider_zip,
	up.gender_id AS provider_gender
FROM persona_providers AS pp
	LEFT JOIN user_profiles AS up
	ON pp.user_id = up.user_id;

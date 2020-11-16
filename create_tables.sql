DROP TABLE claims;

CREATE TABLE claims (
  claim_id INT,
  claim_patient_id INT,
  patient_visit_number INT,
  claim_inquiry_id INT,
  claim_referral_member_id INT,
  claim_persona_provider_id INT,
  claim_service_date DATE,
  claim_balance_responsibility VARCHAR,
  claim_state VARCHAR,
  claim_updated_at TIMESTAMP,
  claim_patient_responsibility NUMERIC(10,2),
  claim_negotiated_rate NUMERIC(10,2),
  claim_historical BOOLEAN,
  claim_not_responsible BOOLEAN,
  claim_patient_age INT,
  claim_zip TEXT,
  claim_payment_method INT,
  claim_payment_id INT,
  claim_paid_amount NUMERIC(10,2),
  claim_payment_date DATE,
  claim_payment_created_at TIMESTAMP,
  claim_payment_updated_at TIMESTAMP,
  claim_payment_state VARCHAR,
  claim_eob_identifier VARCHAR,
  claom_eob_id INT,
  claim_csc_id INT,
  claim_insurance_id INT,
  insurance_claim_id INT,
  claim_patient_insurance_id INT);

  -- creates claim events TABLE

DROP TABLE claim_events;

CREATE TABLE claim_events (
  claim_id INT,
  claim_patient_id INT,
  claim_referral_id INT,
  claim_persona_provider_id INT,
  claim_date_of_service DATE,
  claim_created_at TIMESTAMP,
  claim_submitted_on TIMESTAMP,
  claim_last_submission TIMESTAMP);

-- create table for form_data
DROP TABLE form_data;

CREATE TABLE form_data (
  ins_id INT,
  insurance_pref TEXT,
  time_pref_id INT,
  time_dist_pref TEXT,
  reason_id INT,
  reason TEXT,
  tg_id INT,
  therapist_gender TEXT,
  pp_id INT,
  payment_prefererence TEXT,
  dist_id INT,
  distance INT);

-- create inquiries table

DROP TABLE inquiries;

CREATE TABLE inquiries (
  inquiry_id INT,
  inquiry_referral_key VARCHAR,
  inquiry_persona_id INT,
  inquiry_gender INT, --this is one of three answers, male, female, other
  inquiry_referral_source VARCHAR,
  inquiry_contact_age INT,
  persona_inquiry_id INT,
  inquiry_user_id INT,
  user_id INT,
  inquiry_signin_count INT,
  inquiry_last_signin_at TIMESTAMP,
  inquiry_account_state VARCHAR,
  inquiry_account_expired_at TIMESTAMP,
  inquiry_referral_id INT,
  inquiry_notified_at TIMESTAMP,
  provider_declined_at TIMESTAMP,
  provider_declined_reason INT,
  inquiry_scheduled_at TIMESTAMP);

-- creates table inquiry_events

DROP TABLE inquiry_events;

CREATE TABLE inquiry_events (
    inquiry_id INT,
    inquiry_number INT,
    inquiry_client_id INT,
    claim_patient_id INT,
    persona_provider_id INT,
    inquiry_created_time TIMESTAMP,
    client_portal_request TIMESTAMP,
    inquiry_provider_notified_time TIMESTAMP,
    inquiry_provider_accepted_time TIMESTAMP,
    inquiry_scheduled_time TIMESTAMP,
    claim_service_date DATE);

-- create patients table
DROP TABLE patients;

CREATE TABLE patients (
    claim_id INT,
    patient_claim_id INT,
    patient_date_of_service DATE,
    patient_zip_code TEXT,
    patient_age INT,
    patient_claim_provider INT,
    patient_id INT,
    patient_active BOOLEAN,
    patient_gender INT);

-- create payor table

DROP TABLE payors;

CREATE TABLE payors (
  payor_id INT,
  payor_name VARCHAR,
  payor_insurance_id INT,
  payor_tag VARCHAR,
  payor_matching_enabled BOOLEAN,
  payor_trading_id VARCHAR,
  payor_trading_name VARCHAR,
  payor_type VARCHAR,
  payor_state VARCHAR,
  eap_status BOOLEAN,
  payor_freshsales_tag TEXT);

--create provider TABLE

DROP TABLE providers;

CREATE TABLE providers (
    persona_provider_id INT,
    persona_provider_user_id INT,
    provider_npi TEXT,
    provider_accepting_clients BOOLEAN,
    provider_education INT,
    provider_matching_enabled BOOLEAN,
    provider_freshsales_id TEXT,
    user_id INT,
    provider_fname VARCHAR,
    provider_mname VARCHAR,
    provider_lname VARCHAR,
    provider_phone VARCHAR,
    provider_address VARCHAR,
    provider_address2 VARCHAR,
    provider_city VARCHAR,
    provider_zip TEXT,
    provider_gender INT);

-- creates reference_data table

DROP TABLE reference_data;

CREATE TABLE reference_data (
  reference_id INT,
  reference_title VARCHAR,
  reference_type VARCHAR,
  reference_tag VARCHAR,
  reference_description TEXT);

-- create inquiry_referral_source TABLE
DROP TABLE referral_source;

CREATE TABLE referral_source (
  source_id INT,
  form_referral_source TEXT,
  ins_id INT,
  insurance_pref TEXT,
  referral_id INT,
  referral_created_at TIMESTAMP,
  inquiry_referral_source VARCHAR);



-- create zip TABLE
DROP TABLE zips;

CREATE TABLE zips (
  zip INT,
  county_name VARCHAR,
  state VARCHAR,
  st_county_fip INT,
  class_fip VARCHAR);

-- +goose Up
-- +goose StatementBegin
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE SCHEMA IF NOT EXISTS utils;

-- Function to generate ulid::uuid as increment index with sorting option
CREATE OR REPLACE FUNCTION utils.new_ulid() RETURNS text
AS $$
SELECT lpad(to_hex(floor(extract(epoch FROM clock_timestamp()) * 1000)::bigint), 12, '0') || encode(gen_random_bytes(10), 'hex');
$$ LANGUAGE SQL;

-- Function converts generated ulid to uiid
CREATE OR REPLACE FUNCTION utils.new_uuid() RETURNS uuid
AS $$
SELECT utils.new_ulid()::uuid;
$$ LANGUAGE SQL;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
drop function if exists utils.new_uuid;
drop function if exists utils.new_ulid;
drop schema if exists utils;
drop extension if exists pgcrypto;
-- +goose StatementEnd

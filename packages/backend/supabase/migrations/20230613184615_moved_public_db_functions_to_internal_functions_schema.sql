create schema if not exists "internal_functions" AUTHORIZATION postgres;

-- Enable the "pg_jsonschema" extension
create extension IF NOT EXISTS pg_jsonschema with schema extensions;

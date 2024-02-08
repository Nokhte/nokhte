alter table "public"."active_nokhte_sessions" add column "metadata_index" smallint not null default '0'::smallint;

alter table "public"."active_nokhte_sessions" alter column "current_phases" set default '{1,1}'::real[];

alter table "public"."active_nokhte_sessions" alter column "current_phases" set data type real[] using "current_phases"::real[];

alter table "public"."finished_nokhte_sessions" add column "session_metadata" jsonb[] not null;

alter table "public"."finished_nokhte_sessions" add column "session_timestamp" timestamp with time zone not null;


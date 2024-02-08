alter table "public"."active_nokhte_sessions" add column "session_metadata" jsonb[] not null default '{}'::jsonb[];

alter table "public"."active_nokhte_sessions" alter column "is_online" set not null;


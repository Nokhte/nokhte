alter table "public"."active_irl_nokhte_sessions" drop constraint "active_irl_nokhte_sessions_meeting_uid_fkey";

alter table "public"."active_irl_nokhte_sessions" drop constraint "active_irl_nokhte_sessions_speaker_spotlight_fkey";

alter table "public"."active_irl_nokhte_sessions" drop column "meeting_uid";

alter table "public"."active_irl_nokhte_sessions" drop column "metadata_index";

alter table "public"."active_irl_nokhte_sessions" drop column "session_metadata";

alter table "public"."active_irl_nokhte_sessions" drop column "speaker_spotlight";

alter table "public"."active_irl_nokhte_sessions" add column "content" text[] not null default '{}'::text[];

alter table "public"."finished_nokhte_sessions" drop column "session_metadata";

alter table "public"."finished_nokhte_sessions" add column "content" text[] not null default '{}'::text[];
alter table "public"."active_irl_nokhte_sessions" add column "meeting_uid" uuid not null default gen_random_uuid();

alter table "public"."active_irl_nokhte_sessions" alter column "meeting_uid" drop default;

alter table "public"."active_irl_nokhte_sessions" add column "has_begun" boolean not null default false;

alter table "public"."active_irl_nokhte_sessions" drop column "meeting_uid";

alter table "public"."active_irl_nokhte_sessions" add column "leader_uid" uuid not null;
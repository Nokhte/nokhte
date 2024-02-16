alter table "public"."active_nokhte_sessions" add column "created_at" timestamp with time zone not null default now();

alter table "public"."active_nokhte_sessions" add column "current_phases" smallint[] not null default '{1,1}'::smallint[];

alter table "public"."active_nokhte_sessions" add column "is_online" boolean[] default '{f,f}'::boolean[];

alter table "public"."active_nokhte_sessions" add column "speaker_spotlight" uuid;

alter table "public"."active_nokhte_sessions" add constraint "active_nokhte_sessions_current_phases_check" CHECK ((array_length(current_phases, 1) = 2)) not valid;

alter table "public"."active_nokhte_sessions" validate constraint "active_nokhte_sessions_current_phases_check";

alter table "public"."active_nokhte_sessions" add constraint "active_nokhte_sessions_is_online_check" CHECK ((array_length(is_online, 1) = 2)) not valid;

alter table "public"."active_nokhte_sessions" validate constraint "active_nokhte_sessions_is_online_check";

alter table "public"."active_nokhte_sessions" add constraint "active_nokhte_sessions_speaker_spotlight_fkey" FOREIGN KEY (speaker_spotlight) REFERENCES auth.users(id) not valid;

alter table "public"."active_nokhte_sessions" validate constraint "active_nokhte_sessions_speaker_spotlight_fkey";
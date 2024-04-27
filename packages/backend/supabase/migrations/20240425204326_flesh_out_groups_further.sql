alter table "public"."active_irl_nokhte_sessions" add column "speaker_spotlight" uuid;

alter table "public"."active_irl_nokhte_sessions" add constraint "active_irl_nokhte_sessions_leader_uid_fkey" FOREIGN KEY (leader_uid) REFERENCES auth.users(id) not valid;

alter table "public"."active_irl_nokhte_sessions" validate constraint "active_irl_nokhte_sessions_leader_uid_fkey";

alter table "public"."active_irl_nokhte_sessions" add constraint "active_irl_nokhte_sessions_speaker_spotlight_fkey" FOREIGN KEY (speaker_spotlight) REFERENCES auth.users(id) not valid;

alter table "public"."active_irl_nokhte_sessions" validate constraint "active_irl_nokhte_sessions_speaker_spotlight_fkey";

alter table "public"."active_irl_nokhte_sessions" drop constraint "active_nokhte_sessions_current_phases_check";

alter table "public"."active_irl_nokhte_sessions" drop constraint "active_nokhte_sessions_is_online_check";
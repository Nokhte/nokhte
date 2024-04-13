alter table "public"."active_irl_nokhte_sessions" add column "session_uid" uuid not null default gen_random_uuid();

alter table "public"."finished_nokhte_sessions" add column "session_uid" uuid not null;

CREATE UNIQUE INDEX active_irl_nokhte_sessions_session_uid_key ON public.active_irl_nokhte_sessions USING btree (session_uid);

alter table "public"."active_irl_nokhte_sessions" add constraint "active_irl_nokhte_sessions_session_uid_key" UNIQUE using index "active_irl_nokhte_sessions_session_uid_key";
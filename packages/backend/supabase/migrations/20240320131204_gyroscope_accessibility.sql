alter table "public"."active_irl_nokhte_sessions" add column "have_gyroscopes" boolean[] not null default '{t,t}'::boolean[];
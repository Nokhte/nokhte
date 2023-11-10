alter table "public"."collective_sessions" add column "collaborator_one_individual_session_metadata" jsonb;

alter table "public"."collective_sessions" add column "collaborator_one_individual_session_timestamp" timestamp with time zone;

alter table "public"."collective_sessions" add column "collaborator_two_individual_session_metadata" jsonb;

alter table "public"."collective_sessions" add column "collaborator_two_individual_session_timestamp" timestamp with time zone;

CREATE UNIQUE INDEX collective_sessions_collaborator_one_individual_session_tim_key ON public.collective_sessions USING btree (collaborator_one_individual_session_timestamp);

alter table "public"."collective_sessions" add constraint "collective_sessions_collaborator_one_individual_session_m_check" CHECK (is_valid_individual_session_metadata_jsonb(collaborator_one_individual_session_metadata)) not valid;

alter table "public"."collective_sessions" validate constraint "collective_sessions_collaborator_one_individual_session_m_check";

alter table "public"."collective_sessions" add constraint "collective_sessions_collaborator_one_individual_session_tim_key" UNIQUE using index "collective_sessions_collaborator_one_individual_session_tim_key";

alter table "public"."collective_sessions" add constraint "collective_sessions_collaborator_two_individual_session_m_check" CHECK (is_valid_individual_session_metadata_jsonb(collaborator_two_individual_session_metadata)) not valid;

alter table "public"."collective_sessions" validate constraint "collective_sessions_collaborator_two_individual_session_m_check";
alter table "public"."existing_collaborations" add column "who_gets_the_question" bigint;

alter table "public"."p2p_collaborator_pool" drop column "entered_at";

alter table "public"."p2p_collaborator_pool" drop column "expires_at";
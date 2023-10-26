alter table "public"."existing_collaborations" alter column "who_gets_the_question" set not null;

alter table "public"."solo_p2p_purpose_documents" add column "created_at" timestamp with time zone default now();
alter table "public"."working_collaborative_documents" drop column "content";

alter table "public"."working_collaborative_documents" add column "collaborator_one_content" text not null default ''::text;

alter table "public"."working_collaborative_documents" add column "collaborator_two_content" text not null default ''::text;
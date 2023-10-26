alter table "public"."working_collaborative_documents" add column "last_edited_by" uuid;

alter table "public"."working_collaborative_documents" add constraint "working_collaborative_documents_last_edited_by_fkey" FOREIGN KEY (last_edited_by) REFERENCES auth.users(id) not valid;

alter table "public"."working_collaborative_documents" validate constraint "working_collaborative_documents_last_edited_by_fkey";
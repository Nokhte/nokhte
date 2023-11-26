alter table "public"."existing_collaborations" drop constraint "existing_collaborations_who_is_talking_fkey";

alter table "public"."existing_collaborations" drop column "who_is_talking";

alter table "public"."existing_collaborations" add column "talking_queue" uuid[] not null default '{}'::uuid[];
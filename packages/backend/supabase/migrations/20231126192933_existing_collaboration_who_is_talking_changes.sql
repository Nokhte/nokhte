alter table "public"."existing_collaborations" drop constraint "existing_collaborations_who_is_talking_fkey";

alter table "public"."existing_collaborations" alter column "who_is_talking" set not null;

alter table "public"."existing_collaborations" alter column "who_is_talking" set data type uuid[] using "who_is_talking"::uuid[]; 
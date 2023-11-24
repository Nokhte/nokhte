alter table "public"."existing_collaborations" add column "who_is_talking" uuid;

alter table "public"."existing_collaborations" add constraint "existing_collaborations_who_gets_the_question_check" CHECK ((who_gets_the_question = ANY (ARRAY[(1)::bigint, (2)::bigint]))) not valid;

alter table "public"."existing_collaborations" validate constraint "existing_collaborations_who_gets_the_question_check";

alter table "public"."existing_collaborations" add constraint "existing_collaborations_who_is_talking_fkey" FOREIGN KEY (who_is_talking) REFERENCES auth.users(id) not valid;

alter table "public"."existing_collaborations" validate constraint "existing_collaborations_who_is_talking_fkey";
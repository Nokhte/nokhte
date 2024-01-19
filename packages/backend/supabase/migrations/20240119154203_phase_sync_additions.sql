alter table "public"."existing_collaborations" add column "current_phases" smallint[] not null default '{0,0}'::smallint[];

alter table "public"."existing_collaborations" add constraint "existing_collaborations_current_phases_check" CHECK ((array_length(current_phases, 1) = 2)) not valid;

alter table "public"."existing_collaborations" validate constraint "existing_collaborations_current_phases_check";

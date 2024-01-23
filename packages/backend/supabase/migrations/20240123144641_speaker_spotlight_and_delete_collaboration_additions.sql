
alter table "public"."existing_collaborations" drop column "talking_queue";

alter table "public"."existing_collaborations" add column "speaker_spotlight" uuid;

alter table "public"."existing_collaborations" add constraint "existing_collaborations_speaker_spotlight_fkey" FOREIGN KEY (speaker_spotlight) REFERENCES auth.users(id) not valid;

alter table "public"."existing_collaborations" validate constraint "existing_collaborations_speaker_spotlight_fkey";

alter table "public"."existing_collaborations" add column "has_deleted_artifacts" boolean[] not null default '{f,f}'::boolean[];

alter table "public"."existing_collaborations" add constraint "existing_collaborations_has_deleted_artifacts_check" CHECK ((array_length(has_deleted_artifacts, 1) = 2)) not valid;

alter table "public"."existing_collaborations" validate constraint "existing_collaborations_has_deleted_artifacts_check";
alter table "public"."existing_collaborations" add column "collaboration_id" text not null;

CREATE UNIQUE INDEX existing_collaborations_collaboration_id_key ON public.existing_collaborations USING btree (collaboration_id);

alter table "public"."existing_collaborations" add constraint "existing_collaborations_collaboration_id_key" UNIQUE using index "existing_collaborations_collaboration_id_key";
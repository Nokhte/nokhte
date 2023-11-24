alter table "public"."existing_collaborations" add column "is_consecrated" boolean not null default false;

alter table "public"."existing_collaborations" add column "collaborator_one_has_entered" boolean not null default false;

alter table "public"."existing_collaborations" add column "collaborator_two_has_entered" boolean not null default false;
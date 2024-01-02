alter table "public"."user_names" add column "has_gone_through_invitation_flow" boolean not null default false;

alter table "public"."user_names" add column "has_sent_an_invitation" boolean not null default false;
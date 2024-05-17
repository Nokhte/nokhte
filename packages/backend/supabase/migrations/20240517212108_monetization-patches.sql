alter table "public"."user_information" drop column "has_gone_through_invitation_flow";

alter table "public"."user_information" drop column "has_sent_an_invitation";

alter table "public"."user_information" add column "has_accessed_qr_code" boolean not null default false;
alter table "public"."p2p_requests" drop column "isAccepted";
alter table "public"."p2p_requests"
add column "is_accepted" boolean not null default false;
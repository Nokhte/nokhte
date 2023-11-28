alter table "public"."timer_information" drop column "time_remaining_in_milliseconds";

alter table "public"."timer_information" add column "collaborator_one_has_completed_timer" boolean not null default false;

alter table "public"."timer_information" add column "collaborator_two_has_completed_timer" boolean not null default false;
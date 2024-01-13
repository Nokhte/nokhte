alter table "public"."existing_collaborations" drop column "collaborator_one_has_entered";

alter table "public"."existing_collaborations" drop column "collaborator_two_has_entered";

alter table "public"."existing_collaborations" add column "is_on_call" boolean[] not null default '{f,f}'::boolean[];

alter table "public"."existing_collaborations" add column "is_online" boolean[] not null default '{f,f}'::boolean[];

alter table "public"."existing_collaborations" add column "timer_init_status" boolean[] default '{f,f}'::boolean[];

alter table "public"."existing_collaborations" add constraint "existing_collaborations_is_on_call_check" CHECK ((array_length(is_on_call, 1) = 2)) not valid;

alter table "public"."existing_collaborations" validate constraint "existing_collaborations_is_on_call_check";

alter table "public"."existing_collaborations" add constraint "existing_collaborations_is_online_check" CHECK ((array_length(is_online, 1) = 2)) not valid;

alter table "public"."existing_collaborations" validate constraint "existing_collaborations_is_online_check";

alter table "public"."existing_collaborations" add constraint "existing_collaborations_timer_init_status_check" CHECK ((array_length(timer_init_status, 1) = 2)) not valid;

alter table "public"."existing_collaborations" validate constraint "existing_collaborations_timer_init_status_check";

alter table "public"."existing_collaborations" drop constraint "existing_collaborations_timer_init_status_check";

alter table "public"."existing_collaborations" drop column "timer_init_status";

alter table "public"."existing_collaborations" add column "timer_should_run" boolean not null default false;
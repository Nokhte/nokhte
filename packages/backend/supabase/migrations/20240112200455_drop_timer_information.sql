drop policy "Can only Delete Timers They Are Collaborators Over" on "public"."timer_information";

drop policy "Can only Read Timers They Are Collaborators Over" on "public"."timer_information";

drop policy "Can only Update Timers They Are Collaborators Over" on "public"."timer_information";

drop policy "enable insert for authenticated users" on "public"."timer_information";

revoke delete on table "public"."timer_information" from "anon";

revoke insert on table "public"."timer_information" from "anon";

revoke references on table "public"."timer_information" from "anon";

revoke select on table "public"."timer_information" from "anon";

revoke trigger on table "public"."timer_information" from "anon";

revoke truncate on table "public"."timer_information" from "anon";

revoke update on table "public"."timer_information" from "anon";

revoke delete on table "public"."timer_information" from "authenticated";

revoke insert on table "public"."timer_information" from "authenticated";

revoke references on table "public"."timer_information" from "authenticated";

revoke select on table "public"."timer_information" from "authenticated";

revoke trigger on table "public"."timer_information" from "authenticated";

revoke truncate on table "public"."timer_information" from "authenticated";

revoke update on table "public"."timer_information" from "authenticated";

revoke delete on table "public"."timer_information" from "service_role";

revoke insert on table "public"."timer_information" from "service_role";

revoke references on table "public"."timer_information" from "service_role";

revoke select on table "public"."timer_information" from "service_role";

revoke trigger on table "public"."timer_information" from "service_role";

revoke truncate on table "public"."timer_information" from "service_role";

revoke update on table "public"."timer_information" from "service_role";

alter table "public"."timer_information" drop constraint "timer_information_collaborator_one_uid_fkey";

alter table "public"."timer_information" drop constraint "timer_information_collaborator_two_uid_fkey";

alter table "public"."timer_information" drop constraint "timer_information_pkey";

drop index if exists "public"."timer_information_pkey";

drop table "public"."timer_information";
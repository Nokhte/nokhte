drop trigger if exists "collaborator_phrase_assigner" on "public"."user_names";

drop function if exists "public"."generate_random_number"(min_val integer, max_val integer);

drop function if exists "public"."unique_word_id_dispenser"();

drop policy "Can Only Read Their Row" on "public"."collaborator_phrases";

drop policy "Enable insert for authenticated users only" on "public"."collaborator_phrases";

drop policy "SELECT: Authenticated Users can read" on "public"."phrase_components";

revoke delete on table "public"."collaborator_phrases" from "anon";

revoke insert on table "public"."collaborator_phrases" from "anon";

revoke references on table "public"."collaborator_phrases" from "anon";

revoke select on table "public"."collaborator_phrases" from "anon";

revoke trigger on table "public"."collaborator_phrases" from "anon";

revoke truncate on table "public"."collaborator_phrases" from "anon";

revoke update on table "public"."collaborator_phrases" from "anon";

revoke delete on table "public"."collaborator_phrases" from "authenticated";

revoke insert on table "public"."collaborator_phrases" from "authenticated";

revoke references on table "public"."collaborator_phrases" from "authenticated";

revoke select on table "public"."collaborator_phrases" from "authenticated";

revoke trigger on table "public"."collaborator_phrases" from "authenticated";

revoke truncate on table "public"."collaborator_phrases" from "authenticated";

revoke update on table "public"."collaborator_phrases" from "authenticated";

revoke delete on table "public"."collaborator_phrases" from "service_role";

revoke insert on table "public"."collaborator_phrases" from "service_role";

revoke references on table "public"."collaborator_phrases" from "service_role";

revoke select on table "public"."collaborator_phrases" from "service_role";

revoke trigger on table "public"."collaborator_phrases" from "service_role";

revoke truncate on table "public"."collaborator_phrases" from "service_role";

revoke update on table "public"."collaborator_phrases" from "service_role";

revoke delete on table "public"."phrase_components" from "anon";

revoke insert on table "public"."phrase_components" from "anon";

revoke references on table "public"."phrase_components" from "anon";

revoke select on table "public"."phrase_components" from "anon";

revoke trigger on table "public"."phrase_components" from "anon";

revoke truncate on table "public"."phrase_components" from "anon";

revoke update on table "public"."phrase_components" from "anon";

revoke delete on table "public"."phrase_components" from "authenticated";

revoke insert on table "public"."phrase_components" from "authenticated";

revoke references on table "public"."phrase_components" from "authenticated";

revoke select on table "public"."phrase_components" from "authenticated";

revoke trigger on table "public"."phrase_components" from "authenticated";

revoke truncate on table "public"."phrase_components" from "authenticated";

revoke update on table "public"."phrase_components" from "authenticated";

revoke delete on table "public"."phrase_components" from "service_role";

revoke insert on table "public"."phrase_components" from "service_role";

revoke references on table "public"."phrase_components" from "service_role";

revoke select on table "public"."phrase_components" from "service_role";

revoke trigger on table "public"."phrase_components" from "service_role";

revoke truncate on table "public"."phrase_components" from "service_role";

revoke update on table "public"."phrase_components" from "service_role";

alter table "public"."collaborator_phrases" drop constraint "collaborator_phrases_adjective_id_key";

alter table "public"."collaborator_phrases" drop constraint "collaborator_phrases_collaborator_phrase_key";

alter table "public"."collaborator_phrases" drop constraint "collaborator_phrases_noun_id_key";

alter table "public"."collaborator_phrases" drop constraint "collaborator_phrases_uid_fkey";

alter table "public"."p2p_collaborator_pool" drop constraint "p2p_collaborator_pool_matched_adjective_id_fkey";

alter table "public"."p2p_collaborator_pool" drop constraint "p2p_collaborator_pool_matched_noun_id_fkey";

alter table "public"."p2p_collaborator_pool" drop constraint "p2p_collaborator_pool_query_adjective_id_fkey";

alter table "public"."p2p_collaborator_pool" drop constraint "p2p_collaborator_pool_query_noun_id_fkey";

alter table "public"."p2p_collaborator_pool" drop constraint "p2p_collaborator_pool_wayfarer_adjective_id_fkey";

alter table "public"."p2p_collaborator_pool" drop constraint "p2p_collaborator_pool_wayfarer_noun_id_fkey";

alter table "public"."collaborator_phrases" drop constraint "collaborator_phrases_pkey";

alter table "public"."phrase_components" drop constraint "phrase_components_pkey";

drop index if exists "public"."collaborator_phrases_adjective_id_key";

drop index if exists "public"."collaborator_phrases_collaborator_phrase_key";

drop index if exists "public"."collaborator_phrases_noun_id_key";

drop index if exists "public"."collaborator_phrases_pkey";

drop index if exists "public"."phrase_components_pkey";

drop table "public"."collaborator_phrases";

drop table "public"."phrase_components";

alter table "public"."p2p_collaborator_pool" drop column "matched_adjective_id";

alter table "public"."p2p_collaborator_pool" drop column "matched_noun_id";

alter table "public"."p2p_collaborator_pool" drop column "query_adjective_id";

alter table "public"."p2p_collaborator_pool" drop column "query_noun_id";

alter table "public"."p2p_collaborator_pool" drop column "wayfarer_adjective_id";

alter table "public"."p2p_collaborator_pool" drop column "wayfarer_noun_id";

alter table "public"."p2p_collaborator_pool" add column "query_uid" uuid not null;

alter table "public"."p2p_collaborator_pool" add constraint "p2p_collaborator_pool_query_uid_fkey" FOREIGN KEY (query_uid) REFERENCES auth.users(id) not valid;

alter table "public"."p2p_collaborator_pool" validate constraint "p2p_collaborator_pool_query_uid_fkey";
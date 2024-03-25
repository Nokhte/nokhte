drop trigger if exists "collaborative_doc_commit_checker" on "public"."working_collaborative_documents";

drop policy "Enable insert for authenticated users only" on "public"."finished_collaborative_documents";

drop policy "Users can only read their past commited" on "public"."finished_collaborative_documents";

drop policy "Can only read their own sessions" on "public"."individual_sessions";

drop policy "Enable insert for authenticated users only" on "public"."individual_sessions";

drop policy "can only update their own sessions" on "public"."individual_sessions";

drop policy "Can Only Read Documents That They Are Co-Authors Of" on "public"."p2p_perspectives_tracking";

drop policy "Enable insert for authenticated users only" on "public"."p2p_perspectives_tracking";

drop policy "They Can Only Update Documents That They Are Co-Authors Of" on "public"."p2p_perspectives_tracking";

drop policy "Collaborators have proper read permissions" on "public"."solo_sharable_documents";

drop policy "Enable insert for authenticated users only" on "public"."solo_sharable_documents";

drop policy "Only Owners Can Delete Their Solo Docs" on "public"."solo_sharable_documents";

drop policy "Only Owners Can Update Row Information" on "public"."solo_sharable_documents";

drop policy "Users Can Read Their Own Documents" on "public"."solo_sharable_documents";

drop policy "Can Only Read Documents That They Are Co-Authors Of" on "public"."working_collaborative_documents";

drop policy "Enable insert for authenticated users only" on "public"."working_collaborative_documents";

drop policy "They Can Only Delete Documents They Are Co-Authors Of" on "public"."working_collaborative_documents";

drop policy "They Can Only Update Documents That They Are Co-Authors Of" on "public"."working_collaborative_documents";

drop policy "Can Only Read Documents That They Are Co-Authors Of" on "public"."working_collaborative_scheduling";

drop policy "Enable insert for authenticated users only" on "public"."working_collaborative_scheduling";

drop policy "They Can Only Delete Scheduling Documents That They Are Co-Auth" on "public"."working_collaborative_scheduling";

drop policy "They Can Only Update Documents That They Are Co-Authors Of" on "public"."working_collaborative_scheduling";

drop policy "Can Only Read Documents That They Are Co-Authors Of" on "public"."working_perspective_positioning";

drop policy "Enable insert for authenticated users only" on "public"."working_perspective_positioning";

drop policy "They Can Only Update Documents That They Are Co-Authors Of" on "public"."working_perspective_positioning";

revoke delete on table "public"."finished_collaborative_documents" from "anon";

revoke insert on table "public"."finished_collaborative_documents" from "anon";

revoke references on table "public"."finished_collaborative_documents" from "anon";

revoke select on table "public"."finished_collaborative_documents" from "anon";

revoke trigger on table "public"."finished_collaborative_documents" from "anon";

revoke truncate on table "public"."finished_collaborative_documents" from "anon";

revoke update on table "public"."finished_collaborative_documents" from "anon";

revoke delete on table "public"."finished_collaborative_documents" from "authenticated";

revoke insert on table "public"."finished_collaborative_documents" from "authenticated";

revoke references on table "public"."finished_collaborative_documents" from "authenticated";

revoke select on table "public"."finished_collaborative_documents" from "authenticated";

revoke trigger on table "public"."finished_collaborative_documents" from "authenticated";

revoke truncate on table "public"."finished_collaborative_documents" from "authenticated";

revoke update on table "public"."finished_collaborative_documents" from "authenticated";

revoke delete on table "public"."finished_collaborative_documents" from "service_role";

revoke insert on table "public"."finished_collaborative_documents" from "service_role";

revoke references on table "public"."finished_collaborative_documents" from "service_role";

revoke select on table "public"."finished_collaborative_documents" from "service_role";

revoke trigger on table "public"."finished_collaborative_documents" from "service_role";

revoke truncate on table "public"."finished_collaborative_documents" from "service_role";

revoke update on table "public"."finished_collaborative_documents" from "service_role";

revoke delete on table "public"."individual_sessions" from "anon";

revoke insert on table "public"."individual_sessions" from "anon";

revoke references on table "public"."individual_sessions" from "anon";

revoke select on table "public"."individual_sessions" from "anon";

revoke trigger on table "public"."individual_sessions" from "anon";

revoke truncate on table "public"."individual_sessions" from "anon";

revoke update on table "public"."individual_sessions" from "anon";

revoke delete on table "public"."individual_sessions" from "authenticated";

revoke insert on table "public"."individual_sessions" from "authenticated";

revoke references on table "public"."individual_sessions" from "authenticated";

revoke select on table "public"."individual_sessions" from "authenticated";

revoke trigger on table "public"."individual_sessions" from "authenticated";

revoke truncate on table "public"."individual_sessions" from "authenticated";

revoke update on table "public"."individual_sessions" from "authenticated";

revoke delete on table "public"."individual_sessions" from "service_role";

revoke insert on table "public"."individual_sessions" from "service_role";

revoke references on table "public"."individual_sessions" from "service_role";

revoke select on table "public"."individual_sessions" from "service_role";

revoke trigger on table "public"."individual_sessions" from "service_role";

revoke truncate on table "public"."individual_sessions" from "service_role";

revoke update on table "public"."individual_sessions" from "service_role";

revoke delete on table "public"."p2p_perspectives_tracking" from "anon";

revoke insert on table "public"."p2p_perspectives_tracking" from "anon";

revoke references on table "public"."p2p_perspectives_tracking" from "anon";

revoke select on table "public"."p2p_perspectives_tracking" from "anon";

revoke trigger on table "public"."p2p_perspectives_tracking" from "anon";

revoke truncate on table "public"."p2p_perspectives_tracking" from "anon";

revoke update on table "public"."p2p_perspectives_tracking" from "anon";

revoke delete on table "public"."p2p_perspectives_tracking" from "authenticated";

revoke insert on table "public"."p2p_perspectives_tracking" from "authenticated";

revoke references on table "public"."p2p_perspectives_tracking" from "authenticated";

revoke select on table "public"."p2p_perspectives_tracking" from "authenticated";

revoke trigger on table "public"."p2p_perspectives_tracking" from "authenticated";

revoke truncate on table "public"."p2p_perspectives_tracking" from "authenticated";

revoke update on table "public"."p2p_perspectives_tracking" from "authenticated";

revoke delete on table "public"."p2p_perspectives_tracking" from "service_role";

revoke insert on table "public"."p2p_perspectives_tracking" from "service_role";

revoke references on table "public"."p2p_perspectives_tracking" from "service_role";

revoke select on table "public"."p2p_perspectives_tracking" from "service_role";

revoke trigger on table "public"."p2p_perspectives_tracking" from "service_role";

revoke truncate on table "public"."p2p_perspectives_tracking" from "service_role";

revoke update on table "public"."p2p_perspectives_tracking" from "service_role";

revoke delete on table "public"."solo_sharable_documents" from "anon";

revoke insert on table "public"."solo_sharable_documents" from "anon";

revoke references on table "public"."solo_sharable_documents" from "anon";

revoke select on table "public"."solo_sharable_documents" from "anon";

revoke trigger on table "public"."solo_sharable_documents" from "anon";

revoke truncate on table "public"."solo_sharable_documents" from "anon";

revoke update on table "public"."solo_sharable_documents" from "anon";

revoke delete on table "public"."solo_sharable_documents" from "authenticated";

revoke insert on table "public"."solo_sharable_documents" from "authenticated";

revoke references on table "public"."solo_sharable_documents" from "authenticated";

revoke select on table "public"."solo_sharable_documents" from "authenticated";

revoke trigger on table "public"."solo_sharable_documents" from "authenticated";

revoke truncate on table "public"."solo_sharable_documents" from "authenticated";

revoke update on table "public"."solo_sharable_documents" from "authenticated";

revoke delete on table "public"."solo_sharable_documents" from "service_role";

revoke insert on table "public"."solo_sharable_documents" from "service_role";

revoke references on table "public"."solo_sharable_documents" from "service_role";

revoke select on table "public"."solo_sharable_documents" from "service_role";

revoke trigger on table "public"."solo_sharable_documents" from "service_role";

revoke truncate on table "public"."solo_sharable_documents" from "service_role";

revoke update on table "public"."solo_sharable_documents" from "service_role";

revoke delete on table "public"."working_collaborative_documents" from "anon";

revoke insert on table "public"."working_collaborative_documents" from "anon";

revoke references on table "public"."working_collaborative_documents" from "anon";

revoke select on table "public"."working_collaborative_documents" from "anon";

revoke trigger on table "public"."working_collaborative_documents" from "anon";

revoke truncate on table "public"."working_collaborative_documents" from "anon";

revoke update on table "public"."working_collaborative_documents" from "anon";

revoke delete on table "public"."working_collaborative_documents" from "authenticated";

revoke insert on table "public"."working_collaborative_documents" from "authenticated";

revoke references on table "public"."working_collaborative_documents" from "authenticated";

revoke select on table "public"."working_collaborative_documents" from "authenticated";

revoke trigger on table "public"."working_collaborative_documents" from "authenticated";

revoke truncate on table "public"."working_collaborative_documents" from "authenticated";

revoke update on table "public"."working_collaborative_documents" from "authenticated";

revoke delete on table "public"."working_collaborative_documents" from "service_role";

revoke insert on table "public"."working_collaborative_documents" from "service_role";

revoke references on table "public"."working_collaborative_documents" from "service_role";

revoke select on table "public"."working_collaborative_documents" from "service_role";

revoke trigger on table "public"."working_collaborative_documents" from "service_role";

revoke truncate on table "public"."working_collaborative_documents" from "service_role";

revoke update on table "public"."working_collaborative_documents" from "service_role";

revoke delete on table "public"."working_collaborative_scheduling" from "anon";

revoke insert on table "public"."working_collaborative_scheduling" from "anon";

revoke references on table "public"."working_collaborative_scheduling" from "anon";

revoke select on table "public"."working_collaborative_scheduling" from "anon";

revoke trigger on table "public"."working_collaborative_scheduling" from "anon";

revoke truncate on table "public"."working_collaborative_scheduling" from "anon";

revoke update on table "public"."working_collaborative_scheduling" from "anon";

revoke delete on table "public"."working_collaborative_scheduling" from "authenticated";

revoke insert on table "public"."working_collaborative_scheduling" from "authenticated";

revoke references on table "public"."working_collaborative_scheduling" from "authenticated";

revoke select on table "public"."working_collaborative_scheduling" from "authenticated";

revoke trigger on table "public"."working_collaborative_scheduling" from "authenticated";

revoke truncate on table "public"."working_collaborative_scheduling" from "authenticated";

revoke update on table "public"."working_collaborative_scheduling" from "authenticated";

revoke delete on table "public"."working_collaborative_scheduling" from "service_role";

revoke insert on table "public"."working_collaborative_scheduling" from "service_role";

revoke references on table "public"."working_collaborative_scheduling" from "service_role";

revoke select on table "public"."working_collaborative_scheduling" from "service_role";

revoke trigger on table "public"."working_collaborative_scheduling" from "service_role";

revoke truncate on table "public"."working_collaborative_scheduling" from "service_role";

revoke update on table "public"."working_collaborative_scheduling" from "service_role";

revoke delete on table "public"."working_perspective_positioning" from "anon";

revoke insert on table "public"."working_perspective_positioning" from "anon";

revoke references on table "public"."working_perspective_positioning" from "anon";

revoke select on table "public"."working_perspective_positioning" from "anon";

revoke trigger on table "public"."working_perspective_positioning" from "anon";

revoke truncate on table "public"."working_perspective_positioning" from "anon";

revoke update on table "public"."working_perspective_positioning" from "anon";

revoke delete on table "public"."working_perspective_positioning" from "authenticated";

revoke insert on table "public"."working_perspective_positioning" from "authenticated";

revoke references on table "public"."working_perspective_positioning" from "authenticated";

revoke select on table "public"."working_perspective_positioning" from "authenticated";

revoke trigger on table "public"."working_perspective_positioning" from "authenticated";

revoke truncate on table "public"."working_perspective_positioning" from "authenticated";

revoke update on table "public"."working_perspective_positioning" from "authenticated";

revoke delete on table "public"."working_perspective_positioning" from "service_role";

revoke insert on table "public"."working_perspective_positioning" from "service_role";

revoke references on table "public"."working_perspective_positioning" from "service_role";

revoke select on table "public"."working_perspective_positioning" from "service_role";

revoke trigger on table "public"."working_perspective_positioning" from "service_role";

revoke truncate on table "public"."working_perspective_positioning" from "service_role";

revoke update on table "public"."working_perspective_positioning" from "service_role";

alter table "public"."finished_collaborative_documents" drop constraint "finished_collaborative_documents_collaborator_one_uid_fkey";

alter table "public"."finished_collaborative_documents" drop constraint "finished_collaborative_documents_collaborator_two_uid_fkey";

alter table "public"."finished_collaborative_documents" drop constraint "finished_collaborative_documents_doc_type_check";

alter table "public"."individual_sessions" drop constraint "individual_sessions_collaborator_one_uid_fkey";

alter table "public"."individual_sessions" drop constraint "individual_sessions_collaborator_two_uid_fkey";

alter table "public"."individual_sessions" drop constraint "individual_sessions_owner_uid_fkey";

alter table "public"."individual_sessions" drop constraint "individual_sessions_session_metadata";

alter table "public"."p2p_perspectives_tracking" drop constraint "p2p_perspectives_tracking_collaborator_one_uid_fkey";

alter table "public"."p2p_perspectives_tracking" drop constraint "p2p_perspectives_tracking_collaborator_two_uid_fkey";

alter table "public"."p2p_perspectives_tracking" drop constraint "p2p_perspectives_tracking_past_perspectives_check";

alter table "public"."solo_sharable_documents" drop constraint "solo_sharable_documents_collaborator_uid_fkey";

alter table "public"."solo_sharable_documents" drop constraint "solo_sharable_documents_doc_type_check";

alter table "public"."solo_sharable_documents" drop constraint "solo_sharable_documents_owner_uid_fkey";

alter table "public"."working_collaborative_documents" drop constraint "p2p_purpose_documents_id_key";

alter table "public"."working_collaborative_documents" drop constraint "working_collaborative_documents_collaborator_one_uid_fkey";

alter table "public"."working_collaborative_documents" drop constraint "working_collaborative_documents_collaborator_two_uid_fkey";

alter table "public"."working_collaborative_documents" drop constraint "working_collaborative_documents_last_edited_by_fkey";

alter table "public"."working_collaborative_documents" drop constraint "working_collaborative_p2p_purpose_documents_doc_type_check";

alter table "public"."working_collaborative_scheduling" drop constraint "working_collaborative_scheduling_collaborator_one_uid_fkey";

alter table "public"."working_collaborative_scheduling" drop constraint "working_collaborative_scheduling_collaborator_two_uid_fkey";

alter table "public"."working_collaborative_scheduling" drop constraint "working_collaborative_scheduling_last_edited_by_fkey";

alter table "public"."working_collaborative_scheduling" drop constraint "working_collaborative_scheduling_session_being_scheduled_check";

alter table "public"."working_perspective_positioning" drop constraint "working_perspective_positioning_collaborator_one_uid_fkey";

alter table "public"."working_perspective_positioning" drop constraint "working_perspective_positioning_collaborator_two_uid_fkey";

alter table "public"."working_perspective_positioning" drop constraint "working_perspective_positioning_last_edited_by_fkey";

alter table "public"."finished_collaborative_documents" drop constraint "finished_collaborative_p2p_purpose_documents_pkey";

alter table "public"."individual_sessions" drop constraint "individual_sessions_tracking_pkey";

alter table "public"."p2p_perspectives_tracking" drop constraint "p2p_perspectives_tracking_pkey";

alter table "public"."solo_sharable_documents" drop constraint "solo_p2p_purpose_documents_pkey";

alter table "public"."working_collaborative_documents" drop constraint "p2p_purpose_documents_pkey";

alter table "public"."working_collaborative_scheduling" drop constraint "working_collaborative_scheduling_pkey";

alter table "public"."working_perspective_positioning" drop constraint "working_perspective_positioning_pkey";

drop index if exists "public"."finished_collaborative_p2p_purpose_documents_pkey";

drop index if exists "public"."individual_sessions_tracking_pkey";

drop index if exists "public"."p2p_perspectives_tracking_pkey";

drop index if exists "public"."p2p_purpose_documents_id_key";

drop index if exists "public"."p2p_purpose_documents_pkey";

drop index if exists "public"."solo_p2p_purpose_documents_pkey";

drop index if exists "public"."working_collaborative_scheduling_pkey";

drop index if exists "public"."working_perspective_positioning_pkey";

drop table "public"."finished_collaborative_documents";

drop table "public"."individual_sessions";

drop table "public"."p2p_perspectives_tracking";

drop table "public"."solo_sharable_documents";

drop table "public"."working_collaborative_documents";

drop table "public"."working_collaborative_scheduling";

drop table "public"."working_perspective_positioning";

drop policy "Can Only Read Documents That They Are Co-Authors Of" on "public"."collective_sessions";

drop policy "authenticated users can insert" on "public"."collective_sessions";

drop policy "they can only update rows they are collaborators on" on "public"."collective_sessions";

revoke delete on table "public"."collective_sessions" from "anon";

revoke insert on table "public"."collective_sessions" from "anon";

revoke references on table "public"."collective_sessions" from "anon";

revoke select on table "public"."collective_sessions" from "anon";

revoke trigger on table "public"."collective_sessions" from "anon";

revoke truncate on table "public"."collective_sessions" from "anon";

revoke update on table "public"."collective_sessions" from "anon";

revoke delete on table "public"."collective_sessions" from "authenticated";

revoke insert on table "public"."collective_sessions" from "authenticated";

revoke references on table "public"."collective_sessions" from "authenticated";

revoke select on table "public"."collective_sessions" from "authenticated";

revoke trigger on table "public"."collective_sessions" from "authenticated";

revoke truncate on table "public"."collective_sessions" from "authenticated";

revoke update on table "public"."collective_sessions" from "authenticated";

revoke delete on table "public"."collective_sessions" from "service_role";

revoke insert on table "public"."collective_sessions" from "service_role";

revoke references on table "public"."collective_sessions" from "service_role";

revoke select on table "public"."collective_sessions" from "service_role";

revoke trigger on table "public"."collective_sessions" from "service_role";

revoke truncate on table "public"."collective_sessions" from "service_role";

revoke update on table "public"."collective_sessions" from "service_role";

alter table "public"."collective_sessions" drop constraint "collective_sessions_collaborator_one_individual_session_m_check";

alter table "public"."collective_sessions" drop constraint "collective_sessions_collaborator_one_individual_session_tim_key";

alter table "public"."collective_sessions" drop constraint "collective_sessions_collaborator_one_uid_fkey";

alter table "public"."collective_sessions" drop constraint "collective_sessions_collaborator_two_individual_session_m_check";

alter table "public"."collective_sessions" drop constraint "collective_sessions_collaborator_two_uid_fkey";

alter table "public"."collective_sessions" drop constraint "collective_sessions_pkey";

drop index if exists "public"."collective_sessions_collaborator_one_individual_session_tim_key";

drop index if exists "public"."collective_sessions_pkey";

drop table "public"."collective_sessions";

drop trigger if exists "enforce_unique_collaborations" on "public"."existing_collaborations";

drop policy "DELETE: they can delete their row" on "public"."existing_collaborations";

drop policy "SELECT: They can read their row" on "public"."existing_collaborations";

drop policy "UPDATE: They can only update their row " on "public"."existing_collaborations";

revoke delete on table "public"."existing_collaborations" from "anon";

revoke insert on table "public"."existing_collaborations" from "anon";

revoke references on table "public"."existing_collaborations" from "anon";

revoke select on table "public"."existing_collaborations" from "anon";

revoke trigger on table "public"."existing_collaborations" from "anon";

revoke truncate on table "public"."existing_collaborations" from "anon";

revoke update on table "public"."existing_collaborations" from "anon";

revoke delete on table "public"."existing_collaborations" from "authenticated";

revoke insert on table "public"."existing_collaborations" from "authenticated";

revoke references on table "public"."existing_collaborations" from "authenticated";

revoke select on table "public"."existing_collaborations" from "authenticated";

revoke trigger on table "public"."existing_collaborations" from "authenticated";

revoke truncate on table "public"."existing_collaborations" from "authenticated";

revoke update on table "public"."existing_collaborations" from "authenticated";

revoke delete on table "public"."existing_collaborations" from "service_role";

revoke insert on table "public"."existing_collaborations" from "service_role";

revoke references on table "public"."existing_collaborations" from "service_role";

revoke select on table "public"."existing_collaborations" from "service_role";

revoke trigger on table "public"."existing_collaborations" from "service_role";

revoke truncate on table "public"."existing_collaborations" from "service_role";

revoke update on table "public"."existing_collaborations" from "service_role";

alter table "public"."existing_collaborations" drop constraint "existing_collaborations_collaboration_id_key";

alter table "public"."existing_collaborations" drop constraint "existing_collaborations_collaborator_one_fkey";

alter table "public"."existing_collaborations" drop constraint "existing_collaborations_collaborator_two_fkey";

alter table "public"."existing_collaborations" drop constraint "existing_collaborations_current_phases_check";

alter table "public"."existing_collaborations" drop constraint "existing_collaborations_has_deleted_artifacts_check";

alter table "public"."existing_collaborations" drop constraint "existing_collaborations_is_on_call_check";

alter table "public"."existing_collaborations" drop constraint "existing_collaborations_is_online_check";

alter table "public"."existing_collaborations" drop constraint "existing_collaborations_speaker_spotlight_fkey";

alter table "public"."existing_collaborations" drop constraint "existing_collaborations_who_gets_the_question_check";

alter table "public"."existing_collaborations" drop constraint "existing_collaborations_pkey";

drop index if exists "public"."existing_collaborations_collaboration_id_key";

drop index if exists "public"."existing_collaborations_pkey";

drop table "public"."existing_collaborations";

alter table "public"."collaborator_phrases" add constraint "collaborator_phrases_uid_fkey" FOREIGN KEY (uid) REFERENCES auth.users(id) not valid;

alter table "public"."collaborator_phrases" validate constraint "collaborator_phrases_uid_fkey";

alter table "public"."existing_collaborations" add constraint "existing_collaborations_collaborator_one_fkey" FOREIGN KEY (collaborator_one) REFERENCES auth.users(id) not valid;

alter table "public"."existing_collaborations" validate constraint "existing_collaborations_collaborator_one_fkey";

alter table "public"."existing_collaborations" add constraint "existing_collaborations_collaborator_two_fkey" FOREIGN KEY (collaborator_two) REFERENCES auth.users(id) not valid;

alter table "public"."existing_collaborations" validate constraint "existing_collaborations_collaborator_two_fkey";

alter table "public"."p2p_collaborator_pool" add constraint "p2p_collaborator_pool_matched_adjective_id_fkey" FOREIGN KEY (matched_adjective_id) REFERENCES phrase_components(id) not valid;

alter table "public"."p2p_collaborator_pool" validate constraint "p2p_collaborator_pool_matched_adjective_id_fkey";

alter table "public"."p2p_collaborator_pool" add constraint "p2p_collaborator_pool_matched_noun_id_fkey" FOREIGN KEY (matched_noun_id) REFERENCES phrase_components(id) not valid;

alter table "public"."p2p_collaborator_pool" validate constraint "p2p_collaborator_pool_matched_noun_id_fkey";

alter table "public"."p2p_collaborator_pool" add constraint "p2p_collaborator_pool_matched_uid_fkey" FOREIGN KEY (matched_uid) REFERENCES auth.users(id) not valid;

alter table "public"."p2p_collaborator_pool" validate constraint "p2p_collaborator_pool_matched_uid_fkey";

alter table "public"."p2p_collaborator_pool" add constraint "p2p_collaborator_pool_query_adjective_id_fkey" FOREIGN KEY (query_adjective_id) REFERENCES phrase_components(id) not valid;

alter table "public"."p2p_collaborator_pool" validate constraint "p2p_collaborator_pool_query_adjective_id_fkey";

alter table "public"."p2p_collaborator_pool" add constraint "p2p_collaborator_pool_query_noun_id_fkey" FOREIGN KEY (query_noun_id) REFERENCES phrase_components(id) not valid;

alter table "public"."p2p_collaborator_pool" validate constraint "p2p_collaborator_pool_query_noun_id_fkey";

alter table "public"."p2p_collaborator_pool" add constraint "p2p_collaborator_pool_wayfarer_adjective_id_fkey" FOREIGN KEY (wayfarer_adjective_id) REFERENCES phrase_components(id) not valid;

alter table "public"."p2p_collaborator_pool" validate constraint "p2p_collaborator_pool_wayfarer_adjective_id_fkey";

alter table "public"."p2p_collaborator_pool" add constraint "p2p_collaborator_pool_wayfarer_noun_id_fkey" FOREIGN KEY (wayfarer_noun_id) REFERENCES phrase_components(id) not valid;

alter table "public"."p2p_collaborator_pool" validate constraint "p2p_collaborator_pool_wayfarer_noun_id_fkey";

alter table "public"."p2p_collaborator_pool" add constraint "p2p_collaborator_pool_wayfarer_uid_fkey" FOREIGN KEY (wayfarer_uid) REFERENCES auth.users(id) not valid;

alter table "public"."p2p_collaborator_pool" validate constraint "p2p_collaborator_pool_wayfarer_uid_fkey";
drop trigger if exists "collaborator_phrase_assigner" on "public"."user_names";

drop function if exists "public"."generate_random_number"(min_val integer, max_val integer);

drop function if exists "public"."unique_word_id_dispenser"();
set check_function_bodies = off;

CREATE OR REPLACE FUNCTION internal_functions.adj_or_noun_dispenser(is_a_noun boolean, word_id integer)
 RETURNS text
 LANGUAGE plpgsql
AS $function$DECLARE
  random_word TEXT;
BEGIN
    -- Get a random adjective or noun based on the input is_a_noun
    IF is_a_noun THEN
        SELECT noun INTO random_word
        FROM public.phrase_components
        WHERE id = word_id;
    ELSE
        SELECT adjective INTO random_word
        FROM public.phrase_components
        WHERE id = word_id;
    END IF;
    RETURN random_word;
END;$function$
;

CREATE OR REPLACE FUNCTION internal_functions.collaborator_phrase_assigner()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$DECLARE
    existing_row_count INTEGER;
    collaborator_phrase_param text;
    adjective_id_param bigint;
    noun_id_param bigint;
    adjective_word text;
    noun_word text;
    result_json json; -- Add this line to declare the result_json variable
BEGIN
    -- Check if a row with the current user's uid already exists in the table
    SELECT COUNT(*) INTO existing_row_count
    FROM public.collaborator_phrases
    WHERE uid = auth.uid();

    -- If the row doesn't exist, add a new row and get the collaborator phrase
    IF existing_row_count = 0 THEN
        -- Call the unique_word_id_dispenser function to get new adjective_id and noun_id
        SELECT
            public.unique_word_id_dispenser() INTO result_json; -- Assign the result to result_json

        -- Extract the adjective_id and noun_id from the result_json variable
        adjective_id_param := (result_json->'adjective_id');
        noun_id_param := (result_json->'noun_id');

        -- Retrieve the adjective and noun words from phrase_components table
        SELECT adjective, noun
        INTO adjective_word, noun_word
        FROM public.phrase_components
        WHERE id = adjective_id_param OR id = noun_id_param;

        -- Create the collaborator_phrase using the retrieved words
        collaborator_phrase_param := CONCAT(adjective_word, ' ', noun_word);

        -- Insert the new row with the generated ids, the collaborator_phrase, and the user's uid
        INSERT INTO public.collaborator_phrases (collaborator_phrase, adjective_id, noun_id, uid)
        VALUES (collaborator_phrase_param, adjective_id_param, noun_id_param, auth.uid());
        RETURN NEW;
    ELSE
        -- If the row already exists, raise an exception
        RAISE EXCEPTION 'User with uid % already has a collaborator_phrase row.', auth.uid();
    END IF;
END;
$function$
;


alter table "public"."user_names" drop constraint "user_names_collaborator_phrase_key";

drop index if exists "public"."user_names_collaborator_phrase_key";

create table "public"."collaborator_phrases" (
    "collaborator_phrase" text not null default 'EMPTY'::text,
    "adjective_id" bigint not null,
    "noun_id" bigint not null,
    "is_visible" boolean not null default false,
    "has_an_existing_collaborator_relationship" boolean not null default false,
    "uid" uuid not null
);


alter table "public"."collaborator_phrases" enable row level security;

alter table "public"."user_names" drop column "collaborator_phrase";

alter table "public"."user_names" drop column "has_an_existing_collaborator_relationship";

alter table "public"."user_names" drop column "is_visible";

CREATE UNIQUE INDEX collaborator_phrases_adjective_id_key ON public.collaborator_phrases USING btree (adjective_id);

CREATE UNIQUE INDEX collaborator_phrases_collaborator_phrase_key ON public.collaborator_phrases USING btree (collaborator_phrase);

CREATE UNIQUE INDEX collaborator_phrases_noun_id_key ON public.collaborator_phrases USING btree (noun_id);

CREATE UNIQUE INDEX collaborator_phrases_pkey ON public.collaborator_phrases USING btree (uid);

alter table "public"."collaborator_phrases" add constraint "collaborator_phrases_pkey" PRIMARY KEY using index "collaborator_phrases_pkey";

alter table "public"."collaborator_phrases" add constraint "collaborator_phrases_adjective_id_key" UNIQUE using index "collaborator_phrases_adjective_id_key";

alter table "public"."collaborator_phrases" add constraint "collaborator_phrases_collaborator_phrase_key" UNIQUE using index "collaborator_phrases_collaborator_phrase_key";

alter table "public"."collaborator_phrases" add constraint "collaborator_phrases_noun_id_key" UNIQUE using index "collaborator_phrases_noun_id_key";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.generate_random_number(min_val integer, max_val integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$DECLARE
random_bytes BYTEA;
random_num INTEGER;
BEGIN
-- Generate 4 random bytes (32 bits)
random_bytes := gen_random_bytes(4);
-- Convert the random bytes to a 32-bit unsigned integer
random_num := (get_byte(random_bytes, 0) << 24) | (get_byte(random_bytes, 1) << 16) |
              (get_byte(random_bytes, 2) << 8) | get_byte(random_bytes, 3);

-- Scale the random number to the desired range
random_num := (random_num % (max_val - min_val + 1)) + min_val;

-- Check if the random number is negative and make it positive if needed
IF random_num < 0 THEN
    random_num := random_num * -1;
END IF;

RETURN random_num;
END;$function$
;

CREATE OR REPLACE FUNCTION public.unique_word_id_dispenser()
 RETURNS json
 LANGUAGE plpgsql
AS $function$DECLARE
    min_id INTEGER;
    max_id INTEGER;
    new_noun_id INTEGER;
    new_adjective_id INTEGER;
    existing_count INTEGER;
    max_attempts INTEGER := 10; -- Change as necessary
    attempts INTEGER := 0;
    result JSON;
BEGIN
    LOOP
        attempts := attempts + 1;
        
        SELECT 
          MIN(id), MAX(id)
        INTO
          min_id, max_id
        FROM
          public.phrase_components;
        -- Generate random IDs for noun and adjective
        new_noun_id := public.generate_random_number(min_id, max_id);
        new_adjective_id := public.generate_random_number(min_id, max_id);

        -- Check if the generated IDs already exist in the table
        SELECT COUNT(*) INTO existing_count
        FROM public.collaborator_phrases
        WHERE noun_id = new_noun_id OR adjective_id = new_adjective_id;

        -- If no rows with the generated IDs exist, break out of the loop
        IF existing_count = 0 THEN
            result := json_build_object('noun_id', new_noun_id, 'adjective_id', new_adjective_id);
            RETURN result;
            EXIT;
        END IF;

        -- Check if we have reached the maximum number of attempts
        IF attempts >= max_attempts THEN
            RAISE EXCEPTION 'Unable to generate unique word IDs after % attempts.', max_attempts;
        END IF;
    END LOOP;
END;
$function$
;

create policy "Can Only Read Their Row"
on "public"."collaborator_phrases"
as permissive
for select
to authenticated
using ((uid = auth.uid()));


create policy "Enable insert for authenticated users only"
on "public"."collaborator_phrases"
as permissive
for insert
to authenticated
with check (true);


create policy "SELECT: Authenticated Users can read"
on "public"."phrase_components"
as permissive
for select
to authenticated
using (true);


CREATE TRIGGER collaborator_phrase_assigner AFTER INSERT ON public.user_names FOR EACH ROW EXECUTE FUNCTION internal_functions.collaborator_phrase_assigner();
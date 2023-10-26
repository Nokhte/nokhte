set check_function_bodies = off;

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
    SELECT adjective
        INTO adjective_word
    FROM public.phrase_components
    WHERE id = adjective_id_param;

        SELECT noun
        INTO noun_word
    FROM public.phrase_components
    WHERE id = noun_id_param;

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
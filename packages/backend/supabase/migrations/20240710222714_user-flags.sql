alter table "public"."user_information" add column "flags" jsonb not null default '{}'::jsonb;

UPDATE public.user_information
SET flags = (
    SELECT jsonb_build_object(
        'hasEnteredStorage', has_entered_storage,
        'hasAccessedQrCodeScanner', false
    )
    FROM public.user_information AS ui
    WHERE ui.uid = user_information.uid
);


alter table "public"."user_information" add constraint "user_information_flags_check" CHECK (jsonb_matches_schema('{"hasEnteredStorage": "bool", "hasAccessedQrCodeScanner":"bool"}'::json, flags)) not valid;

alter table "public"."user_information" validate constraint "user_information_flags_check";

alter table "public"."user_information" drop column "has_entered_storage";

alter table "public"."user_information" alter column "flags" set default '{"hasEnteredStorage": false, "hasAccessedQrCodeScanner": false}'::jsonb;
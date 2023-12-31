create table "public"."phrase_components" (
    "id" bigint generated by default as identity not null,
    "adjective" text,
    "noun" text
);


alter table "public"."phrase_components" enable row level security;

alter table "public"."user_names" add column "collaborator_phrase" text;

alter table "public"."user_names" add column "has_an_existing_collaborator_relationship" boolean not null default false;

alter table "public"."user_names" add column "is_visible" boolean not null default false;

alter table "public"."user_names" alter column "first_name" drop not null;

alter table "public"."user_names" alter column "last_name" drop not null;

CREATE UNIQUE INDEX phrase_components_pkey ON public.phrase_components USING btree (id);

CREATE UNIQUE INDEX user_names_collaborator_phrase_key ON public.user_names USING btree (collaborator_phrase);

alter table "public"."phrase_components" add constraint "phrase_components_pkey" PRIMARY KEY using index "phrase_components_pkey";

alter table "public"."user_names" add constraint "user_names_collaborator_phrase_key" UNIQUE using index "user_names_collaborator_phrase_key";

INSERT INTO public.phrase_components (adjective, noun) 
VALUES
    ('abandoned','acid'),
    ('able','account'),
    ('absent','actor'),
    ('abstract','actress'),
    ('absurd','addict'),
    ('acoustic','affair'),
    ('accidental','adult'),
    ('addicted','agent'),
    ('advanced','agreement'),
    ('afraid','airport'),
    ('alone','alarm'),
    ('ancient','alien'),
    ('angry','alley'),
    ('armed','anchor'),
    ('anxious','animal'),
    ('arrested','answer'),
    ('average','apology'),
    ('awake','apple'),
    ('awkward','arctic'),
    ('basic','arena'),
    ('beautiful','army'),
    ('better','artist'),
    ('best','artwork'),
    ('bitter','asset'),
    ('black','athlete'),
    ('bleak','atom'),
    ('blurry','attitude'),
    ('blushing','auction'),
    ('blind','aunt'),
    ('bloody','author'),
    ('blue','avocado'),
    ('boring','bacon'),
    ('brave','bag'),
    ('brief','baby'),
    ('brown','balcony'),
    ('busy','bamboo'),
    ('calm','banana'),
    ('capable','bar'),
    ('changing','barrel'),
    ('cautious','battle'),
    ('cheap','beach'),
    ('chaotic','bean'),
    ('childish','belt'),
    ('chronic','bench'),
    ('chunky','bike'),
    ('civilized','bird'),
    ('clapping','blade'),
    ('clean','blanket'),
    ('clever','blouse'),
    ('clutch','boat'),
    ('clogged','bomb'),
    ('closed','bone'),
    ('cloudy','border'),
    ('colorful','boss'),
    ('comfortable','box'),
    ('common','brain'),
    ('convincing','brass'),
    ('cool','bread'),
    ('correct','brick'),
    ('costly','bridge'),
    ('country','broccoli'),
    ('covered','broom'),
    ('cracked','brother'),
    ('crashed','budget'),
    ('crawling','buffalo'),
    ('crazy','bullet'),
    ('crucial','burger'),
    ('cruel','business'),
    ('crunchy','butter'),
    ('crying','buyer'),
    ('curved','cabbage'),
    ('custom','cabin'),
    ('cute','cactus'),
    ('damaged','cage'),
    ('damp','cake'),
    ('dancing','camera'),
    ('dangerous','camp'),
    ('daring','can'),
    ('dashing','candy'),
    ('defensive','cannon'),
    ('deep','canoe'),
    ('demanding','canvas'),
    ('destroyed','canyon'),
    ('developing','captain'),
    ('drastic','car'),
    ('drifting','carbon'),
    ('driven','card'),
    ('dumb','cargo'),
    ('dynamic','carpet'),
    ('eager','cart'),
    ('early','case'),
    ('easy','cash'),
    ('elegant','casino'),
    ('elite','castle'),
    ('ethical','cat'),
    ('evil','catalog'),
    ('evolving','cattle'),
    ('exact','cave'),
    ('exciting','celery'),
    ('exhausted','century'),
    ('exiled','cereal'),
    ('exotic','chair'),
    ('expired','chalk'),
    ('exposed','champion'),
    ('extended','chef'),
    ('extra','cherry'),
    ('faded','chest'),
    ('famous','chicken'),
    ('fancy','chief'),
    ('fat','child'),
    ('fatal','chimney'),
    ('final','cigar'),
    ('fine','cinnamon'),
    ('firm','citizen'),
    ('fit','city'),
    ('flat','claw'),
    ('floating','clay'),
    ('flying','clerk'),
    ('fluid','client'),
    ('forgetful','cliff'),
    ('fringe','clinic'),
    ('fragile','clock'),
    ('frequent','cloth'),
    ('fresh','cloud'),
    ('friendly','clown'),
    ('frozen','coach'),
    ('funny','coconut'),
    ('gated','coffee'),
    ('glowing','coin'),
    ('golden','company'),
    ('guilty','congress'),
    ('green','cook'),
    ('gritty','copper'),
    ('hairy','coral'),
    ('hard','corn'),
    ('harsh','cotton'),
    ('heavy','couch'),
    ('helpful','coyote'),
    ('hidden','cradle'),
    ('high','crane'),
    ('huge','crate'),
    ('humble','crater');
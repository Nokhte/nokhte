drop trigger if exists "cant_impersonate_username_creation" on "public"."usernames";

drop policy "Enable insert for users who don't have a row already" on "public"."usernames";

drop policy "Enable select for authenticated users only" on "public"."usernames";

alter table "public"."usernames" drop constraint "usernames_uid_fkey";

alter table "public"."usernames" drop constraint "usernames_uid_key";

alter table "public"."usernames" drop constraint "usernames_username_key";

alter table "public"."p2p_requests" drop constraint "p2p_requests_receiver_id_fkey";

alter table "public"."p2p_requests" drop constraint "p2p_requests_sender_id_fkey";

alter table "public"."usernames" drop constraint "usernames_pkey";

drop index if exists "public"."usernames_username_key";

drop index if exists "public"."usernames_pkey";

drop index if exists "public"."usernames_uid_key";

drop table "public"."usernames";

create table "public"."user_names" (
    "uid" uuid not null,
    "first_name" text not null,
    "last_name" text not null
);


alter table "public"."user_names" enable row level security;

CREATE UNIQUE INDEX usernames_pkey ON public.user_names USING btree (uid);

CREATE UNIQUE INDEX usernames_uid_key ON public.user_names USING btree (uid);

alter table "public"."user_names" add constraint "usernames_pkey" PRIMARY KEY using index "usernames_pkey";

alter table "public"."user_names" add constraint "user_names_uid_fkey" FOREIGN KEY (uid) REFERENCES auth.users(id) not valid;

alter table "public"."user_names" validate constraint "user_names_uid_fkey";

alter table "public"."user_names" add constraint "usernames_uid_key" UNIQUE using index "usernames_uid_key";

alter table "public"."p2p_requests" add constraint "p2p_requests_receiver_id_fkey" FOREIGN KEY (receiver_id) REFERENCES user_names(uid) not valid;

alter table "public"."p2p_requests" validate constraint "p2p_requests_receiver_id_fkey";

alter table "public"."p2p_requests" add constraint "p2p_requests_sender_id_fkey" FOREIGN KEY (sender_id) REFERENCES user_names(uid) not valid;

alter table "public"."p2p_requests" validate constraint "p2p_requests_sender_id_fkey";

create policy "CREATE: Users Who Don't Have a Row Already Can Add Theirs"
on "public"."user_names"
as permissive
for insert
to authenticated
with check ((NOT (EXISTS ( SELECT 1
   FROM user_names usernames_1
  WHERE (auth.uid() = usernames_1.uid)))));


create policy "READ: People Can Only Read Their Own Row"
on "public"."user_names"
as permissive
for select
to authenticated
using ((uid = auth.uid()));


CREATE TRIGGER cant_impersonate_username_creation BEFORE INSERT ON public.user_names FOR EACH ROW EXECUTE FUNCTION internal_functions.cant_impersonate_username_creation();
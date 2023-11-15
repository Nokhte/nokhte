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

alter table "public"."usernames"
alter column "uid"
set not null;
alter table "public"."usernames"
alter column "username"
set not null;
CREATE UNIQUE INDEX usernames_pkey ON public.usernames USING btree (uid);
CREATE UNIQUE INDEX usernames_uid_key ON public.usernames USING btree (uid);
CREATE UNIQUE INDEX usernames_username_key ON public.usernames USING btree (username);
alter table "public"."usernames"
add constraint "usernames_pkey" PRIMARY KEY using index "usernames_pkey";
alter table "public"."usernames"
add constraint "usernames_uid_key" UNIQUE using index "usernames_uid_key";
alter table "public"."usernames"
add constraint "usernames_username_key" UNIQUE using index "usernames_username_key";
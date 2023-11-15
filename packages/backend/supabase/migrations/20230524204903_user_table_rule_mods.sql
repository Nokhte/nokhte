alter table "public"."usernames"
alter column "uid" drop not null;
alter table "public"."usernames" enable row level security;
create policy "Enable insert for users who don't have a row already" on "public"."usernames" as permissive for
insert to authenticated with check (
        (
            NOT (
                EXISTS (
                    SELECT 1
                    FROM usernames usernames_1
                    WHERE (auth.uid() = usernames_1.uid)
                )
            )
        )
    );
create policy "Enable select for authenticated users only" on "public"."usernames" as permissive for
select to authenticated using (true);
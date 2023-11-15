alter table "public"."p2p_requests"
alter column "accepted_at" drop not null;
-- alter table "public"."usernames"
-- add constraint "usernames_uid_fkey" FOREIGN KEY (uid) REFERENCES auth.users(id) not valid;
-- alter table "public"."usernames" validate constraint "usernames_uid_fkey";
create policy "CREATE: Disallow duplicate requests" on "public"."p2p_requests" as permissive for
insert to authenticated with check (
        (
            NOT (
                EXISTS (
                    SELECT 1
                    FROM p2p_requests p2p_requests_1
                    WHERE (
                            (
                                p2p_requests_1.sender_id = p2p_requests_1.sender_id
                            )
                            AND (
                                p2p_requests_1.receiver_id = p2p_requests_1.receiver_id
                            )
                        )
                )
            )
        )
    );
create policy "CREATE: The Receiver ID must be different from the Sender ID" on "public"."p2p_requests" as permissive for
insert to authenticated with check ((sender_id <> receiver_id));
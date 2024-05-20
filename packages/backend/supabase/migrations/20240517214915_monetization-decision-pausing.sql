drop policy "UPDATE: Can update a valid session" on "public"."active_nokhte_sessions";

alter table "public"."active_nokhte_sessions" add column "has_paid" boolean[] not null;

create policy "UPDATE: Can update a valid session"
on "public"."active_nokhte_sessions"
as permissive
for update
to authenticated
using (((auth.uid() = ANY (collaborator_uids)) AND ((array_length(collaborator_uids, 1) < 4) OR (true = ALL (has_paid)))))
with check (true);

create table "public"."active_monetization_sessions" (
    "id" bigint generated by default as identity not null,
    "collaborator_uids" uuid[] not null,
    "have_finished_explanations" boolean[] not null
);


alter table "public"."active_monetization_sessions" enable row level security;

CREATE UNIQUE INDEX active_monetization_sessions_collaborator_uids_key ON public.active_monetization_sessions USING btree (collaborator_uids);

CREATE UNIQUE INDEX active_monetization_sessions_pkey ON public.active_monetization_sessions USING btree (id);

alter table "public"."active_monetization_sessions" add constraint "active_monetization_sessions_pkey" PRIMARY KEY using index "active_monetization_sessions_pkey";

alter table "public"."active_monetization_sessions" add constraint "active_monetization_sessions_collaborator_uids_key" UNIQUE using index "active_monetization_sessions_collaborator_uids_key";

grant delete on table "public"."active_monetization_sessions" to "anon";

grant insert on table "public"."active_monetization_sessions" to "anon";

grant references on table "public"."active_monetization_sessions" to "anon";

grant select on table "public"."active_monetization_sessions" to "anon";

grant trigger on table "public"."active_monetization_sessions" to "anon";

grant truncate on table "public"."active_monetization_sessions" to "anon";

grant update on table "public"."active_monetization_sessions" to "anon";

grant delete on table "public"."active_monetization_sessions" to "authenticated";

grant insert on table "public"."active_monetization_sessions" to "authenticated";

grant references on table "public"."active_monetization_sessions" to "authenticated";

grant select on table "public"."active_monetization_sessions" to "authenticated";

grant trigger on table "public"."active_monetization_sessions" to "authenticated";

grant truncate on table "public"."active_monetization_sessions" to "authenticated";

grant update on table "public"."active_monetization_sessions" to "authenticated";

grant delete on table "public"."active_monetization_sessions" to "service_role";

grant insert on table "public"."active_monetization_sessions" to "service_role";

grant references on table "public"."active_monetization_sessions" to "service_role";

grant select on table "public"."active_monetization_sessions" to "service_role";

grant trigger on table "public"."active_monetization_sessions" to "service_role";

grant truncate on table "public"."active_monetization_sessions" to "service_role";

grant update on table "public"."active_monetization_sessions" to "service_role";

alter
  publication supabase_realtime add table public.active_monetization_sessions;

  create policy "DELETE: Can Delete a row if they are a collaborator"
on "public"."active_monetization_sessions"
as permissive
for delete
to authenticated
using ((auth.uid() = ANY (collaborator_uids)));


create policy "INSERT: Can Insert a Row where they are a collaborator"
on "public"."active_monetization_sessions"
as permissive
for insert
to authenticated
with check ((auth.uid() = ANY (collaborator_uids)));


create policy "SELECT: They can read their own row"
on "public"."active_monetization_sessions"
as permissive
for select
to authenticated
using ((auth.uid() = ANY (collaborator_uids)));


create policy "UPDATE: Can Update Their Own Row"
on "public"."active_monetization_sessions"
as permissive
for update
to authenticated
using ((auth.uid() = ANY (collaborator_uids)))
with check (true);

drop policy "UPDATE: Can update a valid session" on "public"."active_nokhte_sessions";

alter table "public"."active_nokhte_sessions" drop column "has_paid";

alter table "public"."active_nokhte_sessions" drop column "is_a_valid_session";

alter table "public"."active_nokhte_sessions" add column "has_premium_access" boolean[] not null;

create policy "UPDATE: Can update a valid session"
on "public"."active_nokhte_sessions"
as permissive
for update
to authenticated
using (((auth.uid() = ANY (collaborator_uids)) AND ((array_length(collaborator_uids, 1) < 4) OR (true = ALL (has_premium_access)))))
with check (true);

revoke
update
  (has_premium_access) on table public.active_nokhte_sessions
from
  authenticated;
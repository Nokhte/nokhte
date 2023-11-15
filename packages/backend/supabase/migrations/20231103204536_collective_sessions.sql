create table "public"."collective_sessions" (
    "id" bigint generated by default as identity not null,
    "collaborator_one_uid" uuid not null,
    "collaborator_two_uid" uuid,
    "commit_message" text
);


alter table "public"."collective_sessions" enable row level security;

CREATE UNIQUE INDEX collective_sessions_pkey ON public.collective_sessions USING btree (id);

alter table "public"."collective_sessions" add constraint "collective_sessions_pkey" PRIMARY KEY using index "collective_sessions_pkey";

alter table "public"."collective_sessions" add constraint "collective_sessions_collaborator_one_uid_fkey" FOREIGN KEY (collaborator_one_uid) REFERENCES auth.users(id) ON UPDATE CASCADE not valid;

alter table "public"."collective_sessions" validate constraint "collective_sessions_collaborator_one_uid_fkey";

alter table "public"."collective_sessions" add constraint "collective_sessions_collaborator_two_uid_fkey" FOREIGN KEY (collaborator_two_uid) REFERENCES auth.users(id) ON UPDATE CASCADE not valid;

alter table "public"."collective_sessions" validate constraint "collective_sessions_collaborator_two_uid_fkey";

alter
  publication supabase_realtime add table public.collective_sessions;
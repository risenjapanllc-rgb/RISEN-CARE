create table if not exists public.resident_memory (

    id uuid primary key default gen_random_uuid(),

    user_id uuid not null
        references public.users(id)
        on delete cascade,

    summary text,

    current_status jsonb,

    watch_points jsonb,

    support_preferences jsonb,

    important_patterns jsonb,

    recent_changes jsonb,

    confidence text,

    source_report_id uuid,

    generated_at timestamptz,

    updated_at timestamptz default now(),

    created_at timestamptz default now()
);

create unique index if not exists
resident_memory_user_idx
on public.resident_memory(user_id);

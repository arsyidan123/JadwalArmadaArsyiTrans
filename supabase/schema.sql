-- Skema Arsyi Trans. Catatan: policy ini terbuka untuk anon (tanpa login), sesuai pilihan pemilik.
create table if not exists public.buses (id text primary key, data jsonb not null default '{}'::jsonb, updated_at timestamptz not null default now());
create table if not exists public.trips (id text primary key, data jsonb not null default '{}'::jsonb, updated_at timestamptz not null default now());
create table if not exists public.settings (id text primary key, data jsonb not null default '{}'::jsonb, updated_at timestamptz not null default now());
alter table public.buses enable row level security;
alter table public.trips enable row level security;
alter table public.settings enable row level security;
create policy "anon_all_buses" on public.buses for all to anon, authenticated using (true) with check (true);
create policy "anon_all_trips" on public.trips for all to anon, authenticated using (true) with check (true);
create policy "anon_all_settings" on public.settings for all to anon, authenticated using (true) with check (true);
alter publication supabase_realtime add table public.buses, public.trips, public.settings;

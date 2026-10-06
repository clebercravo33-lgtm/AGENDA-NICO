-- Execute este arquivo no Supabase > SQL Editor.
-- Esta versão NÃO usa login. Todos os aparelhos compartilham a linha id=1.

create table if not exists public.agendador_dados (
  id bigint primary key,
  data jsonb not null default '{"agendamentos":[],"fornecedores":[],"motoristas":[],"ts":null}'::jsonb,
  updated_at timestamptz not null default now()
);

insert into public.agendador_dados (id, data, updated_at)
values (1, '{"agendamentos":[],"fornecedores":[],"motoristas":[],"ts":null}'::jsonb, now())
on conflict (id) do nothing;

alter table public.agendador_dados enable row level security;

drop policy if exists "Agendador público leitura" on public.agendador_dados;
drop policy if exists "Agendador público inserção" on public.agendador_dados;
drop policy if exists "Agendador público atualização" on public.agendador_dados;
drop policy if exists "Agendador anon leitura" on public.agendador_dados;
drop policy if exists "Agendador anon escrita" on public.agendador_dados;

create policy "Agendador público leitura"
on public.agendador_dados for select
to anon, authenticated
using (id = 1);

create policy "Agendador público inserção"
on public.agendador_dados for insert
to anon, authenticated
with check (id = 1);

create policy "Agendador público atualização"
on public.agendador_dados for update
to anon, authenticated
using (id = 1)
with check (id = 1);

grant usage on schema public to anon, authenticated;
grant select, insert, update on public.agendador_dados to anon, authenticated;

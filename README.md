# Agendador PWA — sem login

1. Execute `supabase-politicas.sql` no SQL Editor do Supabase.
2. Publique todos estes arquivos na mesma pasta do GitHub/Vercel.
3. Abra o mesmo endereço nos aparelhos.
4. Se já instalou uma versão anterior, atualize a página ou reinstale o PWA para carregar a versão 2026-10-06-sync2.

A sincronização usa a tabela `public.agendador_dados`, linha `id=1`, sem login. O aplicativo consulta a nuvem periodicamente e grava as alterações.

Aviso: sem login, qualquer pessoa que tenha o endereço poderá ler/alterar os dados permitidos por essas políticas.

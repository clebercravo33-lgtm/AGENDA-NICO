# Agendador de Descarga — PWA sem login

Esta versão abre diretamente, sem tela de login.

## Sincronização
Os agendamentos, fornecedores e motoristas são compartilhados pela tabela `agendador_dados` no Supabase, na linha `id = 1`.

## Supabase
Execute `supabase-politicas.sql` no SQL Editor do projeto. Sem essas políticas, o navegador pode ser bloqueado pelo RLS.

## Publicação
Envie `index.html`, `manifest.webmanifest`, `sw.js` e a pasta `icons` para o GitHub/Vercel.

## Observação
Sem login, qualquer pessoa que tenha acesso ao endereço do aplicativo e às políticas públicas poderá ler/alterar a linha compartilhada. Para um sistema de portaria público, isso é uma decisão de segurança importante.

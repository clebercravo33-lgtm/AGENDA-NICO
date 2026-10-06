const CACHE='agendador-pwa-sync-20261006-v2';
const APP_SHELL=['./','./index.html','./manifest.webmanifest','./icons/icon-192.png','./icons/icon-512.png'];
self.addEventListener('install',event=>{event.waitUntil(caches.open(CACHE).then(c=>c.addAll(APP_SHELL)).then(()=>self.skipWaiting()))});
self.addEventListener('activate',event=>{event.waitUntil(caches.keys().then(keys=>Promise.all(keys.filter(k=>k!==CACHE).map(k=>caches.delete(k)))).then(()=>self.clients.claim()))});
self.addEventListener('fetch',event=>{
  const u=new URL(event.request.url);
  if(u.origin!==location.origin || u.pathname.includes('/rest/v1/')) return;
  if(event.request.method!=='GET') return;
  if(u.pathname.endsWith('/index.html') || u.pathname==='/' || u.pathname.endsWith('/')){
    event.respondWith(fetch(event.request,{cache:'no-store'}).then(r=>{if(r.ok){const copy=r.clone();caches.open(CACHE).then(c=>c.put('./index.html',copy));}return r}).catch(()=>caches.match('./index.html')));
    return;
  }
  event.respondWith(caches.match(event.request).then(cached=>cached||fetch(event.request).then(r=>{if(r.ok)caches.open(CACHE).then(c=>c.put(event.request,r.clone()));return r})));
});
// app/service-worker.js（超精簡，不做快取，只為了讓 PWA 可安裝）
self.addEventListener("install", () => { /* noop */ });
self.addEventListener("activate", () => { /* noop */ });
// 有一個 fetch 事件處理器，讓 Chrome 覺得這是可控頁面
self.addEventListener("fetch", (event) => { event.respondWith(fetch(event.request)); });

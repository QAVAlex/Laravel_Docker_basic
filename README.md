```
docker compose build
docker compose up
```

```
docker compose exec app bash
laravel new
```

move content out of nested folder and into root otehrwise amend docker-configs/nginx/default.conf and docker-compose nginx service



# Fortify and Inertia
```
composer require laravel/fortify
php artisan fortify:install
php artisan migrate
```

https://inertiajs.com/server-side-setup
https://inertiajs.com/client-side-setup

```
npm i @vitejs/plugin-vue
```

##### vite.config.js
```
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import tailwindcss from '@tailwindcss/vite';
import vue from '@vitejs/plugin-vue'

export default defineConfig({
    plugins: [
        vue(),
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
        tailwindcss(),
    ],
    server : { host: true, port: 5173, hmr: { protocol: 'ws' } }
});
```


##### Resources/js/app.js
```
import './bootstrap';

import { createApp, h } from 'vue'
import { createInertiaApp } from '@inertiajs/vue3'

createInertiaApp({
  resolve: name => {
    const pages = import.meta.glob('./Pages/**/*.vue', { eager: true })
    return pages[`./Pages/${name}.vue`]
  },
  setup({ el, App, props, plugin }) {
    createApp({ render: () => h(App, props) })
      .use(plugin)
      .mount(el)
  },
})
```


##### Final setup
```
Create a resources/js/Pages directory and add a welcome.vue
```
```
docker compose build
docker compose up
```

```
docker compose exec app bash
laravel new
```

move content out of nested folder and into root otherwise amend docker-configs/nginx/default.conf and docker-compose nginx service



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
npm install tailwindcss @tailwindcss/vite
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


##### Pages to render
```
Create a resources/js/Pages directory and add a welcome.vue
```




##### Tailwind
```
https://tailwindcss.com/docs/installation/framework-guides/laravel/vite
```


##### Basic vue page SSR
```
<script>
export default {
    data() {
        return {
            count: 1
        }
    },
    mounted() {
        console.log('here')
    },
    methods: {
        testing() {
            console.log(123)
        },
        not() {
            console.log('33')
        }
    }
}
</script>

<template>
    <div>
        {{ console.log(this.$page) }}
        {{$page.props.user}}
        <button @click="count += 1">Increment</button>
        <button @click="count -= 1">Decrement</button>
        <small v-text="count"></small>
        <button @click="testing()">Test</button>
        <button @click="not()">Test</button>
    </div>
</template>
```
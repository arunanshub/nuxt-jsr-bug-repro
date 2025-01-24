# Nuxt && JSR MCVE

How to reproduce:

```bash
docker build -t nuxt-jsr . && docker run --rm -p 3000:3000 nuxt-jsr:latest
```

Temporary fix:

```ts
export default defineNuxtConfig({
  build: {
    transpile: ['@std/ulid'],
  },
})

```

Add the name(s) of external packages in `build.transpile`

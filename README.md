# Nitro and JSR MCVE

How to reproduce:

```bash
docker build -t nitro-jsr . && docker run --rm -p 3000:3000 nitro-jsr:latest
```

Visit `localhost:3000/api/ulid`. It should raise errors.

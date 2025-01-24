FROM node:22-alpine AS base

RUN apk add --no-cache libc6-compat && corepack enable

# # ========== install Stage ==========
FROM base AS install

WORKDIR /app
COPY package.json pnpm-lock.yaml .npmrc ./
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm i --frozen-lockfile

# ========== build Stage ==========
FROM base AS build

WORKDIR /app
COPY --from=install /app/node_modules ./node_modules
# copy project
COPY . .
RUN pnpm build

# ========== Production Stage ==========
FROM base AS production

WORKDIR /app
COPY --from=build /app/.output ./
EXPOSE 3000

CMD ["node", "server/index.mjs"]

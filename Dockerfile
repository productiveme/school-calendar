# ── Build stage ────────────────────────────────────────────────
FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

# ── Serve stage ────────────────────────────────────────────────
FROM node:22-alpine

WORKDIR /app

COPY --from=builder /app/dist ./dist

RUN npm install -g serve

EXPOSE 3000

CMD ["serve", "dist", "-p", "3000"]

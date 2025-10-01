#!/usr/bin/env bash
set -euo pipefail

ROOT="metiora"

mkd() { mkdir -p "$1"; }
mkf() { # создать пустой файл, если его ещё нет
  local f="$1"
  if [[ ! -e "$f" ]]; then
    mkdir -p "$(dirname "$f")"
    : > "$f"
  fi
}

# --- Директории ---
mkd "$ROOT/alembic/versions"
mkd "$ROOT/app/api/v1/endpoints"
mkd "$ROOT/app/core"
mkd "$ROOT/app/db"
mkd "$ROOT/app/models"
mkd "$ROOT/app/schemas"

# --- Пустые файлы в корне ---
mkf "$ROOT/.env.example"
mkf "$ROOT/.gitignore"
mkf "$ROOT/.editorconfig"
mkf "$ROOT/pre-commit-config.yaml"
mkf "$ROOT/ruff.toml"
mkf "$ROOT/requirements.txt"
mkf "$ROOT/Dockerfile"
mkf "$ROOT/docker-compose.yml"
mkf "$ROOT/Makefile"
mkf "$ROOT/README.week1.md"
mkf "$ROOT/alembic.ini"

# --- Alembic ---
mkf "$ROOT/alembic/env.py"
# Папка versions остаётся пустой (как вы просили)

# --- App ---
mkf "$ROOT/app/main.py"

# API
mkf "$ROOT/app/api/__init__.py"
mkf "$ROOT/app/api/deps.py"
mkf "$ROOT/app/api/v1/__init__.py"
mkf "$ROOT/app/api/v1/router.py"
mkf "$ROOT/app/api/v1/endpoints/__init__.py"
mkf "$ROOT/app/api/v1/endpoints/auth.py"

# Core
mkf "$ROOT/app/core/__init__.py"
mkf "$ROOT/app/core/config.py"
mkf "$ROOT/app/core/security.py"

# DB
mkf "$ROOT/app/db/__init__.py"
mkf "$ROOT/app/db/base.py"
mkf "$ROOT/app/db/session.py"

# Models
mkf "$ROOT/app/models/__init__.py"
mkf "$ROOT/app/models/user.py"

# Schemas
mkf "$ROOT/app/schemas/__init__.py"
mkf "$ROOT/app/schemas/auth.py"

echo "Проектовая структура создана в: $ROOT"

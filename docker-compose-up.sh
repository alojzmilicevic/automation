#!/bin/bash

echo "========================================"
echo "Starting n8n..."
echo "Access n8n at: http://localhost:5678"
echo "========================================"
echo ""

docker compose up "$@"

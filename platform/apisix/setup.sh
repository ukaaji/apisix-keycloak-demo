#!/bin/bash

echo "🚀 Starting APISIX + Keycloak POC..."

# Start services
docker compose up -d

echo "⏳ Waiting for services to start..."
sleep 30

echo "🔧 Services should be starting up..."
echo "📋 Service Status:"
docker compose ps

echo ""
echo "🌐 Access URLs:"
echo "  Frontend (Protected):     http://localhost/"
echo "  Keycloak Admin Console:   http://localhost:8080"
echo ""
echo "🔑 Keycloak Admin Credentials:"
echo "  Username: admin"
echo "  Password: admin"
echo ""
echo "⚠️  IMPORTANT: You need to configure Keycloak client before testing!"
echo "   Run './configure-keycloak.sh' after Keycloak is fully started."

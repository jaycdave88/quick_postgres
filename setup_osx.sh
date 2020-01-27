#!/bin/bash
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib -y
psql postgres -c "CREATE USER datadog WITH PASSWORD 'password123!';"
psql postgres -c "GRANT USAGE ON SCHEMA public TO datadog;"
psql postgres -c "CREATE DATABASE sightings;"
psql postgres -c "CREATE DATABASE operations;"
psql postgres -c "GRANT ALL PRIVILEGES ON DATABASE sightings TO datadog;"
psql postgres -c "GRANT ALL PRIVILEGES ON DATABASE operations TO datadog;"
psql sightings < sightings.sql
psql operations < operations.sql

#!/bin/bash
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib -y
sudo -u postgres psql -c "CREATE USER datadog WITH PASSWORD 'password123!';"
sudo -u postgres psql -c "CREATE DATABASE sightings;"
sudo -u postgres psql -c "GRANT USAGE ON SCHEMA public TO datadog;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE sightings TO datadog;"
sudo -u postgres psql sightings < sightings.sql
sudo -u postgres psql -c "CREATE DATABASE operations;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE operations TO datadog;"
sudo -u postgres psql operations < operations.sql

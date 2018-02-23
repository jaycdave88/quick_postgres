#!/bin/bash
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib -y
sudo -u postgres psql -c "CREATE USER db_user WITH PASSWORD 'db_pass';"
sudo -u postgres psql -c "CREATE DATABASE sightings;"
sudo -u postgres psql -c "GRANT USAGE ON SCHEMA public TO db_user;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE sightings TO db_user;"
sudo -u postgres psql sightings < sightings.sql
sudo -u postgres psql -c "CREATE DATABASE operations;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE operations TO db_user;"
sudo -u postgres psql operations < operations.sql

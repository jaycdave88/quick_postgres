#!/bin/bash
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib -y
psql postgres -c "CREATE USER db_user WITH PASSWORD 'db_pass';"
psql postgres -c "GRANT USAGE ON SCHEMA public TO db_user;"
psql postgres -c "CREATE DATABASE sightings;"
psql postgres -c "CREATE DATABASE operations;"
psql postgres -c "GRANT ALL PRIVILEGES ON DATABASE sightings TO db_user;"
psql postgres -c "GRANT ALL PRIVILEGES ON DATABASE operations TO db_user;"
psql sightings < sightings.sql
psql operations < operations.sql

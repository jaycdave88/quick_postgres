#!/bin/bash
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib -y
psql postgres -c "CREATE USER db_user WITH PASSWORD 'db_pass';"
psql postgres -c "CREATE DATABASE sightings;"
psql postgres sightings < sightings.sql
psql postgres -c "GRANT ALL PRIVILEGES ON DATABASE sightings TO db_user;"

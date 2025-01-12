# Nexus Game Store and Library
An all-in-one game distribution platform for gamers to play, manage, organize and purchase video games.

## About
Nexus Game Store and Library is a project developed for BIIT 1301 Database Programming. This project is intended as a small prototyping demonstrating how web applications interact with backend components and how those interacts with the database and is not intended for it to be a fully functional web application

## Table of Contents
- [About](#about)
- [Features](#features)
- [Installation](#installation)
- [Acknowledgements](#acknowledgements)


## Features
- Login Feature with simple password authentication
- Register Feature for first time users
- Game Store for users to purchase games
- Profile Feature where user can edit or delete their profile
- Library Feature for users to view games that they own
- A fun support feature :) 

## Installation
### Prerequisites
- Oracle Express Edition 11g. [Download](https://www.oracle.com/database/technologies/xe-prior-release-downloads.html)
- Python 3.11 or higher. [Download](https://www.python.org/downloads/)


### Installation Guide

1. Clone the repository: 
`git clone https://github.com/ShmortGuac/NexusApp.git`

2. Navigate to project directory
`cd NexusApp`

3. Install python dependencies
`pip install flask`
`pip install oracledb` 

4. Grant view to database user
5. Navigate to SQL Scripts and run all SQL scripts (Make sure to establish connection with database first).
6. Run app.py

## Acknowledgements
- Built using [Flask](https://github.com/pallets/flask)
- Inspired by [Steam](https://store.steampowered.com/) & [Netflix](https://www.netflix.com/)

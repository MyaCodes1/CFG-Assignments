# My adventurers guild API

I created a simple fantasy-themed API for managing expeditions for the adventurers guild. It was built with Node.js, Express.js and MySQL. It allows users to view & find expeditions suitable for a party and create new expeditions.

## Technologies I used/implemented

-Node.js
-Express.js
-MySQL
-mysql2
-dotenv

## Setup

1. Install dependencies
   From the 'Assignment-4-APIs' folder, run:

```bash
npm install
```

2. Set up environment variables
   The project uses a .env file to store the MYSQL database details & port number. It should contain:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=YOUR_MYSQL_PASSWORD
DB_NAME=adventurers_guild
PORT=3000
```

3. Set up the DB

Create the 'Adventurers_guild' database in MySQL and run the SQL in database.sql to create the expeditions table and sample data.

4. Run the API

```bash
npm start
```

## API endpoints (3)

### GET /

Returns a welcome message from the Adventurers guild API

### GET /expeditions

Returns all expeditions stored in the DB

### GET /expeditions/:id

Returns one expedtion using its ID.

Example:
`GET /expeditions/21`

### GET /expeditions/suitable

Finds open expedtions that match the party size & maximum trip length
E.g.
'GET /expeditions/suitable?partySize=4&maxDays=5'

### POST /expeditions

Creates a new expedition using JSON data in the request body

### Error handling

The API uses HTTP status codes to show whether a request was successful:

-200 successful request

- 201 expedition created
- 400 invalid input
- 404 expedition not found
- 500 server or database error

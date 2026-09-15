const express = require("express");
const pool = require("./db");

const app = express();

const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get("/", (req, res) => {
    res.status(200).json({
        message: "Welcome to the Adventurer's Guild API!"
    });
});

app.get("/expeditions", async (req, res) => {
    try {
        const [rows] = await pool.query("SELECT * FROM expeditions");

        res.status(200).json(rows);
    } catch (error) {
        console.error(error);

        res.status(500).json({
            error: "Unable to retrieve expeditions"
        });
    }
});

app.get("/expeditions/suitable", async (req, res) => {
    const partySize = Number(req.query.partySize);
    const maxDays = Number(req.query.maxDays);

    if (
        !Number.isInteger(partySize) ||
        partySize <= 0 ||
        !Number.isInteger(maxDays) ||
        maxDays <= 0
    ) {
        return res.status(400).json({
            error: "partySize and maxDays must be positive integers"
        });
    }

    try {
        const [rows] = await pool.query(
            `SELECT * FROM expeditions
             WHERE party_size <= ?
             AND duration_days <= ?
             AND status = 'Open'`,
            [partySize, maxDays]
        );

        res.status(200).json(rows);
    } catch (error) {
        console.error(error);

        res.status(500).json({
            error: "Unable to find suitable expeditions"
        });
    }
});

app.get("/expeditions/:id", async (req, res) => {
    const id = Number(req.params.id);

    if (!Number.isInteger(id) || id <= 0) {
        return res.status(400).json({
            error: "ID must be a positive integer"
        });
    }

    try {
        const [rows] = await pool.query(
            "SELECT * FROM expeditions WHERE id = ?",
            [id]
        );

        if (rows.length === 0) {
            return res.status(404).json({
                error: "Expedition not found"
            });
        }

        res.status(200).json(rows[0]);
    } catch (error) {
        console.error(error);

        res.status(500).json({
            error: "Unable to retrieve expedition"
        });
    }
});

app.post("/expeditions", async (req, res) => {
    const {
        name,
        destination,
        difficulty,
        party_size,
        duration_days,
        campsite
    } = req.body;

    if (
        !name ||
        !destination ||
        !difficulty ||
        !campsite ||
        !Number.isInteger(party_size) ||
        party_size <= 0 ||
        !Number.isInteger(duration_days) ||
        duration_days <= 0
    ) {
        return res.status(400).json({
            error: "Please provide valid expedition details"
        });
    }

    try {
        const [result] = await pool.query(
            `INSERT INTO expeditions
            (name, destination, difficulty, party_size, duration_days, campsite)
            VALUES (?, ?, ?, ?, ?, ?)`,
            [
                name,
                destination,
                difficulty,
                party_size,
                duration_days,
                campsite
            ]
        );

        res.status(201).json({
            message: "Expedition created successfully",
            id: result.insertId
        });
    } catch (error) {
        console.error(error);

        res.status(500).json({
            error: "Unable to create expedition"
        });
    }
});

function main() {
    app.listen(PORT, () => {
        console.log(`Adventurer's Guild API running on port ${PORT}`);
    });
}

main();
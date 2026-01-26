const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

// Friendly homepage
app.get("/", (req, res) => {
  res.status(200).send("Comic Discovery API is running. Try /health");
});

// Health check endpoint
app.get("/health", (req, res) => {
  res.status(200).json({ ok: true, message: "Comic Discovery API is running" });
});

app.listen(PORT, () => {
  console.log(`API listening on http://localhost:${PORT}`);
});

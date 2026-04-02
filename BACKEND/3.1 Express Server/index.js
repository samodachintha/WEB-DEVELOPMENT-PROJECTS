import express from "express";
const app = express();

app.get("/", (req, res) => {
    res.send("Hello World!");
});

app.listen(3000, () => {
    console.log("Server started on port 3000");
});

app.get("/contact", (req, res) => {
    res.send("Contact me at [EMAIL_ADDRESS]");
});

app.get("/about", (req, res) => {
    res.send("I am a web developer");
});
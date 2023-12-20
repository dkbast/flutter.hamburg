import express from "express";
import events from "./events.json";
import { getFeaturedAndOthers } from "./model";

const app = express();
const port = 3000;
app.set("view engine", "pug");
app.use(express.static("public"));

app.get("/", (req, res) => {
  res.render("index", getFeaturedAndOthers(events));
});

app.listen(port, () => {
  console.log(`express listening on port ${port}`);
});

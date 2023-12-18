import express from "express";
import events from "./events.json";

const app = express();
const port = 3000;
app.set("view engine", "pug");
app.use(express.static("public"));

const featured = events.find((e) => e.isFeatured);
const other = events.filter((e) => !e.isFeatured);

app.get("/", (req, res) => {
  res.render("index", { featured, other });
});

app.listen(port, () => {
  console.log(`express listening on port ${port}`);
});

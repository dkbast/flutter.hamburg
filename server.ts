import express from "express";
import events from "./events.json";
import { addDateFields } from "./dateHelper";
import { Event } from "./model";

const app = express();
const port = 3000;
app.set("view engine", "pug");
app.use(express.static("public"));

const withDateFields: Event[] = addDateFields(events);
const featured = withDateFields.find((e) => e.isFeatured);
const other = withDateFields
  .filter((e) => !e.isFeatured)
  .sort((a, b) => (b.startDateISO < a.startDateISO ? -1 : 0));

app.get("/", (req, res) => {
  res.render("index", { featured, other });
});

app.listen(port, () => {
  console.log(`express listening on port ${port}`);
});

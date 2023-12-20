import pug from "pug";
import events from "./events.json";
import fs from "node:fs";
import { getFeaturedAndOthers } from "./model";

const html = pug.renderFile("views/index.pug", {
  ...getFeaturedAndOthers(events),
  pretty: true,
});

fs.writeFile("public/index.html", html, (err) => {
  if (err) throw err;
  console.log("build successful");
});

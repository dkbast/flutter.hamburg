import { describe, test } from "node:test";
import { addDateFields } from "./dateHelper";
import assert from "node:assert";

const validEvent = {
  title: "",
  summary: "Tarum parum ipsum dolor sit amet, consectet for bar et.",
  description: [],
  isFeatured: false,
  status: "Free",
  location: "",
  link: "/",
  startDateISO: "2023-05-11T20:30:00Z",
  endDateISO: "2023-05-11T22:30:00Z",
  hosts: [],
  tags: [],
};

const withMalformedDateString = {
  title: "",
  summary: "Tarum parum ipsum dolor sit amet, consectet for bar et.",
  description: [],
  isFeatured: false,
  status: "Free",
  location: "",
  link: "/",
  startDateISO: "wrong iso string",
  endDateISO: "wrong iso string",
  hosts: [],
  tags: [],
};

describe("addDateFields", () => {
  describe("when event is correctly specified", () => {
    test("adds expected fields", () => {
      assert.deepEqual(addDateFields([validEvent]), [
        {
          ...validEvent,
          month: "May",
          day: 11,
          hours: "10:30 PM - 12:30 AM GMT+2",
          inThePast: true,
        },
      ]);
    });
  });
  describe("when event's iso date strings are malformed", () => {
    test("does not add addition date fields", () => {
      assert.deepEqual(addDateFields([withMalformedDateString]), [
        withMalformedDateString,
      ]);
    });
  });
});

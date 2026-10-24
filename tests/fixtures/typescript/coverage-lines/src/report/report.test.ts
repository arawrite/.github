import { expect, it } from "vitest";
import { report } from "./report";

it("says one star in the singular", () => {
  expect(report(0.5)).toBe("1 star");
});

it("says other counts in the plural", () => {
  expect(report(0.9)).toBe("3 stars");
});

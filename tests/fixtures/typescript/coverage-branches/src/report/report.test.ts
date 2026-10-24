import { expect, it } from "vitest";
import { report } from "./report";

it("says other counts in the plural", () => {
  expect(report(0.9)).toBe("3 stars");
});

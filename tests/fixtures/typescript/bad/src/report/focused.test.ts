import { expect, it } from "vitest";
import { report } from "./report";

it.only("says one star", () => {
  expect(report(0.5)).toBe("1 star");
});

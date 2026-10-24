import { expect, it } from "vitest";
import { report } from "./report";

it.skip("says three stars", () => {
  expect(report(0.9)).toBe("3 stars");
});

it.todo("says no stars");

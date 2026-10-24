import { expect, it } from "vitest";
import { stars } from "./stars";

it("earns four stars at the top score", () => {
  expect(stars(1)).toBe(4);
});

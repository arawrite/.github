import { expect, it } from "vitest";
import { stars } from "./stars";

it("earns a star at each threshold", () => {
  expect([0.39, 0.4, 0.65, 0.85].map(stars)).toEqual([0, 1, 2, 3]);
});

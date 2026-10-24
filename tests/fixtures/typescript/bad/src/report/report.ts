import { stars } from "../rules/stars";
import { label } from "./label";

export function report(score: number): string {
  return label(stars(score));
}

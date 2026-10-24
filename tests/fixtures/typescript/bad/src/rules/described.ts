import { label } from "../report/label";
import { stars } from "./stars";

export function described(score: number): string {
  return label(stars(score));
}

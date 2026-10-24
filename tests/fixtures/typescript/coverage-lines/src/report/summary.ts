import { report } from "./report";

export function summary(first: number, second: number): string {
  const joined = `${report(first)}, ${report(second)}`;
  return `Scores: ${joined}`;
}

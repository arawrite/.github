export function label(count: number): string {
  let noun = "star";
  if (count !== 1) {
    noun = "stars";
  }
  return `${String(count)} ${noun}`;
}

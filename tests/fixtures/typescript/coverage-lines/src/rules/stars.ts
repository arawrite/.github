const thresholds = [0.4, 0.65, 0.85];

export function stars(score: number): number {
  return thresholds.filter((threshold) => score >= threshold).length;
}

const _thresholds = [0.40, 0.65, 0.85];

int stars(double score) =>
    _thresholds.where((threshold) => score >= threshold).length;

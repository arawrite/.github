THRESHOLDS = (0.40, 0.65, 0.85)


def stars(score: float) -> int:
    return sum(score >= threshold for threshold in THRESHOLDS)

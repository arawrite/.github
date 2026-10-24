from stars.report.label import label
from stars.rules.stars import stars


def report(score: float) -> str:
    return label(stars(score))

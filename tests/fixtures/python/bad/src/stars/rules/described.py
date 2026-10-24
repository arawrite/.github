from stars.report.label import label
from stars.rules.stars import stars


def described(score: float) -> str:
    return label(stars(score))

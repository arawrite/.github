from stars.report.report import report


def summary(first: float, second: float) -> str:
    joined = f"{report(first)}, {report(second)}"
    return f"Scores: {joined}"

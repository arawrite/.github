from stars.report.report import report


def test_other_counts_are_plural() -> None:
    assert report(0.9) == "3 stars"

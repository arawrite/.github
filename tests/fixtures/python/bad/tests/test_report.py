from stars.report.report import report


def test_one_star_is_singular() -> None:
    assert report(0.5) == "1 star"


def test_other_counts_are_plural() -> None:
    assert report(0.9) == "3 stars"

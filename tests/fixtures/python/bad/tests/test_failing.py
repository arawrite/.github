from stars.rules.stars import stars


def test_top_score_earns_four_stars() -> None:
    assert stars(1.0) == 4

from stars.rules.stars import stars


def test_each_threshold_earns_a_star() -> None:
    assert [stars(score) for score in (0.39, 0.40, 0.65, 0.85)] == [0, 1, 2, 3]

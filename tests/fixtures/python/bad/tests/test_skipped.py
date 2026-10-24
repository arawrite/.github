import pytest

from stars.report.report import report


@pytest.mark.skip(reason="Slow")
def test_skipped() -> None:
    assert report(0.9) == "3 stars"

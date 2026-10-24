def label(count: int) -> str:
    noun = "star"
    if count != 1:
        noun = "stars"
    return f"{count} {noun}"

import re


def slugify(value: str) -> str:
    value = value.strip().lower()
    return re.sub(r"\\s+", "-", value)

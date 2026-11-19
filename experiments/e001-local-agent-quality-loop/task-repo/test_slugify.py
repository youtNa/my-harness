from slugify import slugify


def test_basic_slug():
    assert slugify("Hello World") == "hello-world"


def test_empty_slug():
    assert slugify("   ") == ""

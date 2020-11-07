# -*- coding: utf-8 -*-
from dupekiller import files


def test_walk() -> None:
    assert len(files.walk("./tests")) == 2

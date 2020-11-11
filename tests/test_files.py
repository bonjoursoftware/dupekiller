# -*- coding: utf-8 -*-
import os

import pytest

from dupekiller import finder

TMP_FILES_NUM = 2


@pytest.fixture
def tmp_files(tmp_path):
    for index in range(TMP_FILES_NUM):
        with open(os.path.join(tmp_path, f"file_{index}"), "x") as file:
            file.write(str(index))
    return tmp_path


def test_walk(tmp_files) -> None:
    print(tmp_files)
    assert len(finder.walk(str(tmp_files))) == TMP_FILES_NUM

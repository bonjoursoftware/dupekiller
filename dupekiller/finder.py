# -*- coding: utf-8 -*-
import os

from typing import List


class File:
    def __init__(self, name: str, parent: str):
        self.name = name
        self.parent = parent
        self.size = os.path.getsize(os.path.join(parent, name))

    def __repr__(self):
        return f"File({self.parent}{os.path.sep}{self.name}: {self.size})"


def walk(path: str) -> List[File]:
    return [
        File(file, parent)
        for parent, directories, files in os.walk(path)
        for file in files
    ]

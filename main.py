#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from os import getcwd

from dupekiller import files


def main() -> None:
    print(files.walk(getcwd()))


if __name__ == '__main__':
    main()

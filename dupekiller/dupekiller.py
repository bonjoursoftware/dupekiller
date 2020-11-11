#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from os import getcwd

import finder


def main() -> None:
    print(finder.walk(getcwd()))


if __name__ == "__main__":
    main()

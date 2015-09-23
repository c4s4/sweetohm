#!/usr/bin/env python

"""
Pandoc filter to add a path to image files. You must install library
pandocfilters:

    $ pip install pandocfilters

"""

from pandocfilters import toJSONFilter, Image


PATH = 'content/article/'


def image(key, value, format, meta):
    if key == 'Image':
        value[1][0] = PATH + value[1][0]
        return Image(value[0], value[1])


if __name__ == "__main__":
    toJSONFilter(image)

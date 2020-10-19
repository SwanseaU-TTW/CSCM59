#!/usr/bin/env sh

find . -iname '*.md' -o -iname '*.jpg' -o -iname '*.png' | entr make


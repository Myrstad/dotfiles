#!/bin/bash

wallsPath=$HOME/.wallpaper

for entry in "$wallsPath"/*
do
  filename=$(basename "$entry")
  echo -en "$entry\0icon\x1f$entry\n"
done

#!/bin/zsh

acpi | awk '{print $4 "  " $5}' | tr -d ','

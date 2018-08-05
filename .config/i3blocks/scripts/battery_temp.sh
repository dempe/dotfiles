#!/bin/zsh

echo $(acpi -t | awk '{print $4}')°C

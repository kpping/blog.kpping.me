#!/bin/bash 

hugo serve -p 1313 --bind="0.0.0.0" -b $(ip -4 addr show enp0s8 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
#!/bin/sh

nvidia-smi --query-gpu=utilization.gpu,memory.used --format=csv,noheader| awk '{ print "GPU",""$1"","-",""$3"", ""$4""}'

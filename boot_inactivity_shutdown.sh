#!/bin/bash
if [ $(sleep 600 && xprintidle) -gt "598000" ]; then shutdown -P now; fi

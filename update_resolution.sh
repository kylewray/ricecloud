#!/bin/bash

nitrogen --restore &

killall polybar
polybar ricecloud &


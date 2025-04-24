#!/bin/bash

echo "=========================================="
echo "               Starting..."

# ============================================================================

filename="Config.cfg"

PROJECT_NAME=$(grep 'PROJECT_NAME' $filename | awk -F '=' '{print $2}')
PROJECT_VERSION=$(grep 'PROJECT_VERSION' $filename | awk -F '=' '{print $2}')
CPP_VERSION=$(grep 'CPP_VERSION' $filename | awk -F '=' '{print $2}')
GENERATOR=Xcode

# ============================================================================

echo "=========================================="
echo "         Creating $GENERATOR project..."
echo "=========================================="

cmake -G $GENERATOR -B $GENERATOR

echo "=========================================="
echo "             Opening $GENERATOR..."
echo "=========================================="

open $GENERATOR/$PROJECT_NAME.xcodeproj
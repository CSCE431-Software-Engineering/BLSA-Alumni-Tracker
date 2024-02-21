#!/bin/bash

PROJECT_ROOT=/csce431/BLSA-Alumni-Tracker

if [[ $* == *--help* ]] || [[ $* == *-h* ]]
then
    echo "PURPOSE:"
    echo "  Clear the tmp project folder"
    echo ""
    echo "Use:"
    echo "    $0 [OPTIONS]"
    echo ""
    echo "OPTIONS:"
    echo "  -c, --capybara  Clears the capybara folder (useful for testing)"
    echo ""
    exit 0
fi

if [[ $* == *--capybara* ]] || [[ $* == *-c* ]]
then
    echo Removing $PROJECT_ROOT/tmp/capybara files...
    rm $PROJECT_ROOT/tmp/capybara/*
fi
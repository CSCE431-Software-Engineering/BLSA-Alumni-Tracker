#!/bin/bash

TEST_DIR="/csce431/BLSA-Alumni-Tracker/spec"

SYSTEM_TEST_DIR="${TEST_DIR}/system"

# Associated files
UNIVERSITY_TESTS="${SYSTEM_TEST_DIR}/creating_universities_spec.rb"


if [[ $* == *--help* ]] || [[ $* == *-h* ]]
then
    echo "PURPOSE:"
    echo "  Run rspec tests"
    echo ""
    echo "Use:"
    echo "    $0 [OPTIONS] [TEST_TYPE(s)]"
    echo ""
    echo "OPTIONS:"
    echo "  None so far"
    echo ""
    echo "TEST_TYPE(s):"
    echo "  university"
    echo ""
    exit 0
fi

if [[ $* == *university* ]]
then
    rspec $UNIVERSITY_TESTS
fi

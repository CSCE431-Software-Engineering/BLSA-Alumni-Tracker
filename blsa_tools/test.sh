#!/bin/bash
shopt -s expand_aliases
alias echo='echo -e'

# Unimporant Vars
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"
B="\e[0;34m"
P="\e[0;35m"
W="\e[0;37m"

# Useful dirs
TEST_DIR="/csce431/BLSA-Alumni-Tracker/spec"

SYSTEM_TEST_DIR="${TEST_DIR}/system"
MODEL_TEST_DIR="${TEST_DIR}/models"

# Helper Functions
echo_tests () {
    for test in $@;
    do
        echo "${P}Testing ${test}...${W}"
    done
}

# Associated files
declare -a UNIVERSITY_TESTS=(
    [0]="${SYSTEM_TEST_DIR}/creating_universities_spec.rb"
    [1]="${SYSTEM_TEST_DIR}/deleting_universities_spec.rb"
    [2]="${SYSTEM_TEST_DIR}/updating_universities_spec.rb"
    [3]="${MODEL_TEST_DIR}/universities_spec.rb"
)
declare -a EDUCATION_INFO_TESTS=(
    [0]="${SYSTEM_TEST_DIR}/creating_education_infos_spec.rb"
    [1]="${SYSTEM_TEST_DIR}/deleting_education_infos_spec.rb"
    [2]="${SYSTEM_TEST_DIR}/updating_education_infos_spec.rb"
    [3]="${MODEL_TEST_DIR}/education_infos_spec.rb"
)

# Other Important Test Groups
declare -a INTEGRITY_TESTS=(
    [1]="${SYSTEM_TEST_DIR}/deleting_education_infos_spec.rb"
    [2]="${SYSTEM_TEST_DIR}/updating_education_infos_spec.rb"
)

if [[ $* == *--help* ]] || [[ $* == *-h* ]] || [[ $# == 0 ]]
then
    echo "PURPOSE:"
    echo "  Run rspec tests"
    echo ""
    echo "Use:"
    echo "    $0 ${Y}[OPTIONS]${G} [TEST_TYPE(s)]${W}"
    echo ""
    echo "${Y}OPTIONS:${W}"
    echo "  None so far"
    echo ""
    echo "${G}TEST_TYPE(s):${W}"
    echo "  university"
    echo "  integrity"
    echo "  education"
    echo ""
    exit 0
fi

if [[ $* == *all* ]]
then
    echo Cleaning up database...
    rails db:reset
    echo Seeding database...
    RAILS_ENV=test rails db:seed

    rspec spec/.
fi

if [[ $* == *university* ]]
then
    echo_tests "${UNIVERSITY_TESTS[@]}"
    rspec "${UNIVERSITY_TESTS[@]}"
fi

if [[ $* == *education* ]]
then
    echo_tests "${EDUCATION_INFO_TESTS[@]}"
    rspec "${EDUCATION_INFO_TESTS[@]}"
fi

if [[ $* == *integrity* ]]
then
    echo_tests "${INTEGRITY_TESTS[@]}"
    rspec "${INTEGRITY_TESTS[@]}"
fi

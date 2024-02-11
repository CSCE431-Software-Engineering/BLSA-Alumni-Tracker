#!/bin/bash

if [[ $* == *--help* ]] || [[ $* == *--help* ]]
then
    echo "Use:"
    echo "    $0 [OPTIONS]"
    echo ""
    echo "OPTIONS:"
    echo "  --tailwind  Precompiles assets for use by tailwind"
    echo ""
    exit 0
fi

# Compile if tailwind flag is set
if [[ $* == *--tailwind* ]]
then
    echo "Compiling assets..."
    rails assets:precompile
fi

# Run server (bind on all interfaces)
echo "Starting server..."
rails server --binding=0.0.0.0

#!/bin/bash

# Trigger a deployment.
gh workflow run Deploy

# If we pass the "--watch" flag to the script, we'll attempt to watch the run.
if [ "$1" == "--watch" ]; then
    # We need to sleep for a few seconds to give the deployment time to resolve.
    sleep 3

    # Get the latest run ID from the list.
    run_id=$(gh run list --limit 1 --workflow Deploy --json url | grep -Eow "[0-9]+")

    # Start watching the latest run.
    gh run watch $run_id
fi

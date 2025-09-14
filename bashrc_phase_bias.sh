#!/bin/bash
## Automatically detect InSAR_PhaseBias_Correction path based on this script's location

export PhaseBias_local_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

## Remove any previous occurrences of the default system InSAR_PhaseBias_Correction path
export PATH=$(echo "$PATH" | awk -v RS=: -v ORS=: '$0 !~ "/gws/smf/j04/nceo_geohazards/software/InSAR_PhaseBias_Correction"' | sed 's/:$//')
export PYTHONPATH=$(echo "$PYTHONPATH" | awk -v RS=: -v ORS=: '$0 !~ "/gws/smf/j04/nceo_geohazards/software/InSAR_PhaseBias_Correction"' | sed 's/:$//')

## Prepend your own local path
export PATH="$PhaseBias_local_path/bin:$PhaseBias_local_path:$PATH"
export PYTHONPATH="$PhaseBias_local_path:$PYTHONPATH"

# ## Confirm change
# echo "Custom PhaseBias path applied: $PhaseBias_local_path"
# echo "$PATH" | tr ':' '\n' | grep PhaseBias
# echo "$PYTHONPATH" | tr ':' '\n' | grep PhaseBias


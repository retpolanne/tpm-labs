#!/bin/bash

echo "Type the sopin"
read -s sopin
tpm2_ptool addtoken --pid=1 --label=ssh --sopin="$sopin" --userpin=""

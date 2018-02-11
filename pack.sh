#!/bin/bash
rm ../JavaAnsible*.tar.gz
# This command will convert all non-binary fines to the linux line endings
find . -type f -not -path '*/\.*' -exec grep -Il '.' {} \; | xargs -n1 '\n' -L 1 dos2unix -k
tar -cz --exclude='.git' --exclude='.idea' -f ../JavaAnsible.0.0.0.72.tar.gz *

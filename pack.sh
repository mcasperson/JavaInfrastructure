#!/bin/bash
rm ../JavaAnsible*.tar.gz
tar -cz --exclude='.git' --exclude='.idea' -f ../JavaAnsible.0.0.0.69.tar.gz *

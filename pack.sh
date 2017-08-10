#!/bin/bash
rm ../JavaAnsible*.tar.gz
tar -czf ../JavaAnsible.0.0.0.5.tar.gz . --exclude='.git' --exclude='.idea'

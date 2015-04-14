#!/bin/sh
find ./ ! -newer /tmp/timestamp  -name "*.swp" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.xls" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.xlsx" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.bk" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.txt" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.csv" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.log" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.xsd" -exec rm {} \;

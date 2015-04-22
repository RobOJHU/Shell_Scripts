#!/bin/sh
find ./ ! -newer /tmp/timestamp  -name "*.swp" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.xls" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.xlsx" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.bk" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.txt" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.TXT" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.csv" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.log" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.xsd" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.old" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.bad" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.sergey" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.pgp" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.pdf" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.PDF" -exec rm {} \;
find ./ ! -newer /tmp/timestamp  -name "*.gpg" -exec rm {} \;

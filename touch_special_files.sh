#!/bin/sh
find ./ -name "*.sh" -exec touch --date '2016-04-01' {} \;
find ./ -name "*.c" -exec touch --date '2016-04-01' {} \;
find ./ -name "*.java" -exec touch --date '2016-04-01' {} \;
find ./ -name "*.key" -exec touch --date '2016-04-01' {} \;
find ./ -name "*.sql" -exec touch --date '2016-04-01' {} \;
find ./ -name "*.bash" -exec touch --date '2016-04-01' {} \;
find ./ -name "*.php" -exec touch --date '2016-04-01' {} \;

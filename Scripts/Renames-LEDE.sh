#!/bin/bash

#批量重命名为 主机名_型号_日期
for var in $LEDE_TYPE; do
  for file in $(find ./ -type f -iname "*$var*.*"); do
    export ext=$(basename "$file" | cut -d '.' -f 2-3)
    export name=$(basename "$file" | cut -d '.' -f1 | grep -io "\($var\).*")
    export new_file="$LEDE_NAME"_"$name"_"$LEDE_DATE"."$ext"
    mv -f "$file" "$new_file"
  done
done
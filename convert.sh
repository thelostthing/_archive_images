#!/bin/bash

echo Clone directory structure ...
find -L ./_source -type d | cut -sd / -f 3- | sed '/^$/d' | xargs mkdir -p;

echo Clone json files ...
find -L ./_source -name '*.json' | cut -sd / -f 3- | sed '/^$/d' | while read varname; do cp ./_source/$varname $varname; done;

echo Convert jpg files ...
find -L ./_source -name '*.jpg' | cut -sd / -f 3- | sed '/^$/d' | while read varname; do mogrify -path $(dirname "${varname}") -quality 50 -strip ./_source/$varname; done;

echo Done
#!/bin/bash -e
pushd $(dirname $0) > /dev/null
rm -rf book || true
/usr/bin/env git clone https://github.com/timurn/modern_perl_book.git book --quiet -b russian_translation
cd book/translation/ru
mkdir -p build/html
/usr/bin/env perl ../../build/tools/build_chapters.pl 2>/dev/null
/usr/bin/env perl ../../build/tools/build_html.pl
cd ../../..
cp book/translation/ru/build/html/* .
rm -rf book
popd > /dev/null

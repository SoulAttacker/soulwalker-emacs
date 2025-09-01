#!/bin/bash
# dependency: gtk3
./autogen.sh
./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --with-native-compilation=yes --with-x-toolkit=gtk3 --with-tree-sitter --with-threads --with-json
make -j$(nproc)


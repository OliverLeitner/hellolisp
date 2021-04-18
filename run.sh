#!/bin/bash
#sbcl --non-interactive --load hello.lsp --quit
sbcl --script hello.lsp --quit
exit 0

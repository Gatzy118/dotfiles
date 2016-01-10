#!/bin/bash

emacs -Q --batch --eval="(progn
    (setq-default indent-tabs-mode nil)
    (add-to-list 'load-path \"/usr/local/Cellar/erlang/17.5/lib/erlang/lib/tools-2.7.2/emacs/\")
    (require 'erlang-start)
    (find-file \"$1\")
    (untabify (point-min) (point-max))
    (erlang-indent-current-buffer)
    (princ (buffer-string))
    )" 2>/dev/null

if [ $? -ne 0 ]; then
    # It failed, echo the file as it was
    cat $1
fi

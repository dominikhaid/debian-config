#!/bin/bash
reset-wal
nitrogen --head=0 --set-zoom-fill "$(< "${HOME}/.cache/wal/wal")"
nitrogen --head=1 --set-zoom-fill "$(< "${HOME}/.cache/wal/wal")"
nitrogen --head=3 --set-zoom-fill "$(< "${HOME}/.cache/wal/wal")"

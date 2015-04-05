#!/bin/bash

set -euo pipefail


nim c --threads:on -p:"../src" lthread_sleep.nim
nim c --threads:on -p:"../src" lthread_join.nim


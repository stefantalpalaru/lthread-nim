# compile with --threads:on
import lthread, os, times, strutils

proc a(x: pointer) {.cdecl.} =
    var
        i = 3
        t1, t2: float
        sleep_for = 2000.uint64
    lthread.detach()
    while i > 0:
        dec i
        t1 = epochTime()
        lthread.sleep(sleep_for)
        t2 = epochTime()
        echo("a ($#): elapsed is: $#, slept is $#".format(i, formatFloat((t2 - t1) * 1000, ffDecimal, 6), sleep_for))

var lt: ptr lthread_t
discard lthread.create(addr lt, a, nil)
lthread.run()


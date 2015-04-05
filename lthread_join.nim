# compile with --threads:on
import lthread, os

proc b(x: pointer) {.cdecl.} =
    echo("b is running")
    discard lthread.compute_begin()
    sleep(1000)
    lthread.compute_end()
    echo("b is exiting")

proc a(x: pointer) {.cdecl.} =
    var lt_new: ptr lthread_t
    lthread.detach()
    echo("a is running")
    discard lthread.create(addr lt_new, b, nil)
    var res: cint
    while true:
        res = lthread.join(lt_new, nil, 10)
        if res != -2: # -2 means the timeout was reached
            break
    echo("a is done joining on b.")

var lt: ptr lthread_t
discard lthread.create(addr lt, a, nil)
lthread.run()


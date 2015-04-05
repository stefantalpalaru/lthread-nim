#
#  Lthread
#  Copyright (C) 2012, Hasan Alayli <halayli@gmail.com>
# 
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
# 
#  THIS SOFTWARE IS PROVIDED BY AUTHOR AND CONTRIBUTORS ``AS IS'' AND
#  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
#  ARE DISCLAIMED.  IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
#  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
#  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
#  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
#  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
#  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
#  SUCH DAMAGE.
# 
#  lthread.h
# 

{.deadCodeElim: on.}

from posix import Sockaddr, Socklen, TIOVec, Tmsghdr, TPollfd, Tnfds

when defined(windows):
  const
    lthread_lib = "liblthread.dll"
elif defined(macosx):
  const
    lthread_lib = "liblthread.dylib"
else:
  const
    lthread_lib = "liblthread.so"

type 
    lthread* = object 
    cond* = object 
    lthread_t* = lthread
    cond_t* = cond
    function* = proc (a2: pointer) {.cdecl.}

proc summary*(): cstring {.cdecl, importc: "lthread_summary", dynlib: lthread_lib.}
proc create*(new_lt: ptr ptr lthread_t; a3: function; arg: pointer): cint {.cdecl, importc: "lthread_create", dynlib: lthread_lib.}
proc cancel*(lt: ptr lthread_t) {.cdecl, importc: "lthread_cancel", dynlib: lthread_lib.}
proc run*() {.cdecl, importc: "lthread_run", dynlib: lthread_lib.}
proc join*(lt: ptr lthread_t; `ptr`: ptr pointer; timeout: uint64): cint {.cdecl, importc: "lthread_join", dynlib: lthread_lib.}
proc detach*() {.cdecl, importc: "lthread_detach", dynlib: lthread_lib.}
proc detach2*(lt: ptr lthread_t) {.cdecl, importc: "lthread_detach2", dynlib: lthread_lib.}
proc exit*(`ptr`: pointer) {.cdecl, importc: "lthread_exit", dynlib: lthread_lib.}
proc sleep*(msecs: uint64) {.cdecl, importc: "lthread_sleep", dynlib: lthread_lib.}
proc wakeup*(lt: ptr lthread_t) {.cdecl, importc: "lthread_wakeup", dynlib: lthread_lib.}
proc cond_create*(c: ptr ptr cond_t): cint {.cdecl, importc: "lthread_cond_create", dynlib: lthread_lib.}
proc cond_wait*(c: ptr cond_t; timeout: uint64): cint {.cdecl, importc: "lthread_cond_wait", dynlib: lthread_lib.}
proc cond_signal*(c: ptr cond_t) {.cdecl, importc: "lthread_cond_signal", dynlib: lthread_lib.}
proc cond_broadcast*(c: ptr cond_t) {.cdecl, importc: "lthread_cond_broadcast", dynlib: lthread_lib.}
proc init*(size: csize): cint {.cdecl, importc: "lthread_init", dynlib: lthread_lib.}
proc get_data*(): pointer {.cdecl, importc: "lthread_get_data", dynlib: lthread_lib.}
proc set_data*(data: pointer) {.cdecl, importc: "lthread_set_data", dynlib: lthread_lib.}
proc current*(): ptr lthread_t {.cdecl, importc: "lthread_current", dynlib: lthread_lib.}
proc socket*(a2: cint; a3: cint; a4: cint): cint {.cdecl, importc: "lthread_socket", dynlib: lthread_lib.}
proc pipe*(fildes: array[2, cint]): cint {.cdecl, importc: "lthread_pipe", dynlib: lthread_lib.}
proc accept*(fd: cint; a3: ptr Sockaddr; a4: ptr Socklen): cint {.cdecl, importc: "lthread_accept", dynlib: lthread_lib.}
proc close*(fd: cint): cint {.cdecl, importc: "lthread_close", dynlib: lthread_lib.}
proc set_funcname*(f: cstring) {.cdecl, importc: "lthread_set_funcname", dynlib: lthread_lib.}
proc id*(): uint64 {.cdecl, importc: "lthread_id", dynlib: lthread_lib.}
proc self*(): ptr lthread {.cdecl, importc: "lthread_self", dynlib: lthread_lib.}
proc connect*(fd: cint; a3: ptr Sockaddr; a4: Socklen; timeout: uint64): cint {.cdecl, importc: "lthread_connect", dynlib: lthread_lib.}
proc recv*(fd: cint; buf: pointer; buf_len: csize; flags: cint; timeout: uint64): int {.cdecl, importc: "lthread_recv", dynlib: lthread_lib.}
proc read*(fd: cint; buf: pointer; length: csize; timeout: uint64): int {.cdecl, importc: "lthread_read", dynlib: lthread_lib.}
proc readline*(fd: cint; buf: cstringArray; max: csize; timeout: uint64): int {.cdecl, importc: "lthread_readline", dynlib: lthread_lib.}
proc recv_exact*(fd: cint; buf: pointer; buf_len: csize; flags: cint; timeout: uint64): int {.cdecl, importc: "lthread_recv_exact", dynlib: lthread_lib.}
proc read_exact*(fd: cint; buf: pointer; length: csize; timeout: uint64): int {.cdecl, importc: "lthread_read_exact", dynlib: lthread_lib.}
proc recvmsg*(fd: cint; message: ptr Tmsghdr; flags: cint; timeout: uint64): int {.cdecl, importc: "lthread_recvmsg", dynlib: lthread_lib.}
proc recvfrom*(fd: cint; buf: pointer; length: csize; flags: cint; address: ptr Sockaddr; address_len: ptr Socklen; timeout: uint64): int {.cdecl, importc: "lthread_recvfrom", dynlib: lthread_lib.}
proc send*(fd: cint; buf: pointer; buf_len: csize; flags: cint): int {.cdecl, importc: "lthread_send", dynlib: lthread_lib.}
proc write*(fd: cint; buf: pointer; buf_len: csize): int {.cdecl, importc: "lthread_write", dynlib: lthread_lib.}
proc sendmsg*(fd: cint; message: ptr Tmsghdr; flags: cint): int {.cdecl, importc: "lthread_sendmsg", dynlib: lthread_lib.}
proc sendto*(fd: cint; buf: pointer; length: csize; flags: cint; dest_addr: ptr Sockaddr; dest_len: Socklen): int {.cdecl, importc: "lthread_sendto", dynlib: lthread_lib.}
proc writev*(fd: cint; iov: ptr TIOVec; iovcnt: cint): int {.cdecl, importc: "lthread_writev", dynlib: lthread_lib.}
proc wait_read*(fd: cint; timeout_ms: cint): cint {.cdecl, importc: "lthread_wait_read", dynlib: lthread_lib.}
proc wait_write*(fd: cint; timeout_ms: cint): cint {.cdecl, importc: "lthread_wait_write", dynlib: lthread_lib.}
when defined(freebsd):
    proc sendfile*(fd: cint; s: cint; offset: off_t; nbytes: csize; hdtr: ptr sf_hdtr): cint {.cdecl, importc: "lthread_sendfile", dynlib: lthread_lib.}
proc io_write*(fd: cint; buf: pointer; nbytes: csize): int {.cdecl, importc: "lthread_io_write", dynlib: lthread_lib.}
proc io_read*(fd: cint; buf: pointer; nbytes: csize): int {.cdecl, importc: "lthread_io_read", dynlib: lthread_lib.}
proc poll*(fds: ptr TPollfd; nfds: Tnfds; timeout: cint): cint {.cdecl, importc: "lthread_poll", dynlib: lthread_lib.}
proc compute_begin*(): cint {.cdecl, importc: "lthread_compute_begin", dynlib: lthread_lib.}
proc compute_end*() {.cdecl, importc: "lthread_compute_end", dynlib: lthread_lib.}


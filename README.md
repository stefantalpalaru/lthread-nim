## description

[Nim language][1] bindings for [lthread][2] - a multicore enabled coroutine library written in C.

## license

BSD-2

## notes

- header processed with:
```sh
c2nim --dynlib:lthread_lib --cdecl --prefix:lthread_ lthread.h
```

## credits

- author: Ștefan Talpalaru <stefantalpalaru@yahoo.com>

- homepage: https://github.com/stefantalpalaru/lthread-nim

[1]: http://nim-lang.org/
[2]: https://github.com/halayli/lthread


example code to reproduce bug https://github.com/ndmitchell/ghcid/issues/57#issuecomment-208967021

###  Setup

project consist of

  - package 'a' in a/
    - library Exposing module A
    - executable

  - package 'b' in b/
    - depends on 'a'
    - library Exposing module B (B import stuff from module A in pakcage a)
    - executable

  - package 'ghcid-test' in .
    - depends on 'a' and 'b'
    - library Exposing module Test

no .ghci file is present

### problem:

All example above are run from the ghcid-test folder

1. simple ghcid invocation : No reloading

```shell
$ ghcid
Loading stack ghci --test --ghci-options=-fno-code ...
The following GHC options are incompatible with GHCi and have not been passed to it: -threaded

* * * * * * * *
The main module to load is ambiguous. Candidates are:
1. Package `a' component exe:a-exe with main-is file: /Users/rvion/dev/ghcid-test/a/app/Main.hs
2. Package `b' component exe:b-exe with main-is file: /Users/rvion/dev/ghcid-test/b/app/Main.hs
You can specify which one to pick by:
 * Specifying targets to stack ghci e.g. stack ghci a:exe:a-exe
 * Specifying what the main is e.g. stack ghci --main-is a:exe:a-exe
Specify main module to use (press enter to load none): Not loading any main modules, as no valid module selected
 * Choosing from the candidate above [1..2]

* * * * * * * *

Configuring GHCi with the following packages: ghcid-test, a, b
GHCi, version 7.10.3: http://www.haskell.org/ghc/  :? for help
[1 of 3] Compiling A                ( /Users/rvion/dev/ghcid-test/a/src/A.hs, nothing )
[2 of 3] Compiling B                ( /Users/rvion/dev/ghcid-test/b/src/B.hs, nothing )
[3 of 3] Compiling Test             ( Test.hs, nothing )
Ok, modules loaded: Test, B, A.
```

when I change any file, nothing reload.


-----------------

here is the output of my `stack ghci` invocation:

```shell
$ stack ghci
The following GHC options are incompatible with GHCi and have not been passed to it: -threaded

* * * * * * * *
The main module to load is ambiguous. Candidates are:
1. Package `a' component exe:a-exe with main-is file: /Users/rvion/dev/ghcid-test/a/app/Main.hs
2. Package `b' component exe:b-exe with main-is file: /Users/rvion/dev/ghcid-test/b/app/Main.hs
You can specify which one to pick by:
 * Specifying targets to stack ghci e.g. stack ghci a:exe:a-exe
 * Specifying what the main is e.g. stack ghci --main-is a:exe:a-exe
 * Choosing from the candidate above [1..2]
* * * * * * * *

Specify main module to use (press enter to load none):
```

then I press enter at the prompt, then

```shell
Not loading any main modules, as no valid module selected

Configuring GHCi with the following packages: ghcid-test, a, b
GHCi, version 7.10.3: http://www.haskell.org/ghc/  :? for help
[1 of 3] Compiling A                ( /Users/rvion/dev/ghcid-test/a/src/A.hs, interpreted )
[2 of 3] Compiling B                ( /Users/rvion/dev/ghcid-test/b/src/B.hs, interpreted )
[3 of 3] Compiling Test             ( Test.hs, interpreted )
Ok, modules loaded: Test, B, A.
```

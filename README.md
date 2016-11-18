# figure-out-what-broke

Author: Michael Sevilla

[git-bisect](https://git-scm.com/docs/git-bisect) takes a git commit history
and finds the broken build. "Broken" can refer to a performance regression,
unit test fail, etc. This process is usually done manually but this repository
shows how we can do it automatically -- all you need is a `setup.sh`,
`cleanup.sh`, `benchmark.sh`, and `is_healthy.sh`.  Nightly regression
harnesses can catch a lot of these bugs, but git-bisect is useful if you
recently added tests or performance benchmarks and you want to see if they ever
worked on the system. Here is how it works:

![](https://raw.githubusercontent.com/michaelsevilla/figure-out-what-broke/master/docs/broken.png)

We have 13 commits but we know that something broke between `f9a0e0e` (the
"good commit") and `b029bb5` (the "bad commit"). Then we run git-bisect with
our `is_healthy.sh` script. This script sets up, tests, and tears down the
system and returns a 0 for healthy and 1 for broken. git-bisect does a binary
search of the 11 commits, looking for the commit that broke. For the 11 commits
between "good" and "bad" in the figure above, it tests `869fced` and gets
healthy, then it tests `659cc49` and gets a broken, etc.

## Quickstart

Run git-bisect:

```bash
git bisect start
git bisect bad b029bb5
git bisect good f9a0e0e
git bisect run ./is_healthy.sh
```
This should return:

```bash
659cc49b82677dc2c11c388c397c93800ccac065 is the first bad commit
commit 659cc49b82677dc2c11c388c397c93800ccac065
Author: Michael Sevilla <mikesevilla3@gmail.com>
Date:   Fri Nov 18 05:46:12 2016 +0000

    feature: 10x performance improvement

    Signed-off-by: Michael Sevilla <mikesevilla3@gmail.com>
```

Apparently, my 10x performance improvement isn't all that great.

## Plugging in your infrastructure

The whole process can be automated if you fill in the following scripts:

- `bin/setup.sh`: builds and deploys your system

- `bin/cleanup.sh`: purges the software from your system

- `bin/benchmark.sh`: automated tests that output 0/1 for healthy/broken

- `is_healthy.sh`: script that returns 0/1 for healthy/broken

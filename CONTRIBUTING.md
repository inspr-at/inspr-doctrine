# Contributing

## What this is

A description of how one organisation runs AI coding agents. It is published
because the reasoning may be useful to others, not because it is a standard
anyone should adopt wholesale.

Treat it as **guidance, not governance**. Take what fits. The parts that read as
imperative are the handful where a mistake is irreversible; the rest is reasoning
you are welcome to disagree with, and disagreement is more interesting to us than
compliance.

## Issues are very welcome

Especially:

- a rule that is wrong, or whose stated reason does not hold
- a failure mode the kernel misses
- a rule that reads as universal but is actually specific to our setup — this is
  the most useful thing you can report, because we cannot see it from inside

## Pull requests

**Every change is confirmed by the maintainer ([@markus-barta](https://github.com/markus-barta))
personally.** Not because contribution is unwelcome, but because this file is
loaded automatically, on every turn, into agents acting on real systems. A change
here does not get reviewed at the point of use — it just starts being followed.

So: expect a slow, conservative review, and expect "no" more often than in an
ordinary project. Opening an issue before writing a PR will save you time.

## What will not be merged

- Anything naming a specific operator, host, credential store, tracker or
  project. That belongs in a private counterpart, and there is a CI guard that
  fails the build on it.
- Rules without a reason. If it cannot be justified in a sentence, it will not
  survive contact with a reader who tests it.
- Growth of the kernel itself. It stays small or it stops being loaded. New
  material belongs in a domain pack.

## The guard

`scripts/leak-guard.sh` runs on every push and pull request and fails on
operator-specific content. Run it locally before opening a PR:

```bash
./scripts/leak-guard.sh
```

If it fires on something you believe is generic, say so in the issue — a
false positive is a bug in the pattern list.

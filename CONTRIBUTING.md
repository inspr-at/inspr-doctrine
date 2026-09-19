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

## Developer Certificate of Origin

New contributions use the unmodified [Developer Certificate of Origin 1.1](DCO).
A `Signed-off-by: Name <email>` trailer records that you have the right to submit
the contribution under the project licence. It is not a cryptographic signature
or a guarantee of correctness. Use the same identity as the commit author;
a GitHub-associated noreply address is fine. Sign-offs remain in public history.
This applies to maintainers and outside contributors alike, from adoption onward;
existing history is not rewritten. After reading the DCO, create each new commit
with `git commit -s` using your own name and GitHub-associated email.

Fork the repository, create a branch from the current upstream `main`, implement
and test your change, then push to your fork and open a pull request to `main`.
Describe the change, its purpose, tests, and any limitations. Contributors need
no write access to this repository. The maintainer reviews agent findings and
decides whether to merge; passing checks never grants an agent merge authority.

The required `dco` check validates every commit introduced by a PR, including
merge commits on the contributor branch. An empty or incomplete range fails.
Local checks require Python 3 and full Git history; deepen a shallow checkout
with `git fetch --unshallow` first. When merging upstream updates into your
branch, use `git merge --signoff upstream/main` after fetching upstream.
It reads real Git trailers, so a sign-off quoted in prose does not count.
Missing sign-offs must be supplied by the contributor, not invented by a reviewer
or agent. Do not rewrite shared history to repair them without explicit agreement.

Bots are not exempt. Dependabot's native `Signed-off-by` service address is
accepted for its exact GitHub author identity; other bots use their own matching
author/sign-off identity. This checks declarations, not account authenticity.
For agent-assisted work, the human contributor must understand and authorize
their DCO declaration; the agent must not invent identities or sign for others.

GitHub web commits require sign-off. For squash merges, retain the original
commit messages and move their existing sign-off declarations into the final
trailer block; an indented or quoted sign-off is not a trailer. Check that the
final author still has a matching declaration. Never invent a contributor's
sign-off. Use a regular merge when combining authors would obscure provenance.
Release and deployment remain maintainer-controlled. Existing review and CI
requirements still apply; DCO introduces no second-maintainer requirement.

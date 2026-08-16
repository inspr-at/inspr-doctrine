# inspr-doctrine

The safety baseline we load into every AI coding agent, in every repository, on
every turn.

It is small on purpose. It carries only the rules where breaking one on the first
turn causes damage that cannot be undone — a published credential, a rewritten
branch, a change pushed into someone else's repository. Everything else waits for
a domain pack, because a kernel that grows stops being read.

- **[docs/AGENTS-KERNEL.md](docs/AGENTS-KERNEL.md)** — the kernel itself.

## Using it

Vendor it as a submodule and reference it from whatever file your harness loads
automatically:

```bash
git submodule add https://github.com/inspr-at/inspr-doctrine.git doctrine
```

```markdown
@./doctrine/docs/AGENTS-KERNEL.md
@./AGENTS.md
```

Bump it deliberately, with `git submodule update --remote doctrine`, and treat
the pin as something to keep current — a vendored baseline that silently falls
behind is worse than none, because it looks maintained.

## What is not here

Identity, hostnames, tracker layout, deployment topology, personal preference.
Those exist, and they belong to whoever runs a system rather than to anyone
reading about it. They live in a private counterpart and compose on top of this
baseline: public kernel, then private kernel, then the repository's own notes.

That split is also why this repository can be read without adopting anything.
Nothing here assumes our infrastructure.

## Where it comes from

This is extracted from a working system, not designed in the abstract. Most rules
exist because something went wrong once. Where the reason is short, it is stated
inline — a rule whose justification a reader can check and find false is a rule
they are right to distrust.

## Status

Early. The kernel is the first extracted piece; the domain packs behind it are
still being separated from operator-specific content. Expect additions rather
than reversals.

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md) first — the short version is that this
describes how one organisation works and is offered as reference, so changes are
accepted at the maintainer's discretion.

## Licence

AGPL-3.0-only. See [LICENSE](LICENSE).

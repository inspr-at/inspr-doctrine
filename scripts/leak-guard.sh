#!/usr/bin/env bash
# leak-guard.sh — refuse to publish operator-specific content.
#
# This repository is public. Its private counterpart holds one organisation's
# identity, hosts, trackers and preferences. Nothing from that side may cross.
#
# The guard scans tracked files and fails on any match. It excludes itself,
# since it necessarily contains the patterns it looks for.
set -euo pipefail

SELF="scripts/leak-guard.sh"
WORKFLOW=".github/workflows/leak-guard.yml"

# Operator identity, infrastructure, trackers, project keys.
#
# Deliberately NOT blocked: the maintainer's GitHub handle. A public repository
# has to name who reviews it, so CODEOWNERS and CONTRIBUTING legitimately carry
# it. What must never cross is contact detail, infrastructure and tracker state
# — an email address, a hostname, a credential path, an issue key.
PATTERNS=(
  'markus@'           '@barta\.'          '[a-z0-9.-]+\.cm\b'
  '~/\.inspr'         'agenix'            '1password'
  'hsb[0-9]'          'csb[0-9]'          'mbp[0-9]{4}'
  'agm[0-9]'          'dsc[0-9]'          'imac0'
  'PPMAPIKEY'         'PAIMOS_API_KEY'    'pm\.barta'
  'zitadel'           'headscale'         'tailnet'
  '\bPIXD-'           '\bDSC26'           '\bAMTWEB'
  '\bHAUSV'           '\bINSPR-[0-9]'     '\bOPS-[0-9]'
  '\bNIX-[0-9]'       '\bPAI-[0-9]'       '\bAGM-[0-9]'
  'augmentoring'
)

fail=0
while IFS= read -r f; do
  [ "$f" = "$SELF" ] && continue
  [ "$f" = "$WORKFLOW" ] && continue
  for p in "${PATTERNS[@]}"; do
    if grep -nEi -- "$p" "$f" >/dev/null 2>&1; then
      echo "LEAK  $f  matches /$p/"
      grep -nEi -- "$p" "$f" | head -3 | sed 's/^/        /'
      fail=1
    fi
  done
done < <(git ls-files)

if [ "$fail" -ne 0 ]; then
  echo
  echo "Refusing to publish. Move the content to the private doctrine repository,"
  echo "or generalise it so it names no operator, host, tracker or project."
  exit 1
fi
echo "leak-guard: clean ($(git ls-files | wc -l | tr -d ' ') files scanned)"

## 01-install-claude.sh

## Installs Claude Code for the current user, then again for root so the
## `claude` command is also available in root shells (e.g. `sudo -i`).

set -e

echo "Installing Claude Code for user: $(whoami)"
curl -fsSL https://claude.ai/install.sh | bash

echo "Installing Claude Code for root"
curl -fsSL https://claude.ai/install.sh | sudo CLAUDE_INSTALL_ALLOW_SUDO=1 bash


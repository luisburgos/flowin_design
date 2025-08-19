# setup-git-hooks.sh
#!/bin/bash

# Set the hooks path so Git uses our custom hooks
git config core.hooksPath .githooks
echo "✅  Git hooks path set to .githooks"

# Optional: verify cspell is installed globally
if ! command -v cspell &> /dev/null
then
  echo "⚠️  'cspell' is not installed."
  echo "📦 Installing cspell globally to enable code spell checking in hooks..."
  npm install -g cspell
  echo "✅  cspell installed globally"
else
  echo "✅  cspell already installed"
fi

# Explanation (for future maintainers)
cat <<EOL

📝 Note:
This script sets up Git hooks and ensures 'cspell' is available globally.

We use cspell to catch common typos in Markdown, code comments, and identifiers.
This helps enforce consistent naming and improves code readability.

cspell is installed globally to avoid cluttering the project with node_modules.

EOL

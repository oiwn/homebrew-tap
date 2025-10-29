# Update tarts.rb to specific version
update-tarts version:
    #!/usr/bin/env bash
    set -euo pipefail

    VERSION="{{version}}"
    TARBALL_URL="https://github.com/oiwn/tarts/archive/refs/tags/v${VERSION}.tar.gz"

    echo "Updating tarts.rb to version ${VERSION}..."
    echo "Downloading: ${TARBALL_URL}"

    # Calculate SHA256
    SHA256=$(curl -sL "${TARBALL_URL}" | sha256sum | cut -d' ' -f1)
    echo "SHA256: ${SHA256}"

    # Update formula
    sed -i.bak "s|https://github.com/oiwn/tarts/archive/refs/tags/v.*.tar.gz|${TARBALL_URL}|" tarts.rb
    sed -i.bak "s/sha256 \".*\"/sha256 \"${SHA256}\"/" tarts.rb
    sed -i.bak "s/version \".*\"/version \"${VERSION}\"/" tarts.rb
    rm -f tarts.rb.bak

    echo "✅ Updated tarts.rb to version ${VERSION}"
    echo "Test with: brew install --build-from-source ./tarts.rb"

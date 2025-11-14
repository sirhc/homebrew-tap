_default:

sha256 formula:
  awk '( $1 == "url" ) { print $2 }' {{ formula }} | head -1 | xargs curl -fsSL | sha256sum | awk '{ print $1 }'

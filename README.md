# homebrew-tap

[Homebrew](https://brew.sh) tap for [k8slings](https://github.com/cleonte/k8slings), "rustlings for Kubernetes".

```sh
brew install cleonte/tap/k8slings
```

The cask in `Casks/` is written by GoReleaser when k8slings is released; do not edit it by hand.

The binaries are not signed or notarized, so the cask removes the macOS quarantine flag after installing (`xattr -dr com.apple.quarantine`), which is what stops Gatekeeper from refusing the first run.

# Vcpkg Registry

This is a custom vcpkg registry for managing C++ packages and libraries.

## Structure

- `ports/` - Contains port files for each package
- `versions/` - Contains version database and baseline

## Adding a New Package

1. Create a new directory in `ports/` with your package name
2. Add `portfile.cmake` with build instructions
3. Add `vcpkg.json` with package metadata
4. Create version entry in `versions/[first-letter]-/package-name.json`
5. Update `versions/baseline.json`
6. Commit and get git tree hash
7. Update version file with actual git tree hash

## Using This Registry

Add to your project's `vcpkg-configuration.json`:

```json
{
  "default-registry": {
    "kind": "git",
    "repository": "https://github.com/Microsoft/vcpkg",
    "baseline": "2024.12.16"
  },
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/Zhuyin-Graphics/vcpkg-registry",
      "baseline": "commit-hash",
      "packages": ["sample-library"]
    }
  ]
}
```

## Commands

- `vcpkg install my-sample-library` - Install your custom package
- `vcpkg list` - List installed packages
- `vcpkg search my-sample-library` - Search for your package

## Git Tree Hash Generation

After committing your changes, get the git tree hash:

```bash
git rev-parse HEAD:ports/package-name
```

Update the version file with this hash.

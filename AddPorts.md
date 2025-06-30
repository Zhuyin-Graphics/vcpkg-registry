## Add ports
1. Inside the `ports` directory, create a directory for each port you want to add.
2. for each port directory, create the following files:
    - vcpkg.json
    - portfile.cmake
    - patch files (if needed)
3. use vcpkg to format the manifest files
   ```bash
   > vcpkg format-manifest my-registry/ports/crc32c/vcpkg.json
   ## Succeeded in formatting the manifest files.
   ```
4. add version
    ```bash
    > cd my-registry
    > vcpkg x-add-version --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions crc32c
    ## added version 1.1.2 to /home/yiwenxue/program/vcpkg-registry/versions/c-/crc32c.json (new file)
    ## added version 1.1.2 to /home/yiwenxue/program/vcpkg-registry/versions/baseline.json
    ```
5. add the generated version the changed baseline to git
    ```bash
    > git add versions/c-/crc32c.json versions/baseline.json
    > git commit -m "Add crc32c v1.1.2"
    ```
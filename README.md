# x86_64-elf-toolchain Action

[![GitHub Super-Linter](https://github.com/maxdevos49/x86_64-elf-toolchain/actions/workflows/linter.yml/badge.svg)](https://github.com/super-linter/super-linter)
![CI](https://github.com/maxdevos49/x86_64-elf-toolchain/actions/workflows/ci.yml/badge.svg)
![CD](https://github.com/maxdevos49/x86_64-elf-toolchain/actions/workflows/cd.yml/badge.svg)


## Usage

Action assumes `make all` is the command to build the project.

To include the action in a workflow in another repository, you can use the
`uses` syntax with the `@` symbol to reference a specific branch, tag, or commit
hash.

```yaml
steps:
  - name: Checkout
    id: checkout
    uses: actions/checkout@v3
  - name: Build
    id: build
    uses: maxdevos49/x86_64-elf-toolchain@latest
```



## Release instructions

1. Create a new branch

   ```bash
   git checkout -b releases/v1
   ```

1. Build and test the container

   ```bash
   docker build -t maxdevos49/x86_64-elf-toolchain .
   docker run maxdevos49/x86_64-elf-toolchain
   ```

2. Commit your changes

3. Push them to your repository

   ```bash
   git push -u origin releases/v1
   ```

4. Create a pull request
5. Merge the pull request into the `main` branch

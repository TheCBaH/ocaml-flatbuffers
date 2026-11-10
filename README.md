# OCaml FlatBuffers

[![OCaml Build](https://github.com/TheCBaH/ocaml-flatbuffers/actions/workflows/ocaml-build.yml/badge.svg)](https://github.com/TheCBaH/ocaml-flatbuffers/actions/workflows/ocaml-build.yml)
[Open in GitHub Codespaces](https://github.com/codespaces/new?hide_repo_select=true&ref=master&repo=167849851)

OCaml support for [FlatBuffers](https://flatbuffers.dev/), including:

- an OCaml runtime for reading and building FlatBuffers;
- an OCaml backend for the `flatc` schema compiler;
- JavaScript targets through `js_of_ocaml` and Melange.

The upstream FlatBuffers source is included as the `flatbuffers/` submodule. The
OCaml generator in `src/` and the integration patch in `patches/` are applied
when `flatc` is built.

Based on the OCaml implementation by [dmitrig](https://github.com/dmitrig/flatbuffers/tree/dg/ocaml),
extended and maintained by Vladimir N. Silyaev. This project maintains OCaml
support separately from Google FlatBuffers; the upstream source is a dependency.
See [PROVENANCE.md](PROVENANCE.md) for the import history and contributions.

The repository is named `ocaml-flatbuffers`; the opam packages are `flatbuffers`
and `flatbuffers-tools`.

## Requirements

- OCaml 4.13 or newer
- opam and Dune
- CMake and a C++ compiler
- Git submodules initialized

Initialize the upstream dependency and install development dependencies:

```bash
git submodule update --init --recursive
make deps
```

## Build and test

Build the patched compiler and run the test suite:

```bash
make test
```

Other useful commands:

```bash
make flatc       # Build flatc with OCaml support
make bench       # Run benchmarks
make generate    # Regenerate promoted test bindings
make clean       # Remove build artifacts
```

To run the OCaml tests using the checked-in generated files:

```bash
opam exec -- dune test --ignore-promoted-rules
```

## Generate OCaml bindings

After building the compiler, pass an `.fbs` schema to `flatc.ocaml`:

```bash
./flatc.ocaml --ocaml path/to/schema.fbs
```

This generates OCaml implementation (`.ml`) and interface (`.mli`) files for
the schema. The generated bindings use the runtime library provided by this
repository.

## Repository layout

| Path | Purpose |
| --- | --- |
| `ocaml/lib/` | OCaml runtime library |
| `src/` | OCaml `flatc` generator backend |
| `ocaml/test/` | Runtime and generator tests |
| `flatbuffers/` | Upstream FlatBuffers submodule |
| `patches/` | Upstream integration patch |

## License

The OCaml implementation and subsequent additions are licensed under the
[Apache License, Version 2.0](LICENSE). See [NOTICE](NOTICE) for attribution to
dmitrig, Vladimir N. Silyaev, and the Google FlatBuffers contributors.

The upstream dependency retains its own license and source notices in
`flatbuffers/`. Existing Google copyright notices in the OCaml generator are
preserved. License and attribution files are included with both opam packages.

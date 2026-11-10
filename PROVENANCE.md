# Source and contributions

OCaml FlatBuffers maintains OCaml support for
[Google FlatBuffers](https://github.com/google/flatbuffers). Google FlatBuffers
is a dependency at `flatbuffers/`, recorded by the gitlink and `.gitmodules`.
The build copies the OCaml generator into that dependency and applies
`patches/ocaml-integration.patch`; the upstream repository is not maintained
inside this project's main history.

## Initial OCaml implementation

The runtime, BFBS generator, and initial tests originate in
[dmitrig/flatbuffers, branch dg/ocaml](https://github.com/dmitrig/flatbuffers/tree/dg/ocaml).
The imported work consists of 17 commits authored by `dmitrig` between
December 2022 and April 2023:

| Change | Original commit | Imported commit |
| --- | --- | --- |
| First draft of ocaml support | [d3e74322](https://github.com/dmitrig/flatbuffers/commit/d3e74322) | eeadba84 |
| Use less cppo (last imported change) | [e33675fc](https://github.com/dmitrig/flatbuffers/commit/e33675fc0a32732fffa8bd16c13f39d046d83315) | 244cb7f8 |

The imported commits preserve the original author names, emails, and author
dates. Their hashes differ because they were replayed onto this project's
independent history in March 2026. That history starts at `c411f965`, followed
by the submodule/build integration at `1ab82cfd` and the imported OCaml series.

The original draft describes the generator as based on the Lua/Nim BFBS
generators. The Google copyright and Apache-2.0 headers in
`src/bfbs_gen_ocaml.cpp` and `src/bfbs_gen_ocaml.h` are retained. The source
repository also includes the Apache-2.0 license, and its OCaml package metadata
declares Apache-2.0.

## Subsequent work

Vladimir N. Silyaev extended and maintained this implementation in 2026,
including:

- Submodule/patch integration, build tooling, opam packaging, and CI.
- Updates for upstream generator APIs and additional schema features, including
  nested FlatBuffers, key lookup, fixed arrays, 64-bit offsets, the Object API,
  union vectors, and structs in unions.
- JavaScript buffer support through js_of_ocaml and Melange.
- Runtime and builder improvements, structural verification, and a FlexBuffers
  reader and verifier.
- Additional tests, benchmarks, generated fixtures, and documentation.

The commit history records individual contributions. Maintainer identity is
separate from original authorship; package metadata credits both `dmitrig` and
Vladimir N. Silyaev.

## Licensing and source notices

The inherited OCaml implementation and subsequent additions are distributed
under Apache-2.0; the complete text is in [LICENSE](LICENSE). Attribution is
recorded in [NOTICE](NOTICE). Existing source notices remain in place. Source
headers identify the original OCaml work and subsequent modifications without
replacing the inherited Google notices or assigning another contributor's
copyright to the maintainer.

Generated test bindings draw on schemas in `flatbuffers/samples/`,
`flatbuffers/benchmarks/`, and `flatbuffers/tests/`, as well as local test
schemas. The corresponding Dune rules record those inputs. Upstream test data
is also used. Generated fixtures retain their generator output; the project
license is not a blanket ownership claim over schemas supplied by users.

The submodule and any third-party material within it retain their applicable
licenses and notices. Both opam packages install this provenance record and
the project license and notice.

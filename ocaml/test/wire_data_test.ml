(* Original OCaml implementation by dmitrig, 2022-2023.
   Modified by Vladimir N. Silyaev, 2026.
   SPDX-License-Identifier: Apache-2.0 *)

open Fixtures.Monster_test
open MyGame.Example

let () =
  let b = Rt.Builder.create () in
  Fixtures.create_example_monster b
  |> Monster.finish_buf Flatbuffers.Primitives.Bytes b
  |> output_bytes stdout
;;

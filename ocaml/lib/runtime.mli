(* Original OCaml implementation by dmitrig, 2022-2023.
   SPDX-License-Identifier: Apache-2.0 *)

module type Intf = Runtime_intf.Intf

include Runtime_intf.Intf_impl

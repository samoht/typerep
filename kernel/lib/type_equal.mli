(** runtime witnes of type equality
    this is a reduced version of [Core.Std.Type_equal]. *)
type ('a, 'b) t = T : ('a, 'a) t
type ('a, 'b) equal = ('a, 'b) t

(** type-safe conversion between equal types *)
val conv : ('a, 'b) t -> 'a -> 'b

(** type equality is reflexive *)
val refl : ('a, 'a) t

(** type equality is symmetric *)
val symm : ('a, 'b) t -> ('b, 'a) t

(** type equality is transitive *)
val trans : ('a, 'b) t -> ('b, 'c) t -> ('a, 'c) t

(** needed in some cases even though t is exported and is a gadt *)
module Lift (X: sig
  type 'a t
end) : sig
  val lift : ('a, 'b) t -> ('a X.t, 'b X.t) t
end
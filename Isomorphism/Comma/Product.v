Set Warnings "-notation-overridden".

Require Import Category.Lib.
Require Export Category.Theory.Adjunction.
Require Export Category.Construction.Comma.
Require Export Category.Construction.Product.
Require Export Category.Structure.Terminal.
Require Export Category.Instance.Cat.
Require Export Category.Instance.One.

Generalizable All Variables.
Set Primitive Projections.
Set Universe Polymorphism.

Section ProductComma.

Ltac simpl_cat :=
  repeat (
    simpl; intros;
    simplify;
    simpl; intros;
    match goal with
    | [ |- _ ≅ _ ] => unshelve econstructor
    | [ |- _ ⟹ _ ] => unshelve econstructor
    | [ |- _ ⟶ _ ] => unshelve econstructor
    | [ |- @Proper _ _ _ ] => first [ abstract proper | proper ]
    | [ |- @Equivalence _ _ ] => first [ abstract equivalence | equivalence ]
    | [ |- _ ≈ _ ] => abstract cat
    | _ => cat
    end).

Theorem Comma_Product' `{C : Category} `{D : Category}
        (F : C ⟶ 1) (G : D ⟶ 1) :
  (F ↓ G) ≅[Cat] C ∏ D.
Proof. Time simpl_cat. Time Qed.

Theorem Comma_Product `{C : Category} `{D : Category}
        (F : C ⟶ 1) (G : D ⟶ 1) :
  (F ↓ G) ≅[Cat] C ∏ D.
Proof.
  isomorphism; simpl.
  - functor; abstract cat.
  - functor.
    + simpl; intros; cat.
    + simpl; intros; cat.
    + abstract proper.
    + abstract cat.
    + abstract cat.
  - isomorphism.
    + transform.
      * simpl; intros; cat.
      * abstract cat.
    + transform.
      * simpl; intros; cat.
      * abstract cat.
    + simpl; abstract cat.
    + simpl; abstract cat.
  - isomorphism.
    + transform.
      * simpl; intros; cat.
      * abstract cat.
    + transform.
      * simpl; intros; cat.
      * abstract cat.
    + simpl; abstract cat.
    + simpl; abstract cat.
Time Qed.

Time End ProductComma.
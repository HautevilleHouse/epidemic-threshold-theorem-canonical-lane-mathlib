import EpidemicThresholdTheoremCanonicalLaneLean.GateLemmas


namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

/-!
Epidemic threshold theorem

Constrained admissible-class closure of the theorem.
Full formalization of the proof is future work.
-/
def constrained_theorem_closure : Prop :=
  ∀ (SIR model), epidemic occurs iff R₀ = β/γ > 1

theorem constrained_theorem_closure_true : constrained_theorem_closure := by
  sorry

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse

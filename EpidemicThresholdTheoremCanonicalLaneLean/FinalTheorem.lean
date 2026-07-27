import EpidemicThresholdTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

def ConstrainedTheoremClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_theorem_closure (A : AdmissibleClass) :
    ConstrainedTheoremClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse

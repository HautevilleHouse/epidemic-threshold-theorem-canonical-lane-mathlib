import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

def ConstrainedEpidemicThresholdClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_epidemic_threshold_endgame (A : AdmissibleClass) : ConstrainedEpidemicThresholdClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
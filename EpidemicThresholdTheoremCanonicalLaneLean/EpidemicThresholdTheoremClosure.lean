import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

def EpidemicThresholdClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem epidemic_threshold_endgame (A : AdmissibleClass) :
    EpidemicThresholdClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
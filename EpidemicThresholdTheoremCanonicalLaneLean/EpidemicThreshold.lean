import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean.BasicReproductionNumber

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure EpidemicThresholdPackage {M : SIRCompartmentModel} (P : BasicReproductionNumberPackage M) where
  threshold : ℝ
  thresholdAboveOne : threshold > 1
  r0AboveThresholdCondition : P.r0 > threshold → EpidemicOutbreak

structure EpidemicThresholdEvidence {M : SIRCompartmentModel} {P : BasicReproductionNumberPackage M} (E : EpidemicThresholdPackage P) where
  thresholdAboveOneClosed : E.thresholdAboveOne
  r0AboveThresholdConditionClosed : E.r0AboveThresholdCondition

def EpidemicThresholdClosed {M : SIRCompartmentModel} {P : BasicReproductionNumberPackage M} (E : EpidemicThresholdPackage P) : Prop :=
  E.thresholdAboveOne ∧ E.r0AboveThresholdCondition

theorem epidemic_threshold_closed_from_evidence {M : SIRCompartmentModel} {P : BasicReproductionNumberPackage M} (Epkg : EpidemicThresholdPackage P) (E : EpidemicThresholdEvidence Epkg) : EpidemicThresholdClosed Epkg := by
  exact And.intro E.thresholdAboveOneClosed E.r0AboveThresholdConditionClosed

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
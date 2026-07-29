import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean.SIRCompartmentModel

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure BasicReproductionNumberPackage (M : SIRCompartmentModel) where
  r0 : ℝ
  transmissionRateDivRecoveryRate : r0 = M.transmissionRate / M.recoveryRate
  thresholdCondition : r0 > 1 → EpidemicOutbreak

structure BasicReproductionNumberEvidence {M : SIRCompartmentModel} (P : BasicReproductionNumberPackage M) where
  r0Positive : P.r0 > 0
  thresholdConditionClosed : P.thresholdCondition

structure EpidemicOutbreak where
  epidemic : Prop

def BasicReproductionNumberClosed {M : SIRCompartmentModel} (P : BasicReproductionNumberPackage M) : Prop :=
  P.r0 > 0 ∧ P.thresholdCondition

theorem basic_reproduction_number_closed_from_evidence {M : SIRCompartmentModel} (P : BasicReproductionNumberPackage M) (E : BasicReproductionNumberEvidence P) : BasicReproductionNumberClosed P := by
  exact And.intro E.r0Positive E.thresholdConditionClosed

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean.BranchingProcess
import HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean.SIRModel

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure ThresholdCondition (M : SIRModel) where
  transmissionRateOverRecovery : ℝ
  thresholdValue : ℝ
  epidemicOccurs : Prop
  basicReproNumber : ℝ
  reproNumFormula : basicReproNumber = M.transmissionRate / M.recoveryRate
  thresholdCrossed : basicReproNumber > 1 → epidemicOccurs

structure ThresholdConditionEvidence (M : SIRModel) (T : ThresholdCondition M) where
  reproNumFormulaClosed : T.reproNumFormula
  thresholdCrossedClosed : T.basicReproNumber > 1 → T.epidemicOccurs

def ThresholdConditionClosed (M : SIRModel) (T : ThresholdCondition M) : Prop :=
  T.reproNumFormula ∧ (T.basicReproNumber > 1 → T.epidemicOccurs)

theorem threshold_condition_closed_from_evidence (M : SIRModel) (T : ThresholdCondition M)
    (E : ThresholdConditionEvidence M T) : ThresholdConditionClosed M T := by
  exact And.intro E.reproNumFormulaClosed E.thresholdCrossedClosed

end HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
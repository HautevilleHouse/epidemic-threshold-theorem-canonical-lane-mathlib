import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean.SIRModel
import HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean.ThresholdCondition

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure FinalEpidemicSize (M : SIRModel) (T : ThresholdCondition M) where
  totalInfectedFraction : ℝ
  finalSusceptibleFraction : ℝ
  finalSizeEquation : totalInfectedFraction = 1 - finalSusceptibleFraction
  transcriticalCondition : T.basicReproNumber > 1
  finalSusceptibleRoot : finalSusceptibleFraction * exp (T.basicReproNumber * finalSusceptibleFraction) = 1

structure FinalEpidemicSizeEvidence (M : SIRModel) (T : ThresholdCondition M)
    (F : FinalEpidemicSize M T) where
  finalSizeEquationClosed : F.finalSizeEquation
  transcriticalConditionClosed : F.transcriticalCondition
  finalSusceptibleRootClosed : F.finalSusceptibleRoot

def FinalEpidemicSizeClosed (M : SIRModel) (T : ThresholdCondition M)
    (F : FinalEpidemicSize M T) : Prop :=
  F.finalSizeEquation ∧ F.transcriticalCondition ∧ F.finalSusceptibleRoot

theorem final_epidemic_size_closed_from_evidence (M : SIRModel) (T : ThresholdCondition M)
    (F : FinalEpidemicSize M T) (E : FinalEpidemicSizeEvidence M T F) :
    FinalEpidemicSizeClosed M T F := by
  exact And.intro E.finalSizeEquationClosed
    (And.intro E.transcriticalConditionClosed E.finalSusceptibleRootClosed)

end HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
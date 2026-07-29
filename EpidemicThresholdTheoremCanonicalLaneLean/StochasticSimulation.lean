import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean.SIRModel

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure StochasticSimulation (M : SIRModel) where
  time : ℕ
  susceptiblePath : ℕ → ℕ
  infectedPath : ℕ → ℕ
  recoveredPath : ℕ → ℕ
  initialConditions : susceptiblePath 0 = M.susceptible ∧ infectedPath 0 = M.infected ∧ recoveredPath 0 = M.recovered
  transitionRates : ℕ → ℝ × ℝ
  lawOfLargeNumbersConvergence : Prop
  stochasticThreshold : Prop

structure StochasticSimulationEvidence (M : SIRModel) (S : StochasticSimulation M) where
  initialConditionsClosed : S.initialConditions
  lawOfLargeNumbersConvergenceClosed : S.lawOfLargeNumbersConvergence
  stochasticThresholdClosed : S.stochasticThreshold

def StochasticSimulationClosed (M : SIRModel) (S : StochasticSimulation M) : Prop :=
  S.initialConditions ∧ S.lawOfLargeNumbersConvergence ∧ S.stochasticThreshold

theorem stochastic_simulation_closed_from_evidence (M : SIRModel) (S : StochasticSimulation M)
    (E : StochasticSimulationEvidence M S) : StochasticSimulationClosed M S := by
  exact And.intro E.initialConditionsClosed
    (And.intro E.lawOfLargeNumbersConvergenceClosed E.stochasticThresholdClosed)

end HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
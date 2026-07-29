import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure StochasticProcess where
  stateSpace : Type u
  timeIndex : Type v
  transitionProbabilities : stateSpace → stateSpace → ℝ
  stationaryDistribution : stateSpace → ℝ
  stationaryCondition : ∀ s : stateSpace, stationaryDistribution s = (∑ s' : stateSpace, stationaryDistribution s' * transitionProbabilities s' s)
  sumStationary : (∑ s : stateSpace, stationaryDistribution s) = 1

structure StochasticProcessEvidence (S : StochasticProcess) where
  stationaryConditionClosed : ∀ s : S.stateSpace, S.stationaryDistribution s = (∑ s' : S.stateSpace, S.stationaryDistribution s' * S.transitionProbabilities s' s)
  sumStationaryClosed : (∑ s : S.stateSpace, S.stationaryDistribution s) = 1

def StochasticProcessClosed (S : StochasticProcess) : Prop :=
  (∀ s : S.stateSpace, S.stationaryDistribution s = (∑ s' : S.stateSpace, S.stationaryDistribution s' * S.transitionProbabilities s' s)) ∧
  (∑ s : S.stateSpace, S.stationaryDistribution s) = 1

theorem stochastic_process_closed_from_evidence (S : StochasticProcess) (E : StochasticProcessEvidence S) : StochasticProcessClosed S := by
  exact And.intro E.stationaryConditionClosed E.sumStationaryClosed

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
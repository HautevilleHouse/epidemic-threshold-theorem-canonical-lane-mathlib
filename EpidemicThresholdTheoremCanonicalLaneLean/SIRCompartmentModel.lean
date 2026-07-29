import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure SIRCompartmentModel where
  susceptible : ℕ
  infected : ℕ
  recovered : ℕ
  totalPopulation : ℕ
  transmissionRate : ℝ
  recoveryRate : ℝ

structure SIRCompartmentModelEvidence (M : SIRCompartmentModel) where
  susceptibleNonnegative : M.susceptible ≥ 0
  infectedNonnegative : M.infected ≥ 0
  recoveredNonnegative : M.recovered ≥ 0
  totalPopulationPositive : M.totalPopulation > 0
  transmissionRatePositive : M.transmissionRate > 0
  recoveryRatePositive : M.recoveryRate > 0

def SIRCompartmentModelClosed (M : SIRCompartmentModel) : Prop :=
  M.susceptible ≥ 0 ∧ M.infected ≥ 0 ∧ M.recovered ≥ 0 ∧ M.totalPopulation > 0 ∧ M.transmissionRate > 0 ∧ M.recoveryRate > 0

theorem sir_compartment_model_closed_from_evidence (M : SIRCompartmentModel) (E : SIRCompartmentModelEvidence M) : SIRCompartmentModelClosed M := by
  exact And.intro E.susceptibleNonnegative (And.intro E.infectedNonnegative (And.intro E.recoveredNonnegative (And.intro E.totalPopulationPositive (And.intro E.transmissionRatePositive E.recoveryRatePositive))))

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure SIRCompartmentModel where
  susceptible : Type u
  infected : Type v
  recovered : Type w
  transmissionRate : ℝ
  recoveryRate : ℝ
  initialSusceptibleFraction : ℝ
  initialInfectedFraction : ℝ
  initialRecoveredFraction : ℝ
  populationNormalized : Prop
  transmissionRatePositive : transmissionRate > 0
  recoveryRatePositive : recoveryRate > 0

structure SIRCompartmentModelEvidence (M : SIRCompartmentModel) where
  populationNormalizedClosed : M.populationNormalized
  transmissionRatePositiveClosed : M.transmissionRatePositive
  recoveryRatePositiveClosed : M.recoveryRatePositive

def SIRCompartmentModelClosed (M : SIRCompartmentModel) : Prop :=
  M.populationNormalized ∧ M.transmissionRatePositive ∧ M.recoveryRatePositive

theorem sir_compartment_model_closed_from_evidence (M : SIRCompartmentModel)
    (E : SIRCompartmentModelEvidence M) : SIRCompartmentModelClosed M := by
  exact And.intro E.populationNormalizedClosed
    (And.intro E.transmissionRatePositiveClosed E.recoveryRatePositiveClosed)

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse

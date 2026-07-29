import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure CompartmentModel where
  susceptible : Type u
  infected : Type v
  recovered : Type w
  transmissionRate : ℝ
  recoveryRate : ℝ
  birthRate : ℝ
  deathRate : ℝ
  basicReproductiveNumber : ℝ
  transmissionRateNonneg : transmissionRate ≥ 0
  recoveryRateNonneg : recoveryRate ≥ 0
  basicReproductiveNumberDefined : basicReproductiveNumber = transmissionRate / recoveryRate

structure CompartmentModelEvidence (M : CompartmentModel) where
  transmissionRateNonnegClosed : M.transmissionRate ≥ 0
  recoveryRateNonnegClosed : M.recoveryRate ≥ 0
  basicReproductiveNumberDefinedClosed : M.basicReproductiveNumber = M.transmissionRate / M.recoveryRate

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.transmissionRate ≥ 0 ∧ M.recoveryRate ≥ 0 ∧ M.basicReproductiveNumber = M.transmissionRate / M.recoveryRate

theorem compartment_model_closed_from_evidence (M : CompartmentModel) (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.transmissionRateNonnegClosed (And.intro E.recoveryRateNonnegClosed E.basicReproductiveNumberDefinedClosed)

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean.SIRCompartmentModel

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure FinalSizeRelationPackage (M : SIRCompartmentModel) where
  finalSusceptible : ℕ
  finalInfected : ℕ
  finalRecovered : ℕ
  totalInfectedFinal : ℕ
  finalSizeEquation : finalRecovered = M.totalPopulation - finalSusceptible
  finalSizeLimit : finalRecovered ≤ M.totalPopulation

structure FinalSizeRelationEvidence {M : SIRCompartmentModel} (F : FinalSizeRelationPackage M) where
  finalSizeEquationClosed : F.finalSizeEquation
  finalSizeLimitClosed : F.finalSizeLimit

def FinalSizeRelationClosed {M : SIRCompartmentModel} (F : FinalSizeRelationPackage M) : Prop :=
  F.finalSizeEquation ∧ F.finalSizeLimit

theorem final_size_relation_closed_from_evidence {M : SIRCompartmentModel} (F : FinalSizeRelationPackage M) (E : FinalSizeRelationEvidence F) : FinalSizeRelationClosed F := by
  exact And.intro E.finalSizeEquationClosed E.finalSizeLimitClosed

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
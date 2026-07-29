import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean.SIRCompartmentModel

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure NetworkEpidemicModel (M : SIRCompartmentModel) where
  networkTopology : Type u
  adjacencyMatrix : networkTopology → networkTopology → ℝ
  infectionPerEdge : ℝ
  nodeStates : networkTopology → SIRCompartmentModel
site

structure NetworkEpidemicModelEvidence {M : SIRCompartmentModel} (N : NetworkEpidemicModel M) where
  infectionPerEdgePositive : N.infectionPerEdge > 0
  adjacencyMatrixNonnegative : ∀ i j : N.networkTopology, N.adjacencyMatrix i j ≥ 0

def NetworkEpidemicModelClosed {M : SIRCompartmentModel} (N : NetworkEpidemicModel M) : Prop :=
  N.infectionPerEdge > 0 ∧ (∀ i j : N.networkTopology, N.adjacencyMatrix i j ≥ 0)

theorem network_epidemic_model_closed_from_evidence {M : SIRCompartmentModel} (N : NetworkEpidemicModel M) (E : NetworkEpidemicModelEvidence M N) : NetworkEpidemicModelClosed N := by
  exact And.intro E.infectionPerEdgePositive E.adjacencyMatrixNonnegative

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
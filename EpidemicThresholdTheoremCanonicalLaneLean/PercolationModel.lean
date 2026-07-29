import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure PercolationModel where
  graph : Type u
  edgeSet : Set (graph × graph)
  percolationProbability : ℝ
  infiniteClusterExists : Prop
  criticalProbability : ℝ
  belowCriticalNoInfiniteCluster : percolationProbability < criticalProbability → ¬ infiniteClusterExists
  aboveCriticalInfiniteCluster : percolationProbability > criticalProbability → infiniteClusterExists

structure PercolationModelEvidence (P : PercolationModel) where
  belowCriticalNoInfiniteClusterClosed : ∀ (p : ℝ), p < P.criticalProbability → (let P' : PercolationModel := { P with percolationProbability := p }; ¬ P'.infiniteClusterExists)
  aboveCriticalInfiniteClusterClosed : ∀ (p : ℝ), p > P.criticalProbability → (let P' : PercolationModel := { P with percolationProbability := p }; P'.infiniteClusterExists)

def PercolationModelClosed (P : PercolationModel) : Prop :=
  (∀ (p : ℝ), p < P.criticalProbability → (let P' : PercolationModel := { P with percolationProbability := p }; ¬ P'.infiniteClusterExists)) ∧
  (∀ (p : ℝ), p > P.criticalProbability → (let P' : PercolationModel := { P with percolationProbability := p }; P'.infiniteClusterExists))

theorem percolation_model_closed_from_evidence (P : PercolationModel) (E : PercolationModelEvidence P) : PercolationModelClosed P := by
  exact And.intro E.belowCriticalNoInfiniteClusterClosed E.aboveCriticalInfiniteClusterClosed

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
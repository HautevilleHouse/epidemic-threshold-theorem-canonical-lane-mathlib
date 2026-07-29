import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure BranchingProcess where
  offspringDistribution : ℕ → ℝ
  meanOffspring : ℝ
  extinctionProbability : ℝ
  distributionNormalized : ∑' (k : ℕ), offspringDistribution k = 1
  meanOffspringComputed : meanOffspring = ∑' (k : ℕ), k * offspringDistribution k
  extinctionProbEquation : extinctionProbability = ∑' (k : ℕ), offspringDistribution k * extinctionProbability ^ (k : ℕ)

structure BranchingProcessEvidence (B : BranchingProcess) where
  distributionNormalizedClosed : B.distributionNormalized
  meanOffspringComputedClosed : B.meanOffspringComputed
  extinctionProbEquationClosed : B.extinctionProbEquation

def BranchingProcessClosed (B : BranchingProcess) : Prop :=
  B.distributionNormalized ∧ B.meanOffspringComputed ∧ B.extinctionProbEquation

theorem branching_process_closed_from_evidence (B : BranchingProcess)
    (E : BranchingProcessEvidence B) : BranchingProcessClosed B := by
  exact And.intro E.distributionNormalizedClosed
    (And.intro E.meanOffspringComputedClosed E.extinctionProbEquationClosed)

end HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
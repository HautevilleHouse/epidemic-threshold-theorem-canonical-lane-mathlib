import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure BranchingProcess where
  offspringDistribution : ℕ → ℝ
  extinctionProbability : ℝ
  meanOffspring : ℝ
  extinctionEqSolves : extinctionProbability = (∑ n, offspringDistribution n * extinctionProbability ^ n)
  meanOffspringDefined : meanOffspring = (∑ n, n * offspringDistribution n)
  offspringSumOne : (∑ n, offspringDistribution n) = 1

structure BranchingProcessEvidence (B : BranchingProcess) where
  extinctionEqSolvesClosed : B.extinctionProbability = (∑ n, B.offspringDistribution n * B.extinctionProbability ^ n)
  meanOffspringDefinedClosed : B.meanOffspring = (∑ n, (n : ℝ) * B.offspringDistribution n)
  offspringSumOneClosed : (∑ n, B.offspringDistribution n) = 1

def BranchingProcessClosed (B : BranchingProcess) : Prop :=
  B.extinctionProbability = (∑ n, B.offspringDistribution n * B.extinctionProbability ^ n) ∧
  B.meanOffspring = (∑ n, (n : ℝ) * B.offspringDistribution n) ∧
  (∑ n, B.offspringDistribution n) = 1

theorem branching_process_closed_from_evidence (B : BranchingProcess) (E : BranchingProcessEvidence B) : BranchingProcessClosed B := by
  exact And.intro E.extinctionEqSolvesClosed (And.intro E.meanOffspringDefinedClosed E.offspringSumOneClosed)

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
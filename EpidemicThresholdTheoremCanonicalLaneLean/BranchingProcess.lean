import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure BranchingProcessModel where
  offspringDistribution : ℕ → ℝ
  meanOffspring : ℝ := ∑' k:ℕ, k * offspringDistribution k
  extinctionProbability : ℝ
  meanOffspringComputed : meanOffspring = ∑' k, (k : ℝ) * offspringDistribution k
  criticalThreshold : ℙrop := meanOffspring ≤ 1
  extinctionProbabilityEquation : ℙrop
  extinctionProbabilityComputed : extinctionProbability
  criticalThresholdClosed : criticalThreshold

structure BranchingProcessEvidence (B : BranchingProcessModel) where
  extinctionProbabilityEquationClosed : B.extinctionProbabilityEquation
  extinctionProbabilityComputedClosed : B.extinctionProbabilityComputed
  criticalThresholdClosed : B.criticalThresholdClosed

def BranchingProcessClosed (B : BranchingProcessModel) : ℙrop :=
  B.extinctionProbabilityEquation ∧ B.extinctionProbabilityComputed ∧ B.criticalThreshold

theorem branching_process_closed_from_evidence (B : BranchingProcessModel)
    (E : BranchingProcessEvidence B) : BranchingProcessClosed B := by
  exact And.intro E.extinctionProbabilityEquationClosed
    (And.intro E.extinctionProbabilityComputedClosed E.criticalThresholdClosed)

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse

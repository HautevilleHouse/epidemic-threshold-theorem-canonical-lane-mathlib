import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Dynamics.Flow

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure SIRModel where
  population : ℕ
  susceptible : ℕ
  infected : ℕ
  recovered : ℕ
  transmissionRate : ℝ
  recoveryRate : ℝ
  susceptibleNonnegative : 0 ≤ susceptible
  infectedNonnegative : 0 ≤ infected
  recoveredNonnegative : 0 ≤ recovered
  totalConstant : susceptible + infected + recovered = population

structure SIRModelEvidence (M : SIRModel) where
  susceptibleNonnegativeClosed : M.susceptibleNonnegative
  infectedNonnegativeClosed : M.infectedNonnegative
  recoveredNonnegativeClosed : M.recoveredNonnegative
  totalConstantClosed : M.totalConstant

def SIRModelClosed (M : SIRModel) : Prop :=
  M.susceptibleNonnegative ∧ M.infectedNonnegative ∧ M.recoveredNonnegative ∧ M.totalConstant

theorem sir_model_closed_from_evidence (M : SIRModel) (E : SIRModelEvidence M) :
    SIRModelClosed M := by
  exact And.intro E.susceptibleNonnegativeClosed
    (And.intro E.infectedNonnegativeClosed
      (And.intro E.recoveredNonnegativeClosed E.totalConstantClosed))

end HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
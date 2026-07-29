import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure EpidemicThreshold where
  threshold : ℝ
  belowThreshold : Prop
  aboveThreshold : Prop
  thresholdPos : threshold > 0

structure EpidemicThresholdEvidence (E : EpidemicThreshold) where
  belowThresholdClosed : E.belowThreshold
  aboveThresholdClosed : E.aboveThreshold
  thresholdPosClosed : E.thresholdPos

def EpidemicThresholdClosed (E : EpidemicThreshold) : Prop :=
  E.belowThreshold ∧ E.aboveThreshold ∧ E.thresholdPos

theorem epidemic_threshold_closed_from_evidence (E : EpidemicThreshold) (Ev : EpidemicThresholdEvidence E) : EpidemicThresholdClosed E := by
  exact And.intro Ev.belowThresholdClosed (And.intro Ev.aboveThresholdClosed Ev.thresholdPosClosed)

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
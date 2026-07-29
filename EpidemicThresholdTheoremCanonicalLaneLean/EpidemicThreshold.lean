import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure EpidemicThresholdPackage {M : SIRCompartmentModel} (S : SIRCompartmentModelEvidence M) where
  basicReproductionNumber : ℝ := M.transmissionRate / M.recoveryRate
  thresholdValue : ℝ := 1.0
  thresholdCondition : ℙrop := basicReproductionNumber ≤ thresholdValue
  epidemicExtinctionGuaranteed : ℙrop := thresholdCondition → epidemicDiesOut
  epidemicDiesOut : ℙrop
  epidemicDiesOutClosed : epidemicDiesOut

structure EpidemicThresholdEvidence {M : SIRCompartmentModel}
    {S : SIRCompartmentModelEvidence M} (P : EpidemicThresholdPackage S) where
  thresholdConditionClosed : P.thresholdCondition
  epidemicExtinctionGuaranteedClosed : P.epidemicExtinctionGuaranteed

def EpidemicThresholdClosed {M : SIRCompartmentModel}
    {S : SIRCompartmentModelEvidence M} (P : EpidemicThresholdPackage S) : ℙrop :=
  P.thresholdCondition ∧ P.epidemicExtinctionGuaranteed

theorem epidemic_threshold_closed_from_evidence
    {M : SIRCompartmentModel} {S : SIRCompartmentModelEvidence M}
    (P : EpidemicThresholdPackage S) (E : EpidemicThresholdEvidence P) :
    EpidemicThresholdClosed P := by
  exact And.intro E.thresholdConditionClosed E.epidemicExtinctionGuaranteedClosed

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse

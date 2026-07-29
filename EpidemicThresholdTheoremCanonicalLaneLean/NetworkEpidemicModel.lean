import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure NetworkEpidemicModel {M : SIRCompartmentModel} (S : SIRCompartmentModelEvidence M) where
  graph : Type u
  adjacency : graph → graph → ℙrop
  infectionRatePerEdge : ℝ
  recoveryRate : ℝ
  infectionRatePositive : infectionRatePerEdge > 0
  recoveryRatePositive : recoveryRate > 0
  graphConnected : ℙrop
  epidemicThresholdGraph : ℙrop
  epidemicThresholdGraphClosed : epidemicThresholdGraph

structure NetworkEpidemicEvidence {M : SIRCompartmentModel}
    {S : SIRCompartmentModelEvidence M} (N : NetworkEpidemicModel S) where
  graphConnectedClosed : N.graphConnected
  epidemicThresholdGraphClosed : N.epidemicThresholdGraphClosed

def NetworkEpidemicClosed {M : SIRCompartmentModel}
    {S : SIRCompartmentModelEvidence M} (N : NetworkEpidemicModel S) : ℙrop :=
  N.graphConnected ∧ N.epidemicThresholdGraph

theorem network_epidemic_closed_from_evidence
    {M : SIRCompartmentModel} {S : SIRCompartmentModelEvidence M}
    (N : NetworkEpidemicModel S) (E : NetworkEpidemicEvidence N) :
    NetworkEpidemicClosed N := by
  exact And.intro E.graphConnectedClosed E.epidemicThresholdGraphClosed

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse

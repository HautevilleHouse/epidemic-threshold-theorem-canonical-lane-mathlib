import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure EpidemicAdmittedObject where
  model : SIRCompartmentModel
  thresholdProved : ℙrop
  extinctionProved : ℙrop
  conclusion : thresholdProved ∧ extinctionProved

structure AdmissibleClass where
  object : EpidemicAdmittedObject
  endpointSatisfied : ℙrop
  remainderRecorded : ℙrop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : ℙrop :=
  epidemicWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse

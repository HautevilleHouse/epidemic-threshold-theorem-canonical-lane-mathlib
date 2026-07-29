import HautevilleHouse.EpidemicThresholdTheoremCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : EpidemicAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  EpidemicWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
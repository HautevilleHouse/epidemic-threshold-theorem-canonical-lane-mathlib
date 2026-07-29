import Mathlib

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure EpidemicSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EpidemicAdmittedObject where
  space : EpidemicSpace
  network : Prop
  contactProcess : Prop
  thresholdCondition : Prop
  conclusion : thresholdCondition

def EpidemicWitnessClosed (O : EpidemicAdmittedObject) : Prop :=
  O.thresholdCondition

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse
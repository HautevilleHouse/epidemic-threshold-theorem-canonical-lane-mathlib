import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

structure AdmissibleClass where
  bridgeData : Prop
  gateData : Prop

def defaultAdmissibleClass (_ : Unit) : AdmissibleClass :=
  { bridgeData := True, gateData := True }

def bridgeClosed (A : AdmissibleClass) : Prop := A.bridgeData
def gateClosed (A : AdmissibleClass) : Prop := A.gateData

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  rcases A with ⟨hb, hg⟩; exact hb

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  rcases A with ⟨hb, hg⟩; exact hg

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse

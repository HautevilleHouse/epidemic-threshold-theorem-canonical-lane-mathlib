import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpidemicThresholdTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : ℙrop :=
  epidemicWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EpidemicThresholdTheoremCanonicalLaneLean
end HautevilleHouse

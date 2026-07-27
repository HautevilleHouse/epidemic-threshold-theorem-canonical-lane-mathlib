import Lake
open Lake

package EpidemicThresholdTheoremCanonicalLaneLean where
  version := "0.1.0"

require canonical_lane_mathlib_core from git
  "https://github.com/HautevilleHouse/canonical-lane-mathlib.git" @
  "ac2caf2b7698cd96d2cd0bf5a4cdbbe88c7f620f"

@[default_target]
lean_lib EpidemicThresholdTheoremCanonicalLaneLean where

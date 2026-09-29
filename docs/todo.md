# Tasks

Updated 2026-09-29. [v0.1 print guide](../src/stl/v0.1/README.md) · [Design notes](design-notes.md)

## Done

- [x] Review the notebook sketch and record its dimensions.
- [x] Model a parametric pouch with two rear J-hooks (`seed_holder.scad`).
- [x] Export `hook_test.stl` and `pouch.stl`; check that they are closed meshes within the bed and Z limits.

## Questions for the owner

- [ ] Are 6.75 × 8 × 2.5 in the **inside** or the **outside** size? v0.1 assumes inside.
- [ ] Is the tick at the top center of the front edge a **finger notch**? If so, how wide and deep?
- [ ] Which bucket? Measure the wall thickness and the rim lip (thickness and how far it sticks out).
- [ ] Does the pouch hang on the **outside** of the bucket or the inside? The hook works either way, but it changes what the leg rests against.
- [ ] Which bag brand and size is "medium"? Measure it flat and when filled.
- [ ] Filament: PLA or PETG? (A hot truck cab softens PLA.)

## Next print batch

- [ ] Print `hook_test.stl`; record rim fit, rocking and leg length. Adjust `hook_gap` / `hook_drop`.
- [ ] Print `pouch.stl` upright with supports under the hook legs only.
- [ ] Load it with a full bag; check bag fit, hook deflection and how it hangs.
- [ ] Record filament, nozzle, layer height and slicer profile with the results.

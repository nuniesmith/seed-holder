# Sunflower seed holder

An open-top pouch that holds a **medium freezer bag of sunflower seeds** and hangs on the rim of a **bucket** with rear hooks. It is printed on an **Ender 3 Neo (220 × 220 × 250 mm)**.

**Current print checkpoint: [v0.1 first draft](src/stl/v0.1/README.md).** Print the small `hook_test.stl` first to check the bucket rim fit, then the full `pouch.stl`. Nothing has been physically tested yet.

![Side, top and hook-test views of the v0.1 STLs](src/stl/v0.1/preview.png)

## Start here

- [v0.1 print guide](src/stl/v0.1/README.md)
- [Sketch review and dimensions](docs/design-notes.md)
- [Current tasks and questions](docs/todo.md)
- [Original notebook sketch](pictures/IMG_0148.JPEG)

## Design from the sketch

| Feature | Sketch | CAD (mm) |
|---|---:|---:|
| Pouch width | 6.75 in | 171.45 inside, 176.25 outside |
| Pouch height ("L") | 8 in | 203.2 inside, 205.6 outside |
| Pouch depth | 2.5 in | 63.5 inside, 68.3 outside |
| Hook throat (gap to bucket) | 1.25 in | 31.75 |
| Hook leg length from the top | 4 in | 101.6 |

The sketch does not say whether 6.75 × 8 × 2.5 in is the inside or outside size. v0.1 treats these as **inside dimensions** so the bag gets the full space. The walls are 2.4 mm thick. See [design notes](docs/design-notes.md).

## What has been checked

Only CAD checks. Both STLs are closed, single-body meshes that fit the Ender 3 Neo's build volume ([mesh_checks.json](src/stl/v0.1/mesh_checks.json)). The bucket rim fit, bag fit, hook strength and print quality have not been tested.

## Revision history

| Directory | Role |
|---|---|
| [v0.1](src/stl/v0.1) | First draft from the notebook sketch: pouch with two rear hooks, plus a hook test piece |

## Layout

```
pictures/   reference photos and sketches
docs/       design notes, tasks
src/stl/    one folder per CAD revision (OpenSCAD source, STLs, scripts, preview)
```

Repository: [nuniesmith/seed-holder](https://github.com/nuniesmith/seed-holder).

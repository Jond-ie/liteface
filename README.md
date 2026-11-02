# LiteFace

Every Face ID prompt uses iOS 18's small Face ID animation at the top of the screen (the one the Hidden apps folder uses) instead of the box in the middle of the screen. No settings.

- **iOS 18 to 27**, Rootless and RootHide jailbreaks (tested on iOS 18.6.2)
- **Face ID iPhones** (iPhone XS / XR and newer). On Touch ID devices it does nothing.
- arm64 and arm64e

Install from the [pwnapple repo](https://jond-ie.github.io/repo/).

## How it works

Face ID prompts are drawn by `CoreAuthUI`. Its `FaceIdToastViewController` is created with a `lightweightUIMode`: `0` is the classic box in the middle, `2` the small glyph at the top that iOS 18 uses for hidden and locked apps. LiteFace hooks `-initWithGlyph:presentingController:title:lightweightUIMode:` and asks for `2` whenever the prompt would use `0`. That's the whole tweak (see `Tweak.x`).

## Building

[Theos](https://theos.dev), then `make package FINALPACKAGE=1`.

## License

GPL-3.0. See `LICENSE`.

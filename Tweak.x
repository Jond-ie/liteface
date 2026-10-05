// LiteFace: iOS 18 shows Face ID for hidden and locked apps as a small glyph
// at the top of the screen ("lightweight" UI); every other Face ID prompt is a
// box in the middle. CoreAuthUI picks between them when it makes the prompt,
// through lightweightUIMode: 0 is the box, 2 the small glyph. Ask for 2 always.
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

static const long long LFLightweightTop = 2;

%hook FaceIdToastViewController

- (id)initWithGlyph:(id)glyph presentingController:(id)presenting title:(id)title lightweightUIMode:(long long)mode {
	return %orig(glyph, presenting, title, mode == 0 ? LFLightweightTop : mode);
}

%end

%ctor {
	// Only where iOS 18's prompt exists; anywhere else, do nothing.
	Class toast = objc_getClass("FaceIdToastViewController");
	if (toast && class_getInstanceMethod(toast, @selector(initWithGlyph:presentingController:title:lightweightUIMode:))) %init;
}

#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "Image1" asset catalog image resource.
static NSString * const ACImageNameImage1 AC_SWIFT_PRIVATE = @"Image1";

/// The "Image2" asset catalog image resource.
static NSString * const ACImageNameImage2 AC_SWIFT_PRIVATE = @"Image2";

/// The "Image3" asset catalog image resource.
static NSString * const ACImageNameImage3 AC_SWIFT_PRIVATE = @"Image3";

/// The "Image4" asset catalog image resource.
static NSString * const ACImageNameImage4 AC_SWIFT_PRIVATE = @"Image4";

#undef AC_SWIFT_PRIVATE

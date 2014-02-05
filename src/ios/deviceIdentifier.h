#import <Cordova/CDV.h>
#import <Cordova/CDVPluginResult.h>
#import <AdSupport/ASIdentifierManager.h>


@interface deviceIdentifier : CDVPlugin

    - (void) getVendorIdentifier:(CDVInvokedUrlCommand*)command;

@end

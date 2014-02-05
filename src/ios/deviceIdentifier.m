#import "deviceIdentifier.h"
#import <Cordova/CDV.h>
#import <Cordova/CDVPluginResult.h>
#import <AdSupport/ASIdentifierManager.h>

@implementation deviceIdentifier

    - (void) getVendorIdentifier:(CDVInvokedUrlCommand*)command {
        CDVPluginResult* pluginResult = nil;
        NSString* venderIdentifier = nil;

        @try {
            // attempt to call the function
            venderIdentifier = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];

            if (venderIdentifier != nil && [venderIdentifier length] > 0) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:venderIdentifier];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
            }

        }
        @catch (NSException* exception) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION messageAsString:[exception reason]];
            venderIdentifier = [pluginResult toErrorCallbackString:command.callbackId];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
@end

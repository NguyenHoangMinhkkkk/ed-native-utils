//
//  EDNativeUtils.m
//  EDNativeUtils
//
//  Created by MrVinh on 17/08/2021.
//

#import "EDObjectCNativeUtils.h"


@implementation EDObjectCNativeUtils

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(callbackExample:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}

@end

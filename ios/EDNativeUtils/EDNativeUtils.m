//
//  EDNativeUtils.m
//  EDNativeUtils
//
//  Created by MrVinh on 03/09/2021.
//

#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(EDNativeUtils, NSObject)

//RCT_EXTERN_METHOD(callbackExample: (RCTResponseSenderBlock)callback)
//RCT_EXTERN_METHOD(promiseExample: (NSInteger)count resolve:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(makeToast:(NSDictionary *)options)

@end

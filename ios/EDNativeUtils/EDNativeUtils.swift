//
//  EDNativeUtils.swift
//  EDNativeUtils
//
//  Created by MrVinh on 17/08/2021.
//

import Foundation
import Toast_Swift

@objc(EDNativeUtils)
class EDNativeUtils : NSObject {
    @objc static func moduleName() -> String! {
        return "EDNativeUtils"
    }
      
    //  true if you need this class initialized on the main thread
    //  false if the class can be initialized on a background thread
    @objc static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
//    @objc func constantsToExport() -> [AnyHashable : Any]! {
//        return [
//            "number": 123.9,
//            "string": "foo",
//            "boolean": true,
//            "array": [1, 22.2, "33"],
//            "object": ["a": 1, "b": 2]
//       ]
//    }
    
//    @objc func callbackExample(_ callback: RCTResponseSenderBlock) -> Void {
//        let count = Date().timeIntervalSince1970;
//        callback([count, count])
//    }
    
//    @objc func promiseExample(_ count:NSInteger, resolve: RCTPromiseResolveBlock,rejecter reject: RCTPromiseRejectBlock) {
//        if (count % 2 == 0) {
//            let error = NSError(domain: "", code: 200, userInfo: nil)
//            reject("E_COUNT", "reject with count =  \(count)", error)
//        } else {
//            resolve("resolve with count =  \(count)")
//        }
//    }
  
  @objc func makeToast(_ options: NSDictionary) -> Void{
    DispatchQueue.main.async {
        let rootView = UIApplication.shared.keyWindow?.rootViewController
        if(rootView == nil) { return }
        
        let image = options["image"]
        let imageSize = options["imageSize"]
        let textColor = options["textColor"]
        let backgroundColor = options["backgroundColor"]
        let duration = RCTConvert.double(options["duration"])
        let message = RCTConvert.nsString(options["message"]) ?? "Empty toast"
        let position = RCTConvert.nsString(options["position"]) ?? "bottom" // top | center | bottom
        
        var toastPosition = ToastPosition.bottom
        if(position == "top") { toastPosition = ToastPosition.top }
        if(position == "center") { toastPosition = ToastPosition.center }
        
        var style = ToastStyle()
        style.displayShadow = true
        if(textColor != nil) { style.messageColor = RCTConvert.uiColor(textColor) }
        if(backgroundColor != nil) { style.backgroundColor = RCTConvert.uiColor(backgroundColor) }
            
        if(image == nil){
            rootView?.view.makeToast(message, duration: duration, position: toastPosition, style: style)
        } else {
            if(imageSize != nil) {
                style.imageSize.height = RCTConvert.cgFloat(imageSize)
                style.imageSize.width = RCTConvert.cgFloat(imageSize)
            }
            rootView?.view.makeToast(message, duration: duration, position: toastPosition, title: nil, image: RCTConvert.uiImage(image), style: style)
        }
      }
    }
}

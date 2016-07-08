//
//  DataManager.h
//  Ala_Facebook
//
//  Created by Student on 04/07/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (void) POSTRequestWithURL:(NSString *)url
                 parameters:(NSDictionary *)params
                    handler:(void (^)(NSData *, NSURLResponse *, NSError *))handler;
+ (void) GETRequestWithURL:(NSString *)url
                 parameters:(NSDictionary *)params
                    handler:(void (^)(NSData *, NSURLResponse *, NSError *))handler;

@end

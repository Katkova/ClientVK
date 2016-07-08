//
//  AppDelegate.h
//  Ala_Facebook
//
//  Created by Student on 24/06/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VKSdk.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) VKSdk *sdkInstance;

-(void)vkAuthorize;


@end


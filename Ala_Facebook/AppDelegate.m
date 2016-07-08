//
//  AppDelegate.m
//  Ala_Facebook
//
//  Created by Student on 24/06/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "AppDelegate.h"
#import "ALF_ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]init];
    ALF_ViewController *viewController = [ALF_ViewController new];
    
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:viewController];
    [[self window] setRootViewController:navController];
    [[self window] makeKeyAndVisible];
    return YES;
        
}




@end

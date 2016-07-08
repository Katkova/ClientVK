//
//  AppDelegate.m
//  Ala_Facebook
//
//  Created by Student on 24/06/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "AppDelegate.h"
#import "ALF_ViewController.h"
#import "VKSdk.h"
#import "FeedViewController.h"

@interface AppDelegate ()<VKSdkDelegate, VKSdkUIDelegate>

@end

@implementation AppDelegate
//must have methods of the VKSdkDelegate


-(void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result {
    NSLog(@"result, %@", result);
    if (result.token !=nil){
    [[NSUserDefaults standardUserDefaults]setObject:result.token.accessToken forKey:@"authToken"];
    }
};
- (void)vkSdkUserAuthorizationFailed {
};

//must have methods of the VKSdkUIDelegate
- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    [self.window.rootViewController presentViewController:controller animated:YES completion:nil];
};
- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
};

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    [VKSdk processOpenURL:url fromApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]];
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.sdkInstance = [VKSdk initializeWithAppId:@"5534154"];
    [self.sdkInstance registerDelegate:self];
    [self.sdkInstance setUiDelegate:self];
    
    self.window = [[UIWindow alloc]init];
   
    //08/07 ability to get news
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"authToken"];
    
    if (token) {
        FeedViewController *viewController = [FeedViewController new];
        UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:viewController];
    }
    
    else {
        ALF_ViewController *viewController = [ALF_ViewController new];
        
        UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:viewController];
        [[self window] setRootViewController:navController];
    }
    
    
    [[self window] makeKeyAndVisible];
    return YES;
        
};

-(void) vkAuthorize {
    NSArray *SCOPE = @[@"market"];
    
    [VKSdk wakeUpSession:SCOPE completeBlock:^(VKAuthorizationState state, NSError *error) {
        if (state == VKAuthorizationInitialized) {[VKSdk authorize:VKParseVkPermissionsFromInteger(134217728) withOptions:VKAuthorizationOptionsDisableSafariController];
            
        }
        else {            // Some error happend, but you may try later
        } 
    }];
   //
};


@end

//
//  FeedViewController.m
//  Ala_Facebook
//
//  Created by Student on 08/07/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "FeedViewController.h"
#import "DataManager.h"

@implementation FeedViewController

- (void) viewDidLoad {
//getrequest
NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:@"authKey"];
[DataManager GETRequestWithURL:@"https://api.vk.com/method/newsfeed.get"
                    parameters:@{@"access_token":token}
                       handler:^(NSData *data, NSURLResponse *responce, NSError *error){
                           NSString *s = [[NSString alloc] initWithData:data                                                encoding:NSUTF8StringEncoding];
                           id o = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:0
                                                                    error:nil];
                       }];


};


@end

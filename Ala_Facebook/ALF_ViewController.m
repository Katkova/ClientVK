//
//  ALF_ViewController.m
//  Ala_Facebook
//
//  Created by Student on 24/06/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "ALF_ViewController.h"
#import "DataManager.h"
#import "AppDelegate.h"

@implementation ALF_ViewController



-(void) submitLogIn{
    UIApplication *application = [UIApplication sharedApplication];
    [(AppDelegate *)application.delegate vkAuthorize];
}

-(void) submit {
    
    NSDictionary *dictionary = @{
            @"first_name": self.nameTextField.text,
            @"last_name": self.secondNameTextField.text,
            @"client_id":@"5534154",
            @"client_secret":@"1Ct70CDyN7HOBlQtQ5q5",
            @"phone": self.phoneTextField.text,
            @"password": self.passwordTextField.text,
            @"test_mode":@1
                };
    [DataManager POSTRequestWithURL:@"https://api.vk.com/method/auth.signup"
                         parameters:dictionary
                            handler:^(NSData *data, NSURLResponse *responce, NSError *error){
                                NSString *s = [[NSString alloc] initWithData:data                                                encoding:NSUTF8StringEncoding];
                                id o = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:0
                                                                         error:nil];
                            }];

    }

- (void) viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"girl"];
    [self.view addSubview:imageView];
    [imageView setBackgroundColor:[UIColor greenColor]];
    
    UIView *blueOverlay = [[UIView alloc]initWithFrame:imageView.bounds];
    [blueOverlay setBackgroundColor:[UIColor colorWithRed:49.0f/255.0f green:101.0f/255.0f blue:141.0f/255.0f alpha:0.8]];
    [imageView addSubview:blueOverlay];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:49.0f/255.0f green:101.0f/255.0f blue:141.0f/255.0f alpha:1]];
    
    //name Text field
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, [self.view frame].size.width-20, 20)];
    [self.view addSubview:self.nameTextField];
    NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:@"First Name" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.nameTextField setAttributedPlaceholder:placeholder];
    //underline for name Text field
    UIView *underlineView = [[UIView alloc] initWithFrame: CGRectMake(0, self.nameTextField.frame.size.height-1, self.nameTextField.frame.size.width, 0.5)];
    [self.nameTextField addSubview:underlineView];
    [underlineView setBackgroundColor:[UIColor whiteColor]];
    
    //second name Text Field
    self.secondNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(10,150,[self.view frame].size.width-20, 20)];
    [self.view addSubview:self.secondNameTextField];
    NSAttributedString *placeholder2 = [[NSAttributedString alloc]initWithString:@"Second Name" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.secondNameTextField setAttributedPlaceholder:placeholder2];
    //no Underline!!!
    
    //phone number TextField
    self.phoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(10,200,[self.view frame].size.width-20, 20)];
    [self.view addSubview:self.phoneTextField];
    NSAttributedString *placeholder3 = [[NSAttributedString alloc]initWithString:@"Phone number" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.phoneTextField setAttributedPlaceholder:placeholder3];
    //no Underline!!!

    //password TextField
    self.passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 250, [self.view frame].size.width-20, 20)];
    [self.view addSubview:self.passwordTextField];
    NSAttributedString *placeholder4 = [[NSAttributedString alloc]initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.passwordTextField setAttributedPlaceholder:placeholder4];
     //no Underline!!!
    
    
  
    
    //doing button for Creation of the account
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Create Account" style:UIBarButtonItemStyleDone target:self action:@selector(submit)];
    
    [self.navigationItem setRightBarButtonItem:item];
    
    // second Button LogIn
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"Log In" style:UIBarButtonItemStyleDone target:self action:@selector(submitLogIn)];
    
    [self.navigationItem setLeftBarButtonItem:item2];
     
}

@end

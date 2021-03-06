//
//  LoginViewController.m
//  tweetbizz
//
//  Created by Jordan Anderson on 6/12/15.
//  Copyright (c) 2015 Jordan Anderson. All rights reserved.
//

#import "LoginViewController.h"
#import "TimelineViewController.h"

#import <TwitterKit/TwitterKit.h>


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
        if (error)
        {
            NSLog(@"error: %@", [error localizedDescription]);
        }
        
    }];
    
    logInButton.center = self.view.center;
    [self.view addSubview:logInButton];
    
    // Completion Block
    [[Twitter sharedInstance] logInWithCompletion:^
     (TWTRSession *session, NSError *error) {
         if (session)
         {
             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
             UINavigationController *navC = [storyboard instantiateViewControllerWithIdentifier:@"TimelineNavC"];
             [self presentViewController:navC animated:YES completion:nil];
             
             //                 NSLog(@"signed in as %@", [session userName]);
         }
         else if (error)
         {
             NSLog(@"error: %@", [error localizedDescription]);
         }
     }];
    
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [self loginUserToTwitter];
//
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginUserToTwitter
{
        TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
            if (error)
            {
                NSLog(@"error: %@", [error localizedDescription]);
            }
            
        }];
    
        logInButton.center = self.view.center;
        [self.view addSubview:logInButton];
    
    // Completion Block
    [[Twitter sharedInstance] logInWithCompletion:^
     (TWTRSession *session, NSError *error) {
         if (session)
         {
             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
             UINavigationController *navC = [storyboard instantiateViewControllerWithIdentifier:@"TimelineNavC"];
             [self presentViewController:navC animated:YES completion:nil];
             
             //                 NSLog(@"signed in as %@", [session userName]);
         }
         else if (error)
         {
             NSLog(@"error: %@", [error localizedDescription]);
         }
     }];
    

}


- (void)alreadyLoggedPushtoTimeline
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *navC = [storyboard instantiateViewControllerWithIdentifier:@"TimelineNavC"];    
    [self presentViewController:navC animated:YES completion:nil];
}



@end

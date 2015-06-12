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
        if (session) {
            NSLog(@"signed in as %@", [session userName]);
        } else {
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
             //configure push to new view here
//             TimelineViewController *timeLineVC = [[TimelineViewController alloc] init];
//             [self.navigationController pushViewController:timeLineVC animated:YES];
             
             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
             UINavigationController *navC = [storyboard instantiateViewControllerWithIdentifier:@"TimeLineNavController"];
//             TimelineViewController *timeLineVC = [navC viewControllers][0];
            [self presentViewController:navC animated:YES completion:nil];

             NSLog(@"signed in as %@", [session userName]);
         }
         else
         {
             NSLog(@"error: %@", [error localizedDescription]);
         }
     }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

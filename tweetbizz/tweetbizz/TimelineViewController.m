//
//  TimelineViewController.m
//  tweetbizz
//
//  Created by Jordan Anderson on 6/12/15.
//  Copyright (c) 2015 Jordan Anderson. All rights reserved.
//

#import "TimelineViewController.h"
#import <TwitterKit/TwitterKit.h>

@interface TimelineViewController ()

@property (weak, nonatomic) NSString *currentUser;

- (IBAction)logoutTapped:(UIBarButtonItem *)sender;

@end

@implementation TimelineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    if ([[[Twitter sharedInstance] session] userName])
    {
        self.currentUser = [[[Twitter sharedInstance] session] userName];
        
        TWTRAPIClient *APIClient = [[Twitter sharedInstance] APIClient];
        TWTRUserTimelineDataSource *userTimelineDataSource = [[TWTRUserTimelineDataSource alloc] initWithScreenName:self.currentUser APIClient:APIClient];
            self.dataSource = userTimelineDataSource;
    }
    else
    {
        NSLog(@"Erorr!");
    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutTapped:(UIButton *)sender
{
   [[Twitter sharedInstance] logOut];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *navC = [storyboard instantiateViewControllerWithIdentifier:@"LoginNavC"];
    [self presentViewController:navC animated:YES completion:nil];
//    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"Logout tapped");
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

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

- (IBAction)logoutTapped:(UIButton *)sender;

@end

@implementation TimelineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [[Twitter sharedInstance] logInGuestWithCompletion:^(TWTRGuestSession *guestSession, NSError *error) {
//        if (guestSession) {
//            TWTRAPIClient *APIClient = [[Twitter sharedInstance] APIClient];
//            TWTRSearchTimelineDataSource *searchTimelineDataSource = [[TWTRSearchTimelineDataSource alloc] initWithSearchQuery:@"#twitterflock" APIClient:APIClient];
////            self.dataSource = searchTimelineDataSource;
//        } else {
//            NSLog(@"error: %@", [error localizedDescription]);
//        }
//    }];
    
    
// experiement
    if ([[[Twitter sharedInstance] session] userName])
    {
        self.currentUser = [[[Twitter sharedInstance] session] userName];
        
        TWTRAPIClient *APIClient = [[Twitter sharedInstance] APIClient];
        TWTRUserTimelineDataSource *userTimelineDataSource = [[TWTRUserTimelineDataSource alloc] initWithScreenName:self.currentUser APIClient:APIClient];
//            self.dataSource = userTimelineDataSource;
        
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
    [self dismissViewControllerAnimated:YES completion:nil];
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

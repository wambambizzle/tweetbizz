//
//  LoginViewController.m
//  tweetbizz
//
//  Created by Jordan Anderson on 6/11/15.
//  Copyright (c) 2015 Jordan Anderson. All rights reserved.
//

#import "LoginViewController.h"
#import "STTwitter.h"
#import <TwitterKit/TwitterKit.h>


#define kOAuthConsumerKey @"dwMmiLxGS74wPnBkx4dLZSnXc"
#define kOAuthConsumerSecret @"8IrdPVVdMtKfCGTPMMQGvjCW3NH5TrKyGOxiBHXmAIGeJNMCEe"



@interface LoginViewController () <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *username;
@property (nonatomic, strong) IBOutlet UITextField *password;

-(IBAction)loginWithUserName:(id)sender;
-(IBAction)signUpOnTheWeb:(id)sender;

@end


@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //    PFUser *user = [PFUser user];
    //    user.username = @"my name";
    //    user.password = @"my pass";
    //    user.email = @"email@example.com";
    //
    //    // other fields can be set if you want to save more information
    //    user[@"phone"] = @"650-555-0000";
    //
    //    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    //        if (!error) {
    //            // Hooray! Let them use the app now.
    //        } else {
    //            NSString *errorString = [error userInfo][@"error"];
    //            // Show the errorString somewhere and let the user try again.
    //        }
    //    }];
    
    TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error)
    {
        // play with Twitter session
    }];
    logInButton.center = self.view.center;
    [self.view addSubview:logInButton];

    
    self.username.delegate = self;
    self.password.delegate = self;
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"HelveticaNeue-Light" size:20],
      NSFontAttributeName,
      [UIColor blackColor],NSForegroundColorAttributeName, nil]];
    
    
    self.title = @"tweetbizz";
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc;
    
    if (![textField.text isEqualToString:@""])
    {
        rc = YES;
        if (textField == self.username)
        {
            [self.username resignFirstResponder];
            [self.password becomeFirstResponder];

        }
        else if (textField == self.password)
        {
           [self.password resignFirstResponder];
           [textField resignFirstResponder];
        }
        
    }
    
    return rc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginWithUserName:(id)sender
{
    
}

-(IBAction)signUpOnTheWeb:(id)sender
{
    
}

- (void) loginWithUser:(NSString*)user password:(NSString*)password
{
    user = self.username.text;
   
    password = self.password.text;
    
   STTwitterAPI *twitter = [STTwitterAPI twitterAPIWithOAuthConsumerKey:kOAuthConsumerKey
                                            consumerSecret:kOAuthConsumerSecret
                                                  username:user
                                                  password:password];
    
    [twitter verifyCredentialsWithUserSuccessBlock:^(NSString *username, NSString *userID) {
        // ...
    } errorBlock:^(NSError *error) {
        // ...
    }];
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

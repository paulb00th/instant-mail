//
//  InstantMailViewController.m
//  Instant Mail
//
//  Created by Paul Booth on 04/10/2012.
//  Copyright (c) 2012 Paul Booth. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

#import "InstantMailViewController.h"

@interface InstantMailViewController ()

@end

@implementation InstantMailViewController

- (void)viewDidLoad
{
    [self setDefaultSettings];   
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if ([self NSStringIsValidEmail:self.recipient])
        [self displayComposerSheet];
    else
        [self displaySettings];
}
    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IASKAppSettingsViewController*)appSettingsViewController {
	if (!_appSettingsViewController) {
		_appSettingsViewController = [[IASKAppSettingsViewController alloc] init];
		_appSettingsViewController.delegate = self;
	}
	return _appSettingsViewController;
}

-(void)setDefaultSettings
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *appDefaults =
        @{ @"recipient_preference" : @"",
           @"prefix_preference" : @"[Note] " };
    
    [defaults registerDefaults:appDefaults];
    [defaults synchronize];
}

-(NSString *)recipient
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:(@"recipient_preference")];
}

-(NSString *)prefix
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:(@"prefix_preference")];
}

-(void)displayComposerSheet
{
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate = self;
    
    [mailComposer setToRecipients:@[self.recipient]];
    [mailComposer setSubject:self.prefix];
    [mailComposer setMessageBody:@"" isHTML:NO];
    [mailComposer setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];

    [self presentViewController:mailComposer animated:YES completion:^(void){
        // If there is a way to set first responder in IOS 6 then we should do it here
    }];
}

-(void)displaySettings
{
    UINavigationController *settingsController = [[UINavigationController alloc] initWithRootViewController:self.appSettingsViewController];
    [self presentViewController:settingsController animated:YES completion:nil];
}

#pragma mark -
#pragma mark MFMailComposeViewControllerDelegate protocol

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark IASKAppSettingsViewControllerDelegate protocol
- (void)settingsViewControllerDidEnd:(IASKAppSettingsViewController*)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Utility methods

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

@end

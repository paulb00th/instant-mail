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
    
    if (self.recipient == @"")
    {
        NSLog(@"User needs to set preferences");
    }
    else
    {
        [self displayComposerSheet];
    }
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [self dismissViewControllerAnimated:YES completion:^(void){
        [self displayComposerSheet];
    }];
}

@end

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
    [self displayComposerSheet];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)displayComposerSheet
{
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate = self;
    
    [mailComposer setToRecipients:@[@"test@paulbooth.com"]];
    [mailComposer setSubject:@"[NOTE] "];
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

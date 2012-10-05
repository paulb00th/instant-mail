//
//  InstantMailViewController.h
//  Instant Mail
//
//  Created by Paul Booth on 04/10/2012.
//  Copyright (c) 2012 Paul Booth. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IASKAppSettingsViewController.h"

@interface InstantMailViewController : UIViewController <MFMailComposeViewControllerDelegate, IASKSettingsDelegate>

@property (nonatomic, retain) IASKAppSettingsViewController *appSettingsViewController;

@end

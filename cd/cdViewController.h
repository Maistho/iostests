//
//  cdViewController.h
//  cd
//
//  Created by Gustav Bylund on 31/07/14.
//  Copyright (c) 2014 Instutitionen för datavetenskap, Linköpings Universitet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface cdViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *l1;
@property (weak, nonatomic) IBOutlet UITextField *l2;
@property (weak, nonatomic) IBOutlet UITextField *l3;
@property (weak, nonatomic) IBOutlet UILabel *status;

- (IBAction)b1:(id)sender;
- (IBAction)b2:(id)sender;

@end

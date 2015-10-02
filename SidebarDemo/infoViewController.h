//
//  infoViewController.h
//  AliCan
//
//  Created by Sidney Leusson Angulo on 2/02/15.
//  Copyright (c) 2015 AliCan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kGETUrlr @"http://misimio.co/index.php"

@interface infoViewController : UIViewController
- (IBAction)enviar:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *valoractual;

@property (weak, nonatomic) IBOutlet UITextField *cantidad;

@end

//
//  ContactoViewController.h
//  SidebarDemo
//
//  Created by sidney leusson on 29/09/15.
//  Copyright © 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) NSString *photoFilename;
@end

//
//  ContactoViewController.m
//  SidebarDemo
//
//  Created by sidney leusson on 29/09/15.
//  Copyright © 2015 AppCoda. All rights reserved.
//

#import "ContactoViewController.h"
#import "SWRevealViewController.h"


@interface ContactoViewController ()

@end

@implementation ContactoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Contacto";
    
    // Do any additional setup after loading the view.
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
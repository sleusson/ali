//
//  registroViewController.h
//  AliCan
//
//  Created by sidney leusson on 13/02/15.
//  Copyright (c) 2015 AliCan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registroViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usuario;
@property (weak, nonatomic) IBOutlet UITextField *contrasena;
@property (weak, nonatomic) IBOutlet UITextField *nombrecompleto;

- (IBAction)enviar:(id)sender;

@end

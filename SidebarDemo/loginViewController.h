//
//  loginViewController.h
//  AliCan
//
//  Created by sidney leusson on 9/02/15.
//  Copyright (c) 2015 AliCan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController{
    NSMutableArray *ListaAtendimientos;
}

- (IBAction)enviar:(id)sender;
@property (retain, nonatomic) NSURLConnection *connection;

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *contrasena;

@property (retain, nonatomic) NSMutableData *receivedData;
@end

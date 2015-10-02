//
//  userViewController.m
//  AliCan
//
//  Created by Sidney Leusson Angulo on 2/02/15.
//  Copyright (c) 2015 AliCan. All rights reserved.
//

#import "userViewController.h"
//#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>
#import <CommonCrypto/CommonDigest.h>

@interface userViewController ()

@end

@implementation userViewController

NSString *cod_usuario;
NSString *des_usuario;
NSString *email;
NSString *encrypted_password;
NSString *salt;
NSDate *fecha_registro;


- (void)viewDidLoad {

    [super viewDidLoad];
}
-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged in.";

    [self toggleHiddenState:NO];
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    NSLog(@"%@", user);
    self.profilePicture.profileID = user.objectID;// .id;
    self.lblUsername.text = user.name;
    self.lblEmail.text = [user objectForKey:@"email"];
    
    NSDate *date = [NSDate date];
    
   // cod_usuario = 1;
    des_usuario = user.name;
    email = [user objectForKey:@"email"];
    fecha_registro = date;
    
    if (user){
    NSMutableString *stsURL = [[NSMutableString alloc] initWithFormat:@"http://misimio.co/alican/datosuseer.php?cod_usuario=%d&des_usuario=%@&email=%@&encrypted_password=%i&salt=%i&fecha_registro=%@",0,user.name,email,0,1,fecha_registro];
    
    [stsURL setString:[stsURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"la URL con datos es: %@",stsURL);
    
    //En dataURL guarda lo que recibe del php
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:stsURL]];
    // [self performSelector:@selector(comfecha) withObject:nil afterDelay:600.0];
    NSMutableString *strResult = [[NSMutableString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    
    if ([strResult isEqualToString:@"1"]) {
        NSLog(@"TODO CORRECTO");
    }
    // Do any additional setup after loading the view, typically from a nib.
    
    [self toggleHiddenState:YES];
    self.lblLoginStatus.text = @"";
    
    self.loginButton.delegate = self;
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
    // Do any additional setup after loading the view.
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notification" message:
                          @"Usuario registrado" delegate:nil cancelButtonTitle:
                          @"Registro" otherButtonTitles:nil, nil];
    [alert show];
    }
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged out";

    [self toggleHiddenState:YES];
}

- (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}

-(void)toggleHiddenState:(BOOL)shouldHide{
    self.lblUsername.hidden = shouldHide;
    self.lblEmail.hidden = shouldHide;
    self.profilePicture.hidden = shouldHide;
}

@end

//
//  loginViewController.m
//  AliCan
//
//  Created by sidney leusson on 9/02/15.
//  Copyright (c) 2015 AliCan. All rights reserved.
//

#import "loginViewController.h"
// import AFNetworking library header"
//#import "AFNetworking.h"
#import "FirstViewController.h"
#import <CommonCrypto/CommonDigest.h>

@interface loginViewController ()

@end

@implementation loginViewController
static NSString *const BaseURLString = @"http://misimio.co/index.php";
@synthesize email, contrasena;
NSString *val1, *val2;

- (void)viewDidLoad {
    [super viewDidLoad];

  //  [self postMethod];

    // Do any additional setup after loading the view.


}

-(NSString*) sha1:(NSString*)input
{
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
    
}

// ======================AFNetworking======================
// use AFNetworking
-(void) loadWebserverData
{
    NSString *emails = self.email.text;
    NSString *contra = self.contrasena.text;
    
    
    NSLog(emails);
    NSLog(contra);
    
    NSString *d = [self sha1:contra];
    
    NSMutableString *stsURL = [[NSMutableString alloc] initWithFormat:@"http://misimio.co/datosuseer.php?email=%@&password=%@",emails,d];
    
   // [stsURL setString:[stsURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL * url = [NSURL URLWithString: stsURL];

    NSLog(@"la URL con datos es: %@",stsURL);
    //En dataURL guarda lo que recibe del php
    
    //NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:stsURL]];
    NSData *data = [NSData dataWithContentsOfURL: url];
    NSLog(@"la URL con datos es: %@",data);
    NSError *erro;
    
   // NSMutableString *strResult = [[NSMutableString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    ListaAtendimientos = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&erro];
   // NSLog(@"la URL con datos es: %@",strResult);
    
      NSArray *atendimento2= ListaAtendimientos;
    
    /*
     
     NSMutableString *strURL = [[NSMutableString alloc] initWithFormat:kGETUrl4];
     NSURL * url = [NSURL URLWithString: strURL];
     NSData *data = [NSData dataWithContentsOfURL: url];
     NSError *erro;
     ListaAtendimientos = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&erro];
     */
    for (NSDictionary *atendimento in  atendimento2 )
    {
        NSLog(@"entro al for... %@");
        val1 = [atendimento objectForKey:@"email"];
        val2 = [atendimento objectForKey:@"encrypted_password"];
    }
      NSLog(@"la val1 con datos es: %@",val1);
    
    if (val1) {
        NSLog(@"TODO CORRECTO");
        UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Mensaje" message:@"usted se encuentra logueado" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [errorAlert show];
        
        FirstViewController *nextView = [[FirstViewController alloc] initWithNibName:nil
                                                                              bundle:nil];      // 1
        
        [self.navigationController pushViewController:nextView
                                             animated:YES];
  
        
    }else{
        UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"informacion errada, por favor vuelva a intentarlo" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [errorAlert show];

    }
}
// ======================AFNetworking======================


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)enviar:(id)sender {
    
       [self loadWebserverData];
}
@end

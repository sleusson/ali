//
//  registroViewController.m
//  AliCan
//
//  Created by sidney leusson on 13/02/15.
//  Copyright (c) 2015 AliCan. All rights reserved.
//

#import "registroViewController.h"
#import "FirstViewController.h"
#import <CommonCrypto/CommonDigest.h>

@interface registroViewController ()

@end

@implementation registroViewController
@synthesize usuario,contrasena,nombrecompleto;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)enviar:(id)sender {
    
    NSString *usuario1 = self.usuario.text;
    NSString *contra = self.contrasena.text;
    NSString *nombre = self.nombrecompleto.text;
    
    
    NSLog(usuario1);
    NSLog(contra);
    NSLog(nombre);
    
    NSString *d = [self sha1:contra];
    
    NSMutableString *stsURL = [[NSMutableString alloc] initWithFormat:@"http://misimio.co/registrarse.php?usuario=%@&password=%@&nombre=%@",usuario1,d,nombre];
    
     [stsURL setString:[stsURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    //NSURL * url = [NSURL URLWithString: stsURL];
    
    NSLog(@"la URL con datos es: %@",stsURL);
    //En dataURL guarda lo que recibe del php
    
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:stsURL]];
   // NSData *data = [NSData dataWithContentsOfURL: url];
    NSLog(@"la URL con datos es: %@",dataURL);
    NSError *erro;
    
     NSMutableString *strResult = [[NSMutableString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
   // ListaAtendimientos = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&erro];

        NSLog(@"TODO CORRECTO");
        UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Mensaje" message:@"Registro con exito" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [errorAlert show];
        
        FirstViewController *nextView = [[FirstViewController alloc] initWithNibName:nil
                                                                              bundle:nil];      // 1
        
        [self.navigationController pushViewController:nextView
                                             animated:YES];
    }
@end

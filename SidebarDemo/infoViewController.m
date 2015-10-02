//
//  infoViewController.m
//  AliCan
//
//  Created by Sidney Leusson Angulo on 2/02/15.
//  Copyright (c) 2015 AliCan. All rights reserved.
//

#import "infoViewController.h"

@interface infoViewController ()

@end

@implementation infoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)enviar:(id)sender {
    NSMutableString *stsURL = [[NSMutableString alloc] initWithFormat:@"http://misimio.co/index.php?opcion=%d",1];

    [stsURL setString:[stsURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];

    NSLog(@"la URL con datos es: %@",stsURL);

    //En dataURL guarda lo que recibe del php

    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:stsURL]];

    ///447733011
    //174385237

    NSMutableString *strResult = [[NSMutableString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];

    if ([strResult isEqualToString:@"1"]) {
        NSLog(@"TODO CORRECTO");
    }

}
@end

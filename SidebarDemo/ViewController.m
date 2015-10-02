//
//  ViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 9/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "ViewController.h"
#define CUSTOM_BUTTON_ID 100

@interface ViewController ()

@end

@implementation ViewController {
    AAShareBubbles *shareBubbles;
    float radius;
    float bubbleRadius;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    radius = 200;
    bubbleRadius = 40;
    
     self.title = @"Dispensar";
    
 //   _radiusSlider.value = radius;
 //   _bubbleRadiusSlider.value = bubbleRadius;
    
 //   _radiusLabel.text = [NSString stringWithFormat:@"%.0f", radius];
    _bubbleRadiusLabel.text = [NSString stringWithFormat:@"%.0f", bubbleRadius];
}

- (IBAction)shareTapped:(id)sender
{
    if(shareBubbles) {
        shareBubbles = nil;
    }
  //  shareBubbles = [[AAShareBubbles alloc] initWithPoint:_shareButton.center radius:radius inView:self.view];
    shareBubbles = [[AAShareBubbles alloc] initWithPoint:CGPointMake(200, 420)
                                                  radius:130
                                                  inView:self.view];
    shareBubbles.delegate = self;
    shareBubbles.bubbleRadius = bubbleRadius;
    shareBubbles.showFacebookBubble = YES;
    shareBubbles.showTwitterBubble = YES;
    shareBubbles.showGooglePlusBubble = YES;
  //  shareBubbles.showTumblrBubble = YES;
  //  shareBubbles.showVkBubble = YES;
  //  shareBubbles.showLinkedInBubble = YES;
   // shareBubbles.showYoutubeBubble = YES;
   // shareBubbles.showVimeoBubble = YES;
  //  shareBubbles.showRedditBubble = YES;
   // shareBubbles.showPinterestBubble = YES;
  //  shareBubbles.showInstagramBubble = YES;
   // shareBubbles.showWhatsappBubble = YES;
    
    [shareBubbles addCustomButtonWithIcon:[UIImage imageNamed:@"custom-vine-icon"]
                          backgroundColor:[UIColor colorWithRed:0.0 green:164.0/255.0 blue:120.0/255.0 alpha:1.0]
                              andButtonId:CUSTOM_BUTTON_ID];
    
    [shareBubbles show];
}

- (IBAction)radiusValueChanged:(id)sender {
    radius = 100;//[(UISlider *)sender value];
    //_radiusLabel.text = [NSString stringWithFormat:@"%.0f", 100];
}

- (IBAction)bubbleRadiusValueChanged:(id)sender {
    bubbleRadius = [(UISlider *)sender value];
    _bubbleRadiusLabel.text = [NSString stringWithFormat:@"%.0f", bubbleRadius];
}

#pragma mark -
#pragma mark AAShareBubbles

-(void)aaShareBubbles:(AAShareBubbles *)shareBubbles tappedBubbleWithType:(int)bubbleType
{
    UIAlertView *alert;
    switch (bubbleType) {
        case AAShareBubbleTypeFacebook:
            NSLog(@"AL");
            alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Dispensar alimento!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            break;
        case AAShareBubbleTypeTwitter:
            NSLog(@"AG");
            alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Dispensar agua!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            break;
        case AAShareBubbleTypeGooglePlus:
            NSLog(@"MD");
            alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Dispensar medicamento!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            break;
        case AAShareBubbleTypeTumblr:
            NSLog(@"Tumblr");
            break;
        case AAShareBubbleTypeVk:
            NSLog(@"Vkontakte (vk.com)");
            break;
        case AAShareBubbleTypeLinkedIn:
            NSLog(@"LinkedIn");
            break;
        case AAShareBubbleTypeYoutube:
            NSLog(@"Youtube");
            break;
        case AAShareBubbleTypeVimeo:
            NSLog(@"Vimeo");
            break;
        case AAShareBubbleTypeReddit:
            NSLog(@"Reddit");
            break;
        case CUSTOM_BUTTON_ID:
            NSLog(@"Custom Button With Type %d", bubbleType);
            break;
        default:
            break;
    }
}

-(void)aaShareBubblesDidHide:(AAShareBubbles*)bubbles {
    NSLog(@"All Bubbles hidden");
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [self setShareButton:nil];
 //   [self setRadiusSlider:nil];
 //   [self setRadiusLabel:nil];
 //   [self setBubbleRadiusSlider:nil];
    [self setBubbleRadiusLabel:nil];
    [super viewDidUnload];
}
@end


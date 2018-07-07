//
//  Spinner_iPad_Landscape.m
//  LendiProperty
//
//  Created by ss pl on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Spinner_iPad_Landscape.h"

@interface Spinner_iPad_Landscape ()

@end

@implementation Spinner_iPad_Landscape
@synthesize spinner, progbar,currentType,theLabel, blackBox,currentDisplay;



- (id)initWithType:(NSString*)type andDisplay:(NSString*)display{
    
    self = [super init];
    if(self){
        
        self.currentType = type;
        self.currentDisplay = display;
        
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //give our box round corners -- needed to import  <QuartzCore/QuartzCore.h> for this to work
    self.blackBox.layer.cornerRadius = 15;
    
    //and a shadow
    //self.blackBox.layer.masksToBounds = NO;
    //    self.blackBox.layer.shadowOffset = CGSizeMake(5, 5);
    //    self.blackBox.layer.shadowRadius = 5;
    //    self.blackBox.layer.shadowOpacity = 0.5;
    
    //fade this up
    self.view.alpha = 0;  
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.3];
    
    self.view.alpha = 1.0;
    [UIView commitAnimations];
    
    if([self.currentType isEqualToString:@"progbar"]){
        self.spinner.hidden = YES;       
        self.theLabel.text =self.currentDisplay;
    }else{
        self.progbar.hidden = YES;
        [self.spinner startAnimating];   
        self.theLabel.text = self.currentDisplay;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.spinner = nil;
    self.progbar = nil;
    self.currentType = nil;
    self.currentDisplay =nil;
    self.theLabel = nil;
    self.blackBox = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

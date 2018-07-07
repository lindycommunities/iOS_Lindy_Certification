//
//  LindyReportingViewController.m
//  LendiProperty
//
//  Created by Vinay D on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LindyReportingViewController.h"
#import "LoginViewController.h"
#import "WebviewDisplayController.h"
#import "LindyPropertyReportingViewController.h"
#import "LindyCertificateHomeViewController.h"
#import "LeasingAgentHomeViewController.h"

@implementation LindyReportingViewController

@synthesize LindyReporting_btn;

@synthesize LindyCertificates_btn;

@synthesize Bg_image;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Apps Methods

-(IBAction)LindyReportingView
{
   // LoginViewController *objLoginVC = [[LoginViewController alloc]init];
   // [self.navigationController pushViewController:objLoginVC animated:YES];
    
    
    LeasingAgentHomeViewController *objPropertyReortVC = [[LeasingAgentHomeViewController alloc]init];

    
//     LindyPropertyReportingViewController *objPropertyReortVC = [[LindyPropertyReportingViewController alloc]init];
    
     [self.navigationController pushViewController:objPropertyReortVC animated:YES];
    
   // [objPropertyReortVC release];

}

-(IBAction)LindyCertificates
{
    LindyCertificateHomeViewController  * main = [[LindyCertificateHomeViewController alloc]init];
    [self.navigationController pushViewController:main animated:YES];
//    WebviewDisplayController *ObjWeb=[[WebviewDisplayController alloc]initWithButtonTag:8 WithTitle:@"Lindy Certificates & Licenses"];
//     UINavigationController *nav_obj=[[UINavigationController alloc]initWithRootViewController:ObjWeb];
//    [self.navigationController presentModalViewController:nav_obj animated:YES];
//    [nav_obj release];
   
   
}

-(void)Portrait
{
    self.Bg_image.frame=CGRectMake(0, 0, 768, 1024);
    self.Bg_image.image=[UIImage imageNamed:@"Reporting_port.png"];
    self.LindyReporting_btn.frame=CGRectMake(210, 555, 345, 68);
    self.LindyCertificates_btn.frame=CGRectMake(210, 729, 345, 68);
    
}

-(void)Landscape
{
    self.Bg_image.frame=CGRectMake(0, 0, 1024, 768);
    self.Bg_image.image=[UIImage imageNamed:@"Reporting_land.png"];
    self.LindyReporting_btn.frame=CGRectMake(502, 335, 348, 68);
    self.LindyCertificates_btn.frame=CGRectMake(504, 510, 345, 68);
}





#pragma mark - View lifecycle


-(void)viewDidAppear:(BOOL)animated

{
    
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait ||
        [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)
    {
        [self Portrait];
        
    }
    else
    {
        [self Landscape];
    }
   // self.navigationController.navigationBarHidden=NO;

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if(interfaceOrientation==UIInterfaceOrientationLandscapeRight || interfaceOrientation==UIInterfaceOrientationLandscapeLeft ||interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown)
    {
        if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        {
            [self Landscape];
            
        }
        
        if (interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            
            [self Landscape];
        }
        
        if (interfaceOrientation == UIInterfaceOrientationPortrait)
        {
            [self Portrait];
        }
        
        if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        { 
            
            [self Portrait];
        }
    }
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        
        [self Portrait];
        
    }
    else
    {
        
        [self Landscape];
    }
}



- (BOOL)shouldAutorotate
{
    return NO;
}


@end

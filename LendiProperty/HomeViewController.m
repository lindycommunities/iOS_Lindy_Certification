//
//  HomeViewController.m
//  LendiProperty
//
//  Created by Vinay D on 5/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "WebviewDisplayController.h"
#import "LindyReportingViewController.h"
@implementation HomeViewController
@synthesize BackGroundImage;
@synthesize EmpLogin_btn,Aboutus_btn,Contactus_btn,ApplyToday_btn,LindyPass_btn,SeniopLiv_btn,CorpoHous_btn,Studnthosin_btn;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
          self.title=@"Home";
                   
    }
    return self;
}
#pragma mark - Orientation Methods


-(void)ViewLandscape
{
    
    BackGroundImage.frame=CGRectMake(0,0, 1024, 768);
    
    self.BackGroundImage.image= [UIImage imageNamed:@"HomeView_Landscape.png"];
    
    self.Aboutus_btn.frame=CGRectMake(454, 5, 110, 110);
    
    self.Contactus_btn.frame=CGRectMake(647, 56, 110, 110);
    
    self.ApplyToday_btn.frame=CGRectMake(836, 111, 110, 110);
    
    self.EmpLogin_btn.frame=CGRectMake(832, 482, 110, 110);
    
    self.LindyPass_btn.frame=CGRectMake(646, 536, 110, 110);
    
    self.SeniopLiv_btn.frame=CGRectMake(454, 586, 110, 110);
    
    self.CorpoHous_btn.frame=CGRectMake(238, 597, 110, 110);
    
    self.Studnthosin_btn.frame=CGRectMake(32, 564, 110, 110);
    
}
-(void)ViewPortrait
{
    
    BackGroundImage.frame=CGRectMake(0,0, 768, 1024); 
    
    BackGroundImage.image= [UIImage imageNamed:@"Homeview_porital.png"];
    
    self.EmpLogin_btn.frame=CGRectMake(616, 602, 110, 110);
    
    self.Aboutus_btn.frame=CGRectMake(238, 95, 110, 110);
    
    self.Contactus_btn.frame=CGRectMake(421, 126, 110, 110);
    
    self.ApplyToday_btn.frame=CGRectMake(608, 192, 110, 110);
    
    self.LindyPass_btn.frame=CGRectMake(483, 657, 110, 110);
    
    self.SeniopLiv_btn.frame=CGRectMake(329, 698, 110, 110);
    
    self.CorpoHous_btn.frame=CGRectMake(180, 698, 110, 110);
    
    self.Studnthosin_btn.frame=CGRectMake(17, 690, 110, 110);
    
    
}
#pragma mark - App Methods

-(void)WebviewClcik:(id)sender
{
   
   /* Connection =[[NetworkConnection alloc]init];
    
    if(Connection.isReachable)
    {*/
        
        UIButton *temp =(UIButton *)sender;
        
        int btag=temp.tag;
        
        NSString *text;
        
        if (btag==1)
        {
            text=@"About Us";
        }
        else if(btag==2)
        {
            text=@"Contact Us";
        }
        else if(btag==3)
        {
            text=@"Apply Today";
        }
        else if(btag==4)
        {
            text=@"Apartment Search";
        }
        else if(btag==5)
        {
            text=@"Resident Login";
        }
        else if(btag==6)
        {
            text=@"Coporate Housing";
        }
        else if(btag==7)
        {
            text=@"Student Housing";
        }
    
    
        WebviewDisplayController *web_obj=[[WebviewDisplayController alloc]initWithButtonTag:temp.tag WithTitle:text];
        UINavigationController *nav_obj=[[UINavigationController alloc]initWithRootViewController:web_obj];
        [self.navigationController presentModalViewController:nav_obj animated:YES];
      //  [nav_obj release];
  
   /* }
    else
    {
        
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Please Check Your Internet Connection." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alt show];
        [alt release];
        
    }*/

}



-(void)EmpLoginbtn_click
{
    //Connection =[[NetworkConnection alloc]init];
    
    //if(Connection.isReachable)
   // {
      
      //  LindyReportingViewController *Lindy_Oj=[[LindyReportingViewController alloc]init];
        //[self.navigationController pushViewController:Lindy_Oj animated:YES];
    LoginViewController *objLoginVC = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:objLoginVC animated:YES];

   /* }
    else
    {
        
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Please Check Your Internet Connection." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alt show];
        [alt release];
        
    }
    */
    
    
 
}









#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(void)viewWillAppear:(BOOL)animated
{
    
    App_obj=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait)
    {
        [self ViewPortrait];
    }
    else if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)
    {
        App_obj.orientatioChk=@"PortraitUpsideDown";
        [self ViewPortrait];
    }
    else if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft)
    {
        
        App_obj.orientatioChk=@"LandscpeLeft";
        [self ViewLandscape];
        
    }
    else if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)
    {
        App_obj.orientatioChk=@"LandscpeRight";
        [self ViewLandscape];
    }

    
    
    
  //  [[self navigationController] setNavigationBarHidden:YES animated:YES];
   /* if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait ||
        [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)
    {
        [self ViewPortrait];
        
    }
    else
    {
        [self ViewLandscape];
    }*/

   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    App_obj=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
	if(interfaceOrientation==UIInterfaceOrientationLandscapeRight || interfaceOrientation==UIInterfaceOrientationLandscapeLeft ||interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown)
    {
        if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        {
            App_obj.orientatioChk=@"LandscpeLeft";
            [self ViewLandscape];
        }
        
        if (interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            App_obj.orientatioChk=@"LandscpeRight";
            [self ViewLandscape];
        }
        
        if (interfaceOrientation == UIInterfaceOrientationPortrait)
        {
                       
            [self ViewPortrait];
        }
        
        if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        { 
            App_obj.orientatioChk=@"PortraitUpsideDown";
            [self ViewPortrait];
        }
    }
    return YES;
}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
        App_obj=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
  
        if (toInterfaceOrientation == UIInterfaceOrientationPortrait)
        {
            [self ViewPortrait];
        }
        else if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            App_obj.orientatioChk=@"PortraitUpsideDown";
            [self ViewPortrait];
        }
        else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        {
            App_obj.orientatioChk=@"LandscpeLeft";
            [self ViewLandscape];

        }
        else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            App_obj.orientatioChk=@"LandscpeRight";
            [self ViewLandscape];
        }
    }



- (BOOL)shouldAutorotate
{
    return NO;
}


@end

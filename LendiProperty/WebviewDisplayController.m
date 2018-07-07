//
//  WebviewDisplayController.m
//  LendiProperty
//
//  Created by Vinay D on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebviewDisplayController.h"
#import "LendiPropertyAppDelegate.h"
@implementation WebviewDisplayController
@synthesize webview;
@synthesize spinnerView;
@synthesize spinnerlandscape;
@synthesize urlAddress_URL;
- (id)initWithButtonTag:(int)_tag WithTitle:(NSString *)_str
{
    self = [super init];
    if (self) 
    {
       
        self.title=_str;
        btag=_tag;
        
        
    }
    return self;
}
- (id)initWithURL:(NSString *)_url
{
    self = [super init];
    if (self)
    {
        
        self.title=_url;
        btag=555;
        urlAddress_URL=[[NSString alloc]init];
//        urlAddress=[NSString stringWithFormat:@"%@",_url];
//
//        NSLog(urlAddress);
        
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
#pragma mark - App Methods

-(void)LinkSelection
{
    if (btag==1)
    {
        
        urlAddress=@"http://www.lindyproperty.com/pages/about-lindy.html";
        url= [NSURL URLWithString:urlAddress];
        requestObj = [NSURLRequest requestWithURL:url];
        [webview loadRequest:requestObj];
        
    }
    else if(btag==2)
    {
        urlAddress=@"http://www.lindyproperty.com/contact-us.html";
        url= [NSURL URLWithString:urlAddress];
        requestObj = [NSURLRequest requestWithURL:url];
        [webview loadRequest:requestObj];
       
    }
    else if(btag==3)
    {
        urlAddress=@"https://www.i-rent-online.com/begin/38";
        url= [NSURL URLWithString:urlAddress];
        requestObj = [NSURLRequest requestWithURL:url];
        [webview loadRequest:requestObj];
       
    }
    else if(btag==4)
    {
        urlAddress=@"http://lindymanagement.prospectportal.com/Apartments/module/properties/";
        url= [NSURL URLWithString:urlAddress];
        requestObj = [NSURLRequest requestWithURL:url];
        [webview loadRequest:requestObj];
        
    }
    else if(btag==5)
    {
        urlAddress=@"https://lindymanagement.residentportal.com/resident_portal/?module=authentication&action=view_login";
        url= [NSURL URLWithString:urlAddress];
        requestObj = [NSURLRequest requestWithURL:url];
        [webview loadRequest:requestObj];
            }
    else if(btag==6)
    {
        urlAddress=@"http://www.lindyproperty.com/pages/corporate-suites.html";
        url= [NSURL URLWithString:urlAddress];
        requestObj = [NSURLRequest requestWithURL:url];
        [webview loadRequest:requestObj];
        
    }
    else if(btag==7)
    {
        urlAddress=@"http://www.lindyproperty.com/pages/student-housing.html";
        url= [NSURL URLWithString:urlAddress];
        requestObj = [NSURLRequest requestWithURL:url];
        [webview loadRequest:requestObj];
        
    }
    else if(btag==8)
    {
        
        
        urlAddress=@"http://linux.whitelakeinteractive.com/certificate-production/xadmin/login/";
        url= [NSURL URLWithString:urlAddress];
        requestObj = [NSURLRequest requestWithURL:url];
        [webview loadRequest:requestObj];
    }
    else if(btag==555)
    {
        
       // NSLog(urlAddress);

       // urlAddress=@"http://linux.whitelakeinteractive.com/certificate-production/xadmin/login/";
        url= [NSURL URLWithString:self.urlAddress_URL];
        requestObj = [NSURLRequest requestWithURL:url];
        [webview loadRequest:requestObj];
    }


}


-(void)backButtonClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
    [self.view release];
}




#pragma mark Webview Delegates

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if((btag==8) || (btag==555))
    {
        [self stopSpinnerforlandscape];
    }
    else
    {
        [self stopSpinner];
    }
    
    
   
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    
    
    [super viewDidLoad];
     self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
   
    
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    [barButton setTitle:@"Back"];
    [self.navigationItem setLeftBarButtonItem:barButton];
    [barButton release];
    
    
    if((btag==8) || (btag==555))
    {
        
        webview.frame=CGRectMake(0, 0, 1024, 1000);
        
        [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
        [self performSelector:@selector(LinkSelection) withObject:nil afterDelay:1.0];
    }
    else
    {
        webview.frame=CGRectMake(0, 0, 768, 1024);
        [self startSpinner:@"spinner" andDisplay:@"Loading.."];
        [self performSelector:@selector(LinkSelection) withObject:nil afterDelay:1.0];
    }
    
    
    
   
         
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
       
            if(btag==8 || btag==555)
            {
                if(interfaceOrientation==UIInterfaceOrientationLandscapeLeft ||interfaceOrientation==UIInterfaceOrientationLandscapeRight)
                {
                    return YES;
                }
                else
                {
                    return NO;
                }
                
            }
            else
            {
                if(interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown)
                {
                    return YES;
                }
               else
               {
                   return NO;
               }
            
            }
        
        
    

       
}

#pragma mark - Spinner Methods
//all spinners are modal on the app delegate to facilitate easy removal and blockage of all other view's buttons
-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display
{
    //remove any existing spinners at this point
    if(self.spinnerView){
        [self.spinnerView.view removeFromSuperview];
        self.spinnerView = nil;    
    }
    self.spinnerView =[[[SpinnerModal_iPad alloc]initWithType:type andDisplay:display]autorelease];
    //add this to the root view of the app
    //ViewManager *viewMgr = [ViewManager getManager];
    [self.view addSubview:self.spinnerView.view];
}

-(void) stopSpinner
{
    
    [self.spinnerView.view removeFromSuperview];
    self.spinnerView = nil;    
}
-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display
{
    //remove any existing spinners at this point
    if(self.spinnerlandscape){
        [self.spinnerlandscape.view removeFromSuperview];
        self.spinnerlandscape = nil;    
    }
    self.spinnerlandscape =[[[Spinner_iPad_Landscape  alloc]initWithType:type andDisplay:display]autorelease];
    //add this to the root view of the app
    //ViewManager *viewMgr = [ViewManager getManager];
    [self.view addSubview:self.spinnerlandscape.view];
}

-(void) stopSpinnerforlandscape

{
   
    [self.spinnerlandscape.view removeFromSuperview];
    self.spinnerlandscape= nil;    
}

@end

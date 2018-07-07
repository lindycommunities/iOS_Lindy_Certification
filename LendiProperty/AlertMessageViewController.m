//
//  AlertMessageViewController.m
//  LendiProperty
//
//  Created by Vinay D on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AlertMessageViewController.h"
#import "ParserClass.h"

@implementation AlertMessageViewController

@synthesize Cancle_btn,Send_btn;

@synthesize Message_txt;

@synthesize spinnerView;

- (id)init
{
    self = [super init];
    if (self) 
    {
        
       
        

        
        
        
    }
    return self;
}

#pragma mark - App Methods

-(void)SendAlert
{
    [self startSpinner:@"" andDisplay:@"Sending..."];
   
    if([Message_txt.text length]>0)
    {
        
        [self.Message_txt resignFirstResponder]; 
       
        
       app = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
     
    NSString *Message= [NSString stringWithFormat:@"%@ says %@",app.UserName,Message_txt.text];  
        
    NSString *temp_url=[NSString stringWithFormat:@"%@/addAlert_service/%@/%@/xml",MainUrl,app.strUserId,Message];
          
    NSURL *url = [[NSURL alloc]initWithString:[temp_url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
         [request setURL:url];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
        if(theConnection) {
        webData = [[NSMutableData data] retain];
        }
        else 
        {
        NSLog(@"theConnection is NULL");
        }
    }

}
-(void)CancleAlert
{
     [self.Message_txt resignFirstResponder];
    [self.navigationController dismissModalViewControllerAnimated:YES];
}






#pragma  mark - Connection Delegates

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
   
    [webData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
     
    [webData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self stopSpinner];
   
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Internet connection is down,please try again after some time." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];             
    [alertView show];
    [alertView release];
    
    [webData release];
    [connection release];

}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self stopSpinner];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Lindy Property" message:@"Your Message is Posted." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];             
    [alertView show];
    [alertView release];
    
    [webData release];
    [connection release];
    [self dismissModalViewControllerAnimated:YES];

}


#pragma mark - Textfield Delegates 

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	switch (textField.tag) 
    {
        case 1:
            return NO;
            break;
        default:
            return YES;
            break;
    }
}

#pragma mark - AlertView Methods

-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==1)
    {
        
        [self dismissModalViewControllerAnimated:YES];
    }
    
}
-(void)backButtonClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
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




#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
   {
       
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
            
    // Release any cached data, images, etc that aren't in use.
       
    }
        

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    NSString *version = [[UIDevice currentDevice] systemVersion];
    int ver_val = [version intValue];
    
    
    if(ver_val >=6.0 ){
        [[UIDevice currentDevice] setOrientation:UIDeviceOrientationPortrait];
    }

    
     self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
    
    self.title=@"Send Alert";
    
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    [barButton setTitle:@"Back"];
    [self.navigationItem setLeftBarButtonItem:barButton];
    [barButton release];

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
    
   return (interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown);    
    
}


@end

//
//  LoginViewController.m
//  LendiProperty
//
//  Created by Vinay Devdikar on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "IncidentReportViewController.h"
#import "SBJSON.h"
#import "LindyPropertyReportingViewController.h"
#import "LendiPropertyAppDelegate.h"
#import "LindyReportingViewController.h"
#import "LeasingAgentHomeViewController.h"
#import "LindyCertificateHomeViewController.h"
@implementation LoginViewController

@synthesize txtPassword,txtUserName;

@synthesize spinnerView;

@synthesize scrView;

@synthesize imgView;

@synthesize btnLogin,btnCancel;

@synthesize spinnerlandscape;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
    }
    return self;
}

-(void)RememeberMe
{
   if([txtUserName.text isEqualToString:[defaults_user stringForKey:@"username"]])
    {
        NSString *username = txtUserName.text;
        NSString *password = txtPassword.text;
        [defaults_user setObject:username forKey:@"username"];
        [defaults_pass setObject:password forKey:@"password"];
        
        [defaults_user setValue:username forKey:@"username"];
        [defaults_pass setValue:password forKey:@"password"];
    }
    else
    {
        NSString *username = txtUserName.text;
        NSString *password = txtPassword.text;
        [defaults_user setObject:username forKey:@"username"];
        [defaults_pass setObject:password forKey:@"password"];
    }
  
    [defaults_user synchronize];
    [defaults_pass synchronize];
       
    
    
}
-(void)LoginTwo
{
    NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@login&user=%@&pass=%@",MainURL,self.txtUserName.text,self.txtPassword.text]];
    NSLog(@"%@",url);
    _flag=@"TWO";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(theConnection) {
        webData = [NSMutableData data];
    }
    else {
        
    }
   // [request release];
    //[theConnection release];

    
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
    // Do any additional setup after loading the view from its nib.
    self.title = @"Login";
    self.scrView.scrollEnabled = NO;
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    self.btnLogin.backgroundColor=[UIColor redColor];
//    self.btnCancel.backgroundColor=[UIColor greenColor];

//    self.view.backgroundColor = [UIColor colorWithRed:(float)(255.00/255) green:(float)(204.00/255) blue:(float)(153.00/255) alpha:1];
    defaults_user = [NSUserDefaults standardUserDefaults];
    defaults_pass = [NSUserDefaults standardUserDefaults];
    NSString *struser=[defaults_user stringForKey:@"username"];
     NSString *strpass=[defaults_pass stringForKey:@"password"];
    self.txtUserName.text=struser;//@"Nausher";//
    self.txtPassword.text=strpass;//@"test";//strpass;
    
#if TARGET_IPHONE_SIMULATOR
    
    self.txtUserName.text=@"lindy";//
    self.txtPassword.text=@"frank";//strpass;
  //  self.txtUserName.text=@"shivkumar";//
   // self.txtPassword.text=@"123456";//strpass;

    
#else 
    
#endif
    
    //self.txtUserName.text=@"Nausher";//
    //self.txtPassword.text=@"test";//strpass;
   
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;

}




-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
    
       
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft)
    {
        objApp.strOriantation = @"LandscapeLeft";
        //            self.scrView.scrollEnabled = YES;
        [self rotatingLandscape];
        Landscapebool=YES;
        objApp.orientatioChk=@"LandscpeLeft";
        
    }
    
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)
    {
        objApp.strOriantation = @"LandscapeRight";
        //            self.scrView.scrollEnabled = YES;
        [self rotatingLandscape];
        Landscapebool=YES;
        objApp.orientatioChk=@"LandscpeRight";
        
    }
    
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait)
    {
        objApp.strOriantation = @"Portrait";
        //            self.scrView.scrollEnabled = NO;
        [self rotatingPotrait];
        Landscapebool=NO;
        
        
    }
    
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)
    {
        objApp.strOriantation = @"PortraitUpsideDown";
        //            self.scrView.scrollEnabled = NO;
        [self rotatingPotrait];
        Landscapebool=NO;
        objApp.orientatioChk=@"PortraitUpsideDown";
    }

    
    
    // Register for the events
    [[NSNotificationCenter defaultCenter]
                        addObserver:self
                            selector:@selector (keyboardDidShow:)
             	                name: UIKeyboardDidShowNotification
             	                object:nil];
    
    	    [[NSNotificationCenter defaultCenter]
                             addObserver:self
                             selector:@selector (keyboardDidHide:)
             	                name: UIKeyboardDidHideNotification
             	                object:nil];
    	 
    	 
    //Initially the keyboard is hidden
    keyboardVisible = NO;
}
	 
-(void) viewWillDisappear:(BOOL)animated
{
    	  
    	    [[NSNotificationCenter defaultCenter]
             	                removeObserver:self];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if(interfaceOrientation==UIInterfaceOrientationLandscapeRight || interfaceOrientation==UIInterfaceOrientationLandscapeLeft ||interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown)
    {
        if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        {
            objApp.strOriantation = @"LandscapeLeft";
//            self.scrView.scrollEnabled = YES;
            [self rotatingLandscape];
            Landscapebool=YES;
            objApp.orientatioChk=@"LandscpeLeft";
            
        }
        
        if (interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            objApp.strOriantation = @"LandscapeRight";
//            self.scrView.scrollEnabled = YES;
            [self rotatingLandscape];
            Landscapebool=YES;
            objApp.orientatioChk=@"LandscpeRight";
           
        }
        
        if (interfaceOrientation == UIInterfaceOrientationPortrait)
        {
            objApp.strOriantation = @"Portrait";
//            self.scrView.scrollEnabled = NO;
            [self rotatingPotrait];
            Landscapebool=NO;

            
        }
        
        if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        { 
            objApp.strOriantation = @"PortraitUpsideDown";
//            self.scrView.scrollEnabled = NO;
            [self rotatingPotrait];
            Landscapebool=NO;
             objApp.orientatioChk=@"PortraitUpsideDown";
        }
    }
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
    {
        objApp.strOriantation = @"LandscapeLeft";
        //            self.scrView.scrollEnabled = YES;
        [self rotatingLandscape];
        Landscapebool=YES;
        objApp.orientatioChk=@"LandscpeLeft";
        
    }
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        objApp.strOriantation = @"LandscapeRight";
        //            self.scrView.scrollEnabled = YES;
        [self rotatingLandscape];
        Landscapebool=YES;
        objApp.orientatioChk=@"LandscpeRight";
        
    }
    
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait)
    {
        objApp.strOriantation = @"Portrait";
        //            self.scrView.scrollEnabled = NO;
        [self rotatingPotrait];
        Landscapebool=NO;
        
        
    }
    
    if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        objApp.strOriantation = @"PortraitUpsideDown";
        //            self.scrView.scrollEnabled = NO;
        [self rotatingPotrait];
        Landscapebool=NO;
        objApp.orientatioChk=@"PortraitUpsideDown";
    }
}



- (BOOL)shouldAutorotate
{
    return NO;
}


#pragma mark- App Methods

-(IBAction)login:(id)sender
{
    _flag=[[NSString alloc]init];
    /*LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
      objApp.UserName=txtUserName.text;
    

    LindyPropertyReportingViewController *objPropertyReortVC = [[LindyPropertyReportingViewController alloc]init];
     [self.navigationController pushViewController:objPropertyReortVC animated:YES];*/
    

    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if (self.txtUserName.text.length > 0 && self.txtPassword.text.length > 0)
    {
        
        if (Landscapebool==YES)
        {       
        [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
            spinnerisruning=YES;
        }
        else 
        {
            [self startSpinner:@"spinner" andDisplay:@"Login.."]; 
            spinnerisruning=YES;
        }
        objApp.strUserName = self.txtUserName.text;
        
        [self.txtPassword resignFirstResponder];
        [self.txtUserName resignFirstResponder];
        
        //http://75.147.113.169/lindiproperty/index.php/lindiproperty/login_service/nausher/test/json
        
        /*
        NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@/login_service/%@/%@/json",MainUrl,self.txtUserName.text,self.txtPassword.text]];
        _flag=@"ONE";
        NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
        [request setURL:url];
        
        NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

        if(theConnection) {
            webData = [[NSMutableData data] retain];
        }
        else {
         
        }*/
        [self LoginTwo];

    } 
    else
    {
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Please Fill All Information.." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alt show];
    }
}



-(void) keyboardDidShow: (NSNotification *)notif 
{
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    // If keyboard is visible, return
    if (keyboardVisible) 
    {
       
        return;
    }
        
    if ([objApp.strOriantation isEqualToString:@"LandscapeRight"] || [objApp.strOriantation isEqualToString:@"LandscapeLeft"])
    {
        [self.scrView scrollRectToVisible:CGRectMake(0, 300, 1024, 768) animated:YES];
    }    

    
   
    // Keyboard is now visible
    keyboardVisible = YES;
}

-(void) keyboardDidHide: (NSNotification *)notif 
{
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];

    // Is the keyboard already shown
    if (!keyboardVisible)
    {
        
        return;
    }
     
    // Reset the frame scroll view to its original value
    if ([objApp.strOriantation isEqualToString:@"LandscapeRight"] || [objApp.strOriantation isEqualToString:@"LandscapeLeft"])
    {
        [self.scrView scrollRectToVisible:CGRectMake(0, 0, 1024, 768) animated:YES];
    }    
    self.scrView.scrollEnabled = NO;

    keyboardVisible = NO;
}



-(IBAction)cancel:(id)sender
{
    
}




-(void) rotatingPotrait
{
    self.imgView.frame = CGRectMake(0, 0, 768, 1024);
    self.imgView.image = [UIImage imageNamed:@"portrait.png"];
    self.scrView.frame = CGRectMake(0, 0, 768, 1024);
    self.scrView.contentSize = CGSizeMake(768, 1024);
    self.txtUserName.frame = CGRectMake(155, 588, 221, 38);
    self.txtPassword.frame = CGRectMake(414, 588, 231, 38);
    self.btnCancel.frame = CGRectMake(268, 658, 106, 42);
    self.btnLogin.frame = CGRectMake(414, 658, 106, 42);
    
    if (spinnerisruning ==YES)
    {
        spinnerisruning=NO;
        [self stopSpinnerforlandscape];
       [self startSpinner:@"spinner" andDisplay:@"Login.."]; 
    }
    
}

-(void) rotatingLandscape
{
    self.imgView.frame = CGRectMake(0, 0, 1024, 768);
    self.imgView.image = [UIImage imageNamed:@"Landscape1.png"];
    self.scrView.frame = CGRectMake(0, 0, 1024, 768);
    self.scrView.contentSize = CGSizeMake(1024, 1000);
    self.txtUserName.frame = CGRectMake(432, 457, 221, 38);
    self.txtPassword.frame = CGRectMake(692, 457, 231, 38);
    self.btnLogin.frame = CGRectMake(692,528,106,42);
    self.btnCancel.frame = CGRectMake(550,528,106,42);
    if (spinnerisruning ==YES)
    {
    [self stopSpinner];
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
    }
}



#pragma mark- UITextField Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];

    [textField resignFirstResponder];
    if ([objApp.strOriantation isEqualToString:@"LandscapeRight"] || [objApp.strOriantation isEqualToString:@"LandscapeLeft"])
    {
        self.scrView.scrollEnabled = NO;
        [self.scrView scrollRectToVisible:CGRectMake(0, 0, 1024, 768) animated:YES];
    }    

    return YES;
}



-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if ([objApp.strOriantation isEqualToString:@"LandscapeRight"] || [objApp.strOriantation isEqualToString:@"LandscapeLeft"])
    {
        self.scrView.scrollEnabled = YES;

        [self.scrView scrollRectToVisible:CGRectMake(0, 300, 1024, 768) animated:YES];
    }    
    return YES;
}

-(BOOL)disablesAutomaticKeyboardDismissal
{
    return YES;
}



#pragma mark - NSURLConnectionDelegate Methods...

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
    NSLog(@"%@",[error description]);
    if(Landscapebool==YES)
    {
        [self stopSpinnerforlandscape];
    }
    else 
    {
        [self stopSpinner];

    }
    
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Lindy Property" message:@"Internet connection is down,please try again after some time." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];             
    [alertView show];
   
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   
    NSString *jsonStr = [[NSString alloc] 
                         initWithData:webData                         
                         encoding:NSASCIIStringEncoding];
    //---shows the XML---
   
    
    if(jsonStr)
    {        
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary *jsondic = [parser objectWithString:jsonStr];    
       NSString *str = [NSString stringWithFormat:@"%@",[jsondic valueForKey:@"success"]];
        
        if ([str isEqualToString:@"1"] && [_flag isEqualToString:@"ONE"])
        {
            
            
            [self RememeberMe];
            LendiPropertyAppDelegate  *app = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
            
            NSArray *components = [jsonStr componentsSeparatedByString:@","];
            NSArray *uidarray=[[components objectAtIndex:1] componentsSeparatedByString:@":"];
            NSArray *finalId=[[uidarray objectAtIndex:2] componentsSeparatedByString:@"\""];
            
            
            app.strUserId=[finalId objectAtIndex:1];
            app.UserName=txtUserName.text;
            [self LoginTwo];
        }
        else if ([str isEqualToString:@"1"]&& [_flag isEqualToString:@"TWO"])
        {
            NSDictionary *jsondic1 = [jsondic objectForKey:@"result"];
            NSString *str = [NSString stringWithFormat:@"%@",[jsondic1 valueForKey:@"roleAID"]];
            NSLog(@"%@",str);
            [[NSUserDefaults standardUserDefaults]setObject:str forKey:@"roleAID"];
            
            NSString *userID = [NSString stringWithFormat:@"%@",[jsondic1 valueForKey:@"userID"]];
            NSLog(@"%@",userID);
            [[NSUserDefaults standardUserDefaults]setObject:userID forKey:@"userID"];

            
            [[NSUserDefaults standardUserDefaults]synchronize];
//            [defaults_user setObject:username forKey:@"username"];

            
            if(Landscapebool==YES)
            {
                [self stopSpinnerforlandscape];
            }
            else
            {
                [self stopSpinner];
                
            }
            if(Landscapebool==YES)
            {
                spinnerisruning=NO;
                [self stopSpinnerforlandscape];
            }
            else
            {
                spinnerisruning=NO;
                [self stopSpinner];
                
            }
            if([str isEqualToString:@"4"]){
                
                LeasingAgentHomeViewController *Lindy_Oj=[[LeasingAgentHomeViewController alloc]init];
                [self.navigationController pushViewController:Lindy_Oj animated:YES];

            }
            else if([str isEqualToString:@"9"]){
                
                LindyCertificateHomeViewController  * main = [[LindyCertificateHomeViewController alloc]init];
                [self.navigationController pushViewController:main animated:YES];

                
            }
            else{
                
                LindyReportingViewController *Lindy_Oj=[[LindyReportingViewController alloc]init];
                [self.navigationController pushViewController:Lindy_Oj animated:YES];

            }
            

        }
        else
        {
            if(Landscapebool==YES)
            {
                [self stopSpinnerforlandscape];
            }
            else
            {
                [self stopSpinner];
                
            }
            if(Landscapebool==YES)
            {
                spinnerisruning=NO;
                [self stopSpinnerforlandscape];
            }
            else
            {
                spinnerisruning=NO;
                [self stopSpinner];
                
            }

            UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Login Failed.. Please Enter Correct User Name and Password.." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alt show];

        }
        
                        
           
            
                       
           // LindyPropertyReportingViewController *objPropertyReortVC = [[LindyPropertyReportingViewController alloc]init];
            
         //  / [self.navigationController pushViewController:objPropertyReortVC animated:YES];
            
            //[objPropertyReortVC release];
            
           
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
    self.spinnerView =[[SpinnerModal_iPad alloc]initWithType:type andDisplay:display];
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
    self.spinnerlandscape =[[Spinner_iPad_Landscape  alloc]initWithType:type andDisplay:display];
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

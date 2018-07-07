//
//  SavedIRViewController.m
//  LendiProperty
//
//  Created by Vinay Devdikar on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SavedIRViewController.h"
#import "ParserClass.h"

@implementation SavedIRViewController

@synthesize txtResidentName,txtAPT,txtPhone,txtPreparedBy,txtWitness,txtAddress,txtPhone1,txtPhone2,txtPhone3,txtPhone4,txtPhone5;

@synthesize txtViewDesc;

@synthesize scrView;

@synthesize spinnerView;

@synthesize Propertylabel;

- (id)initWithReportID:(int)_Rid WithUserName:(NSString *)_Username
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        classObj = [[ParserClass alloc]init];
        Reportid=_Rid;
        UserName=_Username;
        
        
        
    }
    return self;
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
    
    NSString *version = [[UIDevice currentDevice] systemVersion];
    int ver_val = [version intValue];
    
    
    if(ver_val >=6.0 ){
        [[UIDevice currentDevice] setOrientation:UIDeviceOrientationPortrait];
    }

    
    // Do any additional setup after loading the view from its nib.
     self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
    self.title = @"Saved Incident Report";
    
    [self setFrame];
    
    [self startSpinner:@"spinner" andDisplay:@"Loading.."];
    
    
    
    NSString *temp_url=[NSString stringWithFormat:@"%@getIncidentDetails&report_id=%d",SecondUrl,Reportid];
    
    NSURL *url = [[NSURL alloc]initWithString:[temp_url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:url];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(theConnection)
    {
        webData = [[NSMutableData data] retain];
    }
    else 
    {
        
    }

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
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


#pragma mark- App Method
-(void) setFrame
{
    
    
    self.txtResidentName.borderStyle = UITextBorderStyleNone;
    self.txtAPT.borderStyle = UITextBorderStyleNone;
    self.txtPhone.borderStyle = UITextBorderStyleNone;
    self.txtPreparedBy.borderStyle = UITextBorderStyleNone;
    self.txtWitness.borderStyle = UITextBorderStyleNone;
    self.txtAddress.borderStyle = UITextBorderStyleNone;
    self.txtPhone1.borderStyle = UITextBorderStyleNone;
    
    
    self.txtResidentName.frame = CGRectMake(334,227, 372, 40);
    self.txtAPT.frame = CGRectMake(136, 309, 253, 40);
    //self.txtPhone.frame = CGRectMake(528, 309, 204, 40);
    self.txtPreparedBy.frame = CGRectMake(335, 738, 373, 40);
    self.txtWitness.frame = CGRectMake(335, 819, 373, 40);
    self.txtAddress.frame = CGRectMake(181, 897, 215, 40);
    //self.txtPhone1.frame = CGRectMake(530, 897, 197, 40);
}

-(IBAction)ViewImages
{
    InclementWeatherReportPhotoViewController *obj_photo=[[InclementWeatherReportPhotoViewController alloc]initWithParserObj:classObj WithReportId:Reportid WithRporttype:@"incident_report"];
    [self.navigationController pushViewController:obj_photo animated:YES];
    
}

-(void)setData
{
    
    [self stopSpinner];
    
    self.Propertylabel.text = classObj.strIRProperty;
    self.txtResidentName.text = classObj.strIRResiName;
    self.txtAPT.text = classObj.strIRAPT;
    self.txtViewDesc.text = classObj.strIRDesc;
    self.txtPreparedBy.text = classObj.strIRPreparedBy;
    self.txtWitness.text = classObj.strIRWitness;
    self.txtAddress.text = classObj.strIRAddress;
    self.txtPhone1.text = classObj.strIRPhone1;
    
    
    NSString *Phone_str = classObj.strIRPhone;
    NSArray *PhoneItems = [Phone_str componentsSeparatedByString:@"-"];
    self.txtPhone.text =  [PhoneItems objectAtIndex:0];
    self.txtPhone2.text=  [PhoneItems objectAtIndex:1];
    self.txtPhone3.text=  [PhoneItems objectAtIndex:2];
    
    NSString *Phone1_str = classObj.strIRPhone1;
    NSArray *Phone1Items = [Phone1_str componentsSeparatedByString:@"-"];
    self.txtPhone1.text =  [Phone1Items objectAtIndex:0];
    self.txtPhone4.text=   [Phone1Items objectAtIndex:1];
    self.txtPhone5.text=   [Phone1Items objectAtIndex:2];
}


#pragma mark- UITextField Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self.scrView scrollRectToVisible:CGRectMake(0, 0, 768, 1004) animated:YES];
    
    return YES;
}



-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}


#pragma mark- UITextView Delegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
	return NO;
}

#pragma mark - Connection Delegates

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
    // [self stopSpinner];
    
    NSString *jsonStr = [[NSString alloc] 
                         initWithData:webData                         
                         encoding:NSASCIIStringEncoding];
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    
    NSDictionary *jsondic = [parser objectWithString:jsonStr];    
    
    NSString *str = [NSString stringWithFormat:@"%@",[jsondic valueForKey:@"success"]];
    
    if ([str isEqualToString:@"1"])
    {
        
        NSDictionary *dic =[jsondic valueForKey:@"result"];
        
        
        classObj.strIRProperty=[dic valueForKey:@"property_name"];
        NSLog(@"%@",classObj.strIRProperty);
        
        classObj.strIRResiName=[dic valueForKey:@"resident_name"];
        classObj.strIRAPT=[dic valueForKey:@"apt"];
        classObj.strIRDesc=[dic valueForKey:@"description"];
        classObj.strIRPreparedBy=[dic valueForKey:@"prepared_by"];
        classObj.strIRWitness=[dic valueForKey:@"witness"];
        classObj.strIRAddress=[dic valueForKey:@"adress"];
        classObj.strIRPhone1=[dic valueForKey:@"phone1"];
        classObj.strIRPhone=[dic valueForKey:@"phone"];
        classObj.CreationDate=[dic valueForKey:@"creation_date"];
        //classObj.User_ID=[dic valueForKey:@"User_ID"];
        [self setData];
        
        
    }
    
    
    [webData release];
    [connection release];
    
    
}

#pragma mark - Spinner Methods

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display
{
    
    if(self.spinnerView)
    {
        [self.spinnerView.view removeFromSuperview];
        self.spinnerView = nil;    
    }
    self.spinnerView =[[[SpinnerModal_iPad alloc]initWithType:type andDisplay:display]autorelease];
    
    [self.view addSubview:self.spinnerView.view];
}

-(void) stopSpinner
{
    
    [self.spinnerView.view removeFromSuperview];
    self.spinnerView = nil;    
}


@end

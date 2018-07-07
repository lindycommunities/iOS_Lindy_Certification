//
//  InclemnetWeatherViewReportController.m
//  LendiProperty
//
//  Created by Vinay D on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InclemnetWeatherViewReportController.h"
#import "InclementWeatherReportPhotoViewController.h"

@implementation InclemnetWeatherViewReportController

@synthesize Date_txt,STime_txt,EndTime_txt,PropertyM_txt,Contractor_txt,MaintainacesS_txt,Phone_txt,Phone1_txt,Phone2_txt,SignDate_txt,Employe_txt,intial_txt,sign_txt,ActionTaken_txt;

@synthesize spinnerView;

- (id)initWithReportID:(int)_Rid WithUserName:(NSString *)_Username
{
    self = [super init];
    if (self) 
    {
        classObj = [[ParserClass alloc]init];
        Reportid=_Rid;
        UserName=_Username;
        
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
}

#pragma mark - App  Methods

-(void)ViewPhoto
{
    
      
    InclementWeatherReportPhotoViewController *obj_photo=[[InclementWeatherReportPhotoViewController alloc]initWithParserObj:classObj WithReportId:Reportid WithRporttype:@"inclement_weather_report"];
    [self.navigationController pushViewController:obj_photo animated:YES];
   
}


-(void)setData

{
    
    [self stopSpinner];
    
    Date_txt.text=classObj.CreationDate;
    STime_txt.text=classObj.StartTime;
    EndTime_txt.text=classObj.EndTime;
    PropertyM_txt.text=classObj.PropertyManager;
    Contractor_txt.text=classObj.Contractor;
    MaintainacesS_txt.text=classObj.MaintancesSuper;
    SignDate_txt.text=classObj.SignDate;
    Employe_txt.text=classObj.EmployeeName;
    intial_txt.text=classObj.Intials;
    sign_txt.text=classObj.UserID;
    ActionTaken_txt.text=classObj.ActionTaken;
    NSString *Phone_str = classObj.Phoneno;
    NSArray *PhoneItems = [Phone_str componentsSeparatedByString:@"-"];
       
    Phone_txt.text=[PhoneItems objectAtIndex:0];
    Phone1_txt.text=[PhoneItems objectAtIndex:1];
    Phone2_txt.text=[PhoneItems objectAtIndex:2];

    
    
    
}




#pragma mark - TextField  Delegates

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
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

    
    self.title = @"Saved Inclement Weather Report";
          
    self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
    [self startSpinner:@"spinner" andDisplay:@"Loading..."];
    
    
    NSString *temp_url=[NSString stringWithFormat:@"%@getInclementDetails&report_id=%d",SecondUrl,Reportid];
    
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
  /*  Date_txt.editing=NO;
    
    STime_txt
    EndTime_txt
    PropertyM_txt
    Contractor_txt
    MaintainacesS_txt
    Phone_txt
    Phone1_txt
    Phone2_txt
    SignDate_txt
    Employe_txt
    intial_txt
    sign_txt
    ActionTaken_txt*/
        
   
    
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
    if(interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown)
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
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
        
        
        
        classObj.CreationDate=[dic valueForKey:@"creation_date"];
        classObj.StartTime=[dic valueForKey:@"start_time"];
        classObj.EndTime=[dic valueForKey:@"end_time"];
        classObj.PropertyManager=[dic valueForKey:@"property_manager"];
        classObj.Contractor=[dic valueForKey:@"contractor"];
        classObj.MaintancesSuper=[dic valueForKey:@"maintances_super"];
        classObj.SignDate=[dic valueForKey:@"sign_date"];
        classObj.EmployeeName=[dic valueForKey:@"employee_name"];
        classObj.Intials=[dic valueForKey:@"intials"];
        classObj.UserID=[dic valueForKey:@"sign"];
        classObj.ActionTaken=[dic valueForKey:@"action_taken"];
        classObj.Phoneno=[dic valueForKey:@"phone_no"];
        
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

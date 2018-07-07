//
//  SavedPMViewController.m
//  LendiProperty
//
//  Created by Vinay Devdikar on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SavedPMViewController.h"
#import "ParserClass.h"
#import "SBJSON.h"

@implementation SavedPMViewController

@synthesize scrView;

@synthesize Username_lab,Date_lab;

@synthesize imgView0,imgView1,imgView2,imgView3,imgView4,imgView5,imgView6,imgView7,imgView8,imgView9,imgView10,imgView11,imgView12,imgView13,imgView14,imgView15,imgView16,imgView17,imgView18,imgView19,imgView20,imgView21,imgView22;

@synthesize spinnerView;

- (id)initWithReportID:(int)_Rid WithUserName:(NSString *)_Username
{
    self = [super init];
    if (self) 
    {
      
        classObj =[[ParserClass alloc]init];
        UserName=_Username;
        Reportid=_Rid;
        
        
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

-(void)SetData
{
    [self stopSpinner];
    
    Username_lab.text=[NSString stringWithFormat:@"Created by : %@",UserName];
    Date_lab.text= [NSString stringWithFormat:@"Date : %@",classObj.CreationDate];
    
      
    if (classObj.column1 == 1)
    {
        self.imgView0.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView0.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column2 == 1)
    {
        self.imgView1.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView1.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column3 == 1)
    {
        self.imgView2.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView2.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column4 == 1)
    {
        self.imgView3.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView3.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column5 == 1)
    {
        self.imgView4.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView4.image = [UIImage imageNamed:@"uncheck.png"];
    }     
    
    if (classObj.column6 == 1)
    {
        self.imgView5.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView5.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column7 == 1)
    {
        self.imgView6.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView6.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column8 == 1)
    {
        self.imgView7.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView7.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column9 == 1)
    {
        self.imgView8.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView8.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column10 == 1)
    {
        self.imgView9.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView9.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column11 == 1)
    {
        self.imgView10.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView10.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column12 == 1)
    {
        self.imgView11.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView11.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column13 == 1)
    {
        self.imgView12.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView12.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column14 == 1)
    {
        self.imgView13.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView13.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column15 == 1)
    {
        self.imgView14.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView14.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column16 == 1)
    {
        self.imgView15.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView15.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column17 == 1)
    {
        self.imgView16.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView16.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column18 == 1)
    {
        self.imgView17.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView17.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column19 == 1)
    {
        self.imgView18.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView18.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column20 == 1)
    {
        self.imgView19.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView19.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column21 == 1)
    {
        self.imgView20.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView20.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column22 == 1)
    {
        self.imgView21.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView21.image = [UIImage imageNamed:@"uncheck.png"];
    }
    
    if (classObj.column23 == 1)
    {
        self.imgView22.image = [UIImage imageNamed:@"check.png"];
    }
    else
    {
        self.imgView22.image = [UIImage imageNamed:@"uncheck.png"];
    }

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

    self.scrView.contentSize = CGSizeMake(768, 1250);
    self.scrView.scrollEnabled = YES;
    
    self.title=@"Saved Property Manager Report";
    
    [self startSpinner:@"spinner" andDisplay:@"Loading.."];
    
    
    NSString *temp_url=[NSString stringWithFormat:@"%@getPropertyDetails&report_id=%d",SecondUrl,Reportid];
    
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

    
      
    
    app = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
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
    //[self stopSpinner];
    
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
           
       
        
        classObj.column1=[[dic valueForKey:@"column1"]intValue];
        classObj.column2=[[dic valueForKey:@"column2"]intValue];
        classObj.column3=[[dic valueForKey:@"column3"]intValue];
        classObj.column4=[[dic valueForKey:@"column4"]intValue];
        classObj.column5=[[dic valueForKey:@"column5"]intValue];
        classObj.column6=[[dic valueForKey:@"column6"]intValue];
        classObj.column7=[[dic valueForKey:@"column7"]intValue];
        classObj.column8=[[dic valueForKey:@"column8"]intValue];
        classObj.column9=[[dic valueForKey:@"column9"]intValue];
        classObj.column10=[[dic valueForKey:@"column10"]intValue];
        classObj.column11=[[dic valueForKey:@"column11"]intValue];
        classObj.column12=[[dic valueForKey:@"column12"]intValue];
        classObj.column13=[[dic valueForKey:@"column13"]intValue];
        classObj.column14=[[dic valueForKey:@"column14"]intValue];
        classObj.column15=[[dic valueForKey:@"column15"]intValue];
        classObj.column16=[[dic valueForKey:@"column16"]intValue];
        classObj.column17=[[dic valueForKey:@"column17"]intValue];
        classObj.column18=[[dic valueForKey:@"column18"]intValue];
        classObj.column19=[[dic valueForKey:@"column19"]intValue];
        classObj.column20=[[dic valueForKey:@"column20"]intValue];
        classObj.column21=[[dic valueForKey:@"column21"]intValue];
        classObj.column22=[[dic valueForKey:@"column22"]intValue];
        classObj.column23=[[dic valueForKey:@"column23"]intValue];
        classObj.CreationDate=[dic valueForKey:@"creation_date"];
        //classObj.User_ID=[dic valueForKey:@"User_ID"];
        [self SetData];
        
    
    }
    
    
    [webData release];
    [connection release];
   
    
}

#pragma mark - Spinner Methods

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display
{
    
    if(self.spinnerView){
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

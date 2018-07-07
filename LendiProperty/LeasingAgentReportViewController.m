//
//  LeasingAgentReportViewController.m
//  LendiProperty
//
//  Created by Vinay D on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LeasingAgentReportViewController.h"
#import "LendiPropertyAppDelegate.h"

@implementation LeasingAgentReportViewController

@synthesize Leasing_Scroll;

@synthesize spinnerView;

@synthesize Img_View01,Img_View02,Img_View03,Img_View04,Img_View05,Img_View06,Img_View07,Img_View08,Img_View09,Img_View10,Img_View11,Img_View12,Img_View13,Img_View14,Img_View15,Img_View16,Img_View17,Img_View18,Img_View19,Img_View20,Img_View21,Img_View22,Img_View23,Img_View24,Img_View25,Img_View26,Img_View27,Img_View28,Img_View29,Img_View30,Img_View31,Img_View32,Img_View33,Img_View34,Img_View35,Img_View36,Img_View37,Img_View38,Img_View39;

- (id)initWithReportID:(int)_Rid WithUserName:(NSString *)_Username;
{
    self = [super init];
    if (self)
    {
        
        //Obj_parser=(ParserClass *)_objParser;
        Obj_parser =[[ParserClass alloc]init];
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

#pragma mark - Apps Methods

-(void)setData

{
    
    [self stopSpinner];
    
    if(Obj_parser.column1==1)
    {
        [Img_View01 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column2==1)
    {
        [Img_View02 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column3==1)
    {
        [Img_View03 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column4==1)
    {
        [Img_View04 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column5==1)
    {
        [Img_View05 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column6==1)
    {
        [Img_View06 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column7==1)
    {
        [Img_View07 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column8==1)
    {
        [Img_View08 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column9==1)
    {
        [Img_View09 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column10==1)
    {
        [Img_View10 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column11==1)
    {
        [Img_View11 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column12==1)
    {
        [Img_View12 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column13==1)
    {
        [Img_View13 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column14==1)
    {
        [Img_View14 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column15==1)
    {
        [Img_View15 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column16==1)
    {
        [Img_View16 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column17==1)
    {
        [Img_View17 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column18==1)
    {
        [Img_View18 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column19==1)
    {
        [Img_View19 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column20==1)
    {
        [Img_View20 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column21==1)
    {
        [Img_View21 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column22==1)
    {
        [Img_View22 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column23==1)
    {
        [Img_View23 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column24==1)
    {
        [Img_View24 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column25==1)
    {
        [Img_View25 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column26==1)
    {
        [Img_View26 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column27==1)
    {
        [Img_View27 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column28==1)
    {
        [Img_View28 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column29==1)
    {
        [Img_View29 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column30==1)
    {
        [Img_View30 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column31==1)
    {
        [Img_View31 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column32==1)
    {
        [Img_View32 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column33==1)
    {
        [Img_View33 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column34==1)
    {
        [Img_View34 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column35==1)
    {
        [Img_View35 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column36==1)
    {
        [Img_View36 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column37==1)
    {
        [Img_View37 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column38==1)
    {
        [Img_View38 setImage:[UIImage imageNamed:@"check.png"]];
    }
    if(Obj_parser.column39==1)
    {
        [Img_View39 setImage:[UIImage imageNamed:@"check.png"]];
    }

}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *version = [[UIDevice currentDevice] systemVersion];
    int ver_val = [version intValue];
    
    
//    if(ver_val >=6.0 ){
//        [[UIDevice currentDevice] setOrientation:UIDeviceOrientationPortrait];
//    }

    
    self.Leasing_Scroll.contentSize=CGSizeMake(768, 2500);
    
     self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
   self.title=@"Saved Leasing Agent Report";
    
    [self startSpinner:@"spinner" andDisplay:@"Loading.."];
    
    
    
    NSString *temp_url=[NSString stringWithFormat:@"%@getLeasingDetails&report_id=%d",SecondUrl,Reportid];
    
    NSURL *url = [[NSURL alloc]initWithString:[temp_url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(theConnection)
    {
        webData = [NSMutableData data];
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
//    [alertView release];
//    
//    [webData release];
//    [connection release];
    
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
        
       
        
        Obj_parser.column1=[[dic valueForKey:@"column1"]intValue];
        Obj_parser.column2=[[dic valueForKey:@"column2"]intValue];
        Obj_parser.column3=[[dic valueForKey:@"column3"]intValue];
        Obj_parser.column4=[[dic valueForKey:@"column4"]intValue];
        Obj_parser.column5=[[dic valueForKey:@"column5"]intValue];
        Obj_parser.column6=[[dic valueForKey:@"column6"]intValue];
        Obj_parser.column7=[[dic valueForKey:@"column7"]intValue];
        Obj_parser.column8=[[dic valueForKey:@"column8"]intValue];
        Obj_parser.column9=[[dic valueForKey:@"column9"]intValue];
        Obj_parser.column10=[[dic valueForKey:@"column10"]intValue];
        Obj_parser.column11=[[dic valueForKey:@"column11"]intValue];
        Obj_parser.column12=[[dic valueForKey:@"column12"]intValue];
        Obj_parser.column13=[[dic valueForKey:@"column13"]intValue];
        Obj_parser.column14=[[dic valueForKey:@"column14"]intValue];
        Obj_parser.column15=[[dic valueForKey:@"column15"]intValue];
        Obj_parser.column16=[[dic valueForKey:@"column16"]intValue];
        Obj_parser.column17=[[dic valueForKey:@"column17"]intValue];
        Obj_parser.column18=[[dic valueForKey:@"column18"]intValue];
        Obj_parser.column19=[[dic valueForKey:@"column19"]intValue];
        Obj_parser.column20=[[dic valueForKey:@"column20"]intValue];
        Obj_parser.column21=[[dic valueForKey:@"column21"]intValue];
        Obj_parser.column22=[[dic valueForKey:@"column22"]intValue];
        Obj_parser.column23=[[dic valueForKey:@"column23"]intValue];
        Obj_parser.column24=[[dic valueForKey:@"column24"]intValue];
        Obj_parser.column25=[[dic valueForKey:@"column25"]intValue];
        Obj_parser.column26=[[dic valueForKey:@"column26"]intValue];
        Obj_parser.column27=[[dic valueForKey:@"column27"]intValue];
        Obj_parser.column28=[[dic valueForKey:@"column28"]intValue];
        Obj_parser.column29=[[dic valueForKey:@"column29"]intValue];
        Obj_parser.column30=[[dic valueForKey:@"column30"]intValue];
        Obj_parser.column31=[[dic valueForKey:@"column31"]intValue];
        Obj_parser.column32=[[dic valueForKey:@"column32"]intValue];
        Obj_parser.column33=[[dic valueForKey:@"column33"]intValue];
        Obj_parser.column34=[[dic valueForKey:@"column34"]intValue];
        Obj_parser.column35=[[dic valueForKey:@"column35"]intValue];
        Obj_parser.column36=[[dic valueForKey:@"column36"]intValue];
        Obj_parser.column37=[[dic valueForKey:@"column37"]intValue];
        Obj_parser.column38=[[dic valueForKey:@"column38"]intValue];
        Obj_parser.column39=[[dic valueForKey:@"column39"]intValue];
        
        
        
        
        Obj_parser.CreationDate=[dic valueForKey:@"creation_date"];
        //classObj.User_ID=[dic valueForKey:@"User_ID"];
        [self setData];
        
        
    }
    
    
   // [webData release];
    //[connection release];
    
    
}

#pragma mark - Spinner Methods

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display
{
    
    if(self.spinnerView){
        [self.spinnerView.view removeFromSuperview];
        self.spinnerView = nil;    
    }
    self.spinnerView =[[SpinnerModal_iPad alloc]initWithType:type andDisplay:display];
    
    [self.view addSubview:self.spinnerView.view];
}

-(void) stopSpinner
{
    
    [self.spinnerView.view removeFromSuperview];
    self.spinnerView = nil;    
}



@end

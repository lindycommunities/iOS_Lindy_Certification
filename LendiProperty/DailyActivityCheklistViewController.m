//
//  DailyActivityCheklistViewController.m
//  LendiProperty
//
//  Created by Vinay D on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DailyActivityCheklistViewController.h"

@implementation DailyActivityCheklistViewController

@synthesize Leasing_Scroll;

@synthesize Img_View01,Img_View02,Img_View03,Img_View04,Img_View05,Img_View06,Img_View07,Img_View08,Img_View09,Img_View10,Img_View11,Img_View12,Img_View13,Img_View14,Img_View15,Img_View16,Img_View17,Img_View18,Img_View19,Img_View20,Img_View21,Img_View22,Img_View23,Img_View24,Img_View25;

@synthesize lab_01,lab_02,lab_03,lab_04,lab_05,lab_06,lab_07,lab_08,lab_09,lab_10,lab_11,lab_12,lab_13,lab_14,lab_15,lab_16,lab_17,lab_18,lab_19,lab_20,lab_21,lab_22,lab_23,lab_24,lab_25;

@synthesize checklistLabel,Maintain_lab;

@synthesize spinnerView;

@synthesize Propertypicker;

@synthesize pickerview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        
        Obj_parse=[[ParserClass alloc]init];
    }
    return self;
}



#pragma mark - App Methods

-(void)backButtonClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)chkbtnclick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    switch (btn.tag)
    {
        case 1:
            if (chkBox1 == NO)
            {
                chkBox1 = YES;
                Img_View01.image = [UIImage imageNamed:@"check.png"];
                Obj_parse.column1=1;
                
            }
            else
            {
                chkBox1 = NO;
                Img_View01.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column1=0;
            }
            break;
        case 2:
            if (chkBox2 == NO)
            {
                chkBox2 = YES;
                Img_View02.image = [UIImage imageNamed:@"check.png"];
                Obj_parse.column2=1;
                
            }
            else
            {
                chkBox2 = NO;
                Img_View02.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column2=0;
            }
            break;
        case 3:
            if (chkBox3 == NO)
            {
                chkBox3 = YES;
                Img_View03.image = [UIImage imageNamed:@"check.png"];
                Obj_parse.column3=1;
                
            }
            else
            {
                chkBox3 = NO;
                Img_View03.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column3=0;
            }
            break;
        case 4:
            if (chkBox4 == NO)
            {
                chkBox4 = YES;
                Img_View04.image = [UIImage imageNamed:@"check.png"];
                Obj_parse.column4=1;
            }
            else
            {
                chkBox4 = NO;
                Img_View04.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column4=0;
            }
            break;
        case 5:
            if (chkBox5 == NO)
            {
                chkBox5 = YES;
                Img_View05.image = [UIImage imageNamed:@"check.png"];
                    Obj_parse.column5=1;
            }
            else
            {
                chkBox5 = NO;
                Img_View05.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column5=0;
            }
            break;
        case 6:
            if (chkBox6 == NO)
            {
                chkBox6 = YES;
                Img_View06.image = [UIImage imageNamed:@"check.png"];
                    Obj_parse.column6=1;
            }
            else
            {
                chkBox6 = NO;
                Img_View06.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column6=0;
            }
            break;
        case 7:
            if (chkBox7 == NO)
            {
                chkBox7 = YES;
                Img_View07.image = [UIImage imageNamed:@"check.png"];
                    Obj_parse.column7=1;
            }
            else
            {
                chkBox7 = NO;
                Img_View07.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column7=0;
            }
            break;
        case 8:
            if (chkBox8 == NO)
            {
                chkBox8 = YES;
                Img_View08.image = [UIImage imageNamed:@"check.png"];
                    Obj_parse.column8=1;
            }
            else
            {
                chkBox8 = NO;
                Img_View08.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column8=0;
            }
            break;
        case 9:
            if (chkBox9 == NO)
            {
                chkBox9 = YES;
                Img_View09.image = [UIImage imageNamed:@"check.png"];
                    Obj_parse.column9=1;
            }
            else
            {
                chkBox9 = NO;
                Img_View09.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column9=0;
            }
            break;
        case 10:
            if (chkBox10 == NO)
            {
                chkBox10 = YES;
                Img_View10.image = [UIImage imageNamed:@"check.png"];
                    Obj_parse.column10=1;
            }
            else
            {
                chkBox10 = NO;
                Img_View10.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column10=0;
            }
            break;
        case 11:
            if (chkBox11 == NO)
            {
                chkBox11 = YES;
                Img_View11.image = [UIImage imageNamed:@"check.png"];
                Obj_parse.column11=1;
            }
            else
            {
                chkBox11 = NO;
                Img_View11.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column11=0;
            }
            break;
            
        case 12:
            if (chkBox12 == NO)
            {
                chkBox12 = YES;
                Img_View12.image = [UIImage imageNamed:@"check.png"];
                Obj_parse.column12=1;
            }
            else
            {
                chkBox12 = NO;
                Img_View12.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column12=0;
            }
            break;
        case 13:
            if (chkBox13 == NO)
            {
                chkBox13 = YES;
                Img_View13.image = [UIImage imageNamed:@"check.png"];
                Obj_parse.column13=1;
                
            }
            else
            {
                chkBox13 = NO;
                Img_View13.image = [UIImage imageNamed:@"uncheck.png"];
                Obj_parse.column13=0;
            }
            break;
        case 14:
            if (chkBox14 == NO)
            {
                chkBox14 = YES;
                Img_View14.image = [UIImage imageNamed:@"check.png"];
                Obj_parse.column14=1;
                
            }
            else
            {
                chkBox14 = NO;
                Img_View14.image = [UIImage imageNamed:@"uncheck.png"];
                 Obj_parse.column14=0;
            }
            break;
        case 15:
            if (chkBox15 == NO)
            {
                chkBox15 = YES;
                Img_View15.image = [UIImage imageNamed:@"check.png"];
                Obj_parse.column15=1;
                
            }
            else
            {
                chkBox15 = NO;
                Img_View15.image = [UIImage imageNamed:@"uncheck.png"];
                 Obj_parse.column15=0;
            }
            break;
            
        case 16:
            if (chkBox16 == NO)
            {
                chkBox16 = YES;
                Img_View16.image = [UIImage imageNamed:@"check.png"];
                 Obj_parse.column16=1;
                
            }
            else
            {
                chkBox16 = NO;
                Img_View16.image = [UIImage imageNamed:@"uncheck.png"];
                 Obj_parse.column16=0;
            }
            break;
        case 17:
            if (chkBox17 == NO)
            {
                chkBox17 = YES;
                Img_View17.image = [UIImage imageNamed:@"check.png"];
                 Obj_parse.column17=1;
                
            }
            else
            {
                chkBox17 = NO;
                Img_View17.image = [UIImage imageNamed:@"uncheck.png"];
                 Obj_parse.column17=0;
            }
            break;
        case 18:
            if (chkBox18 == NO)
            {
                chkBox18 = YES;
                Img_View18.image = [UIImage imageNamed:@"check.png"];
                Obj_parse.column18=1;
                
            }
            else
            {
                chkBox18 = NO;
                Img_View18.image = [UIImage imageNamed:@"uncheck.png"];
                 Obj_parse.column18=0;
            }
            break;
        case 19:
            if (chkBox19 == NO)
            {
                chkBox19 = YES;
                Img_View19.image = [UIImage imageNamed:@"check.png"];
                 Obj_parse.column19=1;
                
            }
            else
            {
                chkBox19 = NO;
                Img_View19.image = [UIImage imageNamed:@"uncheck.png"];
                 Obj_parse.column19=0;
            }
            break;
        case 20:
            if (chkBox20 == NO)
            {
                chkBox20 = YES;
                Img_View20.image = [UIImage imageNamed:@"check.png"];
                Obj_parse.column20=1;
                
            }
            else
            {
                chkBox20 = NO;
                Img_View20.image = [UIImage imageNamed:@"uncheck.png"];
                 Obj_parse.column20=0;
            }
            break;
        case 21:
            if (chkBox21 == NO)
            {
                chkBox21 = YES;
                Img_View21.image = [UIImage imageNamed:@"check.png"];
                 Obj_parse.column21=1;
                
            }
            else
            {
                chkBox21 = NO;
                Img_View21.image = [UIImage imageNamed:@"uncheck.png"];
                 Obj_parse.column21=0;
                
                
                
            }
            break;
        case 22:
            if (chkBox22 == NO)
            {
                chkBox22 = YES;
                Img_View22.image = [UIImage imageNamed:@"check.png"];
                 Obj_parse.column22=1;
                
            }
            else
            {
                chkBox22 = NO;
                Img_View22.image = [UIImage imageNamed:@"uncheck.png"];
                 Obj_parse.column22=0;
            }
            break;
            
        case 23:
            if (chkBox23 == NO)
            {
                chkBox23 = YES;
                Img_View23.image = [UIImage imageNamed:@"check.png"];
                 Obj_parse.column23=1;
                
            }
            else
            {
                chkBox23 = NO;
                Img_View23.image = [UIImage imageNamed:@"uncheck.png"];
                 Obj_parse.column23=0;
            }
            break;
        case 24:
            if (chkBox24 == NO)
            {
                chkBox24 = YES;
                Img_View24.image = [UIImage imageNamed:@"check.png"];
                 Obj_parse.column24=1;
                
            }
            else
            {
                chkBox24 = NO;
                Img_View24.image = [UIImage imageNamed:@"uncheck.png"];
                 Obj_parse.column24=0;
            }
            break;
        case 25:
            if (chkBox25 == NO)
            {
                chkBox25 = YES;
                Img_View25.image = [UIImage imageNamed:@"check.png"];
                Obj_parse.column25=1;
                
            }
            else
            {
                chkBox25 = NO;
                Img_View25.image = [UIImage imageNamed:@"uncheck.png"];
                 Obj_parse.column25=0;
            }
            break;


    }
}

-(void)SavebtnClick
{
     [self startSpinner:@"spinner" andDisplay:@"Saving Report.."];
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    NSDate *date = [NSDate date];
    NSDateFormatter *outputFormatter1 = [[NSDateFormatter alloc] init];
    [outputFormatter1 setDateFormat:@"MM-dd-yyyy"];
    NSString *strDate = [[NSString alloc]init];
    strDate = [outputFormatter1 stringFromDate:date];
    [outputFormatter1 release];
    
       
    Obj_parse.User_ID=objApp.UserName;
    Obj_parse.Creation_Date=strDate;
    
    
    NSString *urlstr=[NSString stringWithFormat:@"%@/%@/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%@", objApp.strUserId,Obj_parse.selectedProperty,Obj_parse.column1,Obj_parse.column2,Obj_parse.column3,Obj_parse.column4,Obj_parse.column5,Obj_parse.column6,Obj_parse.column7,Obj_parse.column8,Obj_parse.column9,Obj_parse.column10,Obj_parse.column11,Obj_parse.column12,Obj_parse.column13,Obj_parse.column14,Obj_parse.column15,Obj_parse.column16,Obj_parse.column17,Obj_parse.column18,Obj_parse.column19,Obj_parse.column20,Obj_parse.column21,Obj_parse.column22,Obj_parse.column23,Obj_parse.column24,Obj_parse.column25,strDate];
    
     
     NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@/addDailyActivity_service/%@",MainUrl,urlstr]];
    
 
     
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
    NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
    
    if (theConnection) 
    {
        webData = [[NSMutableData alloc]init];
    }
    
   }

-(void)postmessage
{
    
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
   messagechek=YES;
    
   NSString *Message= [NSString stringWithFormat:@"%@ Created Daily Activity Check List Report",objApp.UserName]; 
     
   NSString *temp_url=[NSString stringWithFormat:@"%@/addAlert_service/%@/%@/json",MainUrl,objApp.strUserId,Message];
    
    NSURL *url = [[NSURL alloc]initWithString:[temp_url stringByAddingPercentEscapesUsingEncoding:
                  NSASCIIStringEncoding]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:url];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(theConnection) {
        messagedata = [[NSMutableData data] retain];
    }
    
}


-(void)LoadUserProperty

{
    
    //  http://50.57.50.220/lindiproperty/index.php/lindiproperty/getProperty_service/108
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    propertycheck=YES;
    NSString *temp_url=[NSString stringWithFormat:@"%@/getProperty_service/%@",MainUrl,objApp.strUserId];
    
    
    NSURL *url = [[NSURL alloc]initWithString:[temp_url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:url];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (theConnection) 
    {
        webData = [[NSMutableData alloc]init];
    }

    
    
}

- (IBAction)PropertyDoneclcik

{
    if(isPropertyChanged==NO)
    {
        
       Obj_parse.selectedProperty=[propertyid objectAtIndex:0];
        
    }
    
    
    [UIView animateWithDuration:0.8 delay:0.0 options:0
                     animations:^{                              
                         CGPoint point = pickerview.center;
                         point.y = point.y + 600;
                         pickerview.center = point;
                         
                     } 
                     completion:^(BOOL finished) {  
                         [self enableview];
                     }];    
    
    
    
    
}



-(void)enableview

{
    Leasing_Scroll.userInteractionEnabled=YES;
    Save_btn.enabled=YES;
    
    
    
}

-(void)disabeleview

{
    
    
    
    Leasing_Scroll.userInteractionEnabled=NO;
    Save_btn.enabled=NO;
   
}



#pragma mark - UIPikerview Delegates 

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [PikerArray count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [PikerArray objectAtIndex:row]; 
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
 {
 
     isPropertyChanged=YES;
     
     Obj_parse.selectedProperty=[propertyid objectAtIndex:row];
     
    
 
 
 }


#pragma  mark - Connection Delegates

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if(messagechek ==YES)
    {
        [messagedata setLength:0];
    }
    else
    {
        [webData setLength:0];
    }
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(messagechek ==YES)
    {
        [messagedata appendData:data];
    }
    else
    {
        [webData appendData:data];
    }
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if(messagechek ==YES)
    {
        
        [webData release];
        [connection release];
    }
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if(propertycheck == YES)
    {
        
        NSString *jsonStr = [[NSString alloc] 
                             initWithData:webData                         
                             encoding:NSASCIIStringEncoding];
        
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        
        NSDictionary *jsondic = [parser objectWithString:jsonStr];
        
        NSString *str = [NSString stringWithFormat:@"%@",[jsondic valueForKey:@"success"]];
        
        
        if ([str isEqualToString:@"1"])
        {

        
            NSDictionary *resultdic=[[NSDictionary alloc]init];
            
            resultdic=[jsondic valueForKey:@"result"];
            
            PikerArray=[[NSMutableArray alloc]initWithArray:[resultdic valueForKey:@"property_name"]];
            propertyid=[[NSMutableArray alloc]initWithArray:[resultdic valueForKey:@"property_id"]];
        
        
            if([PikerArray count]>0)
            {
            
                [Propertypicker reloadAllComponents];
            
                [self stopSpinner];
            
                [UIView animateWithDuration:0.8 delay:0.0 options:0
                                 animations:^{                              
                                    CGPoint point = pickerview.center;
                                     point.y = point.y - 600;
                                     pickerview.center = point;
                                     } 
                                    completion:^(BOOL finished) {  
                                    }];    
            
            
                [self.view bringSubviewToFront:pickerview];
                
                [self disabeleview];
            
            }
            
         }
        
        else
            
        {
            [self stopSpinner];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"No Property Assigned!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            alert.delegate=self;
            [alert release];
            
            
            
            
        }
        
        [webData release];
         propertycheck =NO;
        
    }
    else
    {

        if(messagechek ==YES)
        {
        
            [self stopSpinner];
            messagechek=NO;
            [messagedata release];
            [connection release];
            [self.navigationController dismissModalViewControllerAnimated:YES];    
        
        }
        else
        {
            [self postmessage];
            [webData release];
        
        }
        
    }
    
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


#pragma mark - Alert View Delegates

-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

#pragma mark -  View Delegates


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

    
    Leasing_Scroll.contentSize=CGSizeMake(728, 1900);
    
    Save_btn = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(SavebtnClick)];
    self.navigationItem.rightBarButtonItem=Save_btn;
    
     barButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    [barButton setTitle:@"Back"];
    [self.navigationItem setLeftBarButtonItem:barButton];
    [barButton release];
    
    self.title=@"Daily Activity Checklist Report";
    
    chkBox1= NO;
    chkBox2= NO;
    chkBox3= NO;
    chkBox4= NO;
    chkBox5= NO;
    chkBox6= NO;
    chkBox7= NO;
    chkBox8= NO;
    chkBox9= NO;
    chkBox10= NO;
    chkBox11= NO;
    chkBox12= NO;
    chkBox13= NO;
    chkBox14= NO;
    chkBox15= NO;
    chkBox16= NO;
    chkBox17= NO;
    chkBox18= NO;
    chkBox19= NO;
    chkBox20= NO;
    chkBox21= NO;
    chkBox22= NO;
    chkBox23= NO;
    chkBox24= NO;
    chkBox25= NO;
    self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
    [self startSpinner:@"spinner" andDisplay:@"Loading.."];
    
    [self LoadUserProperty];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
   
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
        
    
    
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
   return (interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown);    
    
}


@end

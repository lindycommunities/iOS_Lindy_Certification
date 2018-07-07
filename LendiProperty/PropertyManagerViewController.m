//
//  PropertyManagerViewController.m
//  LendiProperty
//
//  Created by Vinay Devdikar on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PropertyManagerViewController.h"



@implementation PropertyManagerViewController

@synthesize scrView;

@synthesize spinnerView;

@synthesize imgView0,imgView1,imgView2,imgView3,imgView4,imgView5,imgView6,imgView7,imgView8,imgView9,imgView10,imgView11,imgView12,imgView13,imgView14,imgView15,imgView16,imgView17,imgView18,imgView19,imgView20,imgView21,imgView22;

@synthesize Propertypicker;

@synthesize pickerview;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


#pragma mark - View lifecycle


-(void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *version = [[UIDevice currentDevice] systemVersion];
    int ver_val = [version intValue];
    
    
    if(ver_val >=6.0 ){
        [[UIDevice currentDevice] setOrientation:UIDeviceOrientationPortrait];
    }

    
    
    // Do any additional setup after loading the view from its nib.
    self.title = @"Property Manager";
    
     self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];

    objParser = [[ParserClass alloc]init];

    btnNext = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(SavebtnClick)];
    self.navigationItem.rightBarButtonItem =btnNext;
    
    
     barButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    [barButton setTitle:@"Back"];
    [self.navigationItem setLeftBarButtonItem:barButton];
    [barButton release];
   

       

    self.scrView.contentSize = CGSizeMake(768, 1150);
    self.scrView.scrollEnabled = YES;
    
    self.imgView0.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView1.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView2.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView3.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView4.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView5.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView6.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView7.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView8.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView9.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView10.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView11.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView12.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView13.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView14.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView15.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView16.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView17.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView18.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView19.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView20.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView21.image = [UIImage imageNamed:@"uncheck.png"];
    self.imgView22.image = [UIImage imageNamed:@"uncheck.png"];
    
    chkBox1  = NO;
    chkBox2  = NO;
    chkBox3  = NO;
    chkBox4  = NO;
    chkBox5  = NO;
    chkBox6  = NO;
    chkBox7  = NO;
    chkBox8  = NO;
    chkBox9  = NO;
    chkBox10 = NO;
    chkBox11 = NO;
    chkBox12 = NO;
    chkBox13 = NO;
    chkBox14 = NO;
    chkBox15 = NO;
    chkBox16 = NO;
    chkBox17 = NO;
    chkBox18 = NO;
    chkBox19 = NO;
    chkBox20 = NO;
    chkBox21 = NO;
    chkBox22 = NO;
    chkBox23 = NO;

    [self startSpinner:@"spinner" andDisplay:@"Loading.."];
    
    [self LoadUserProperty];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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




#pragma mark - App Methods

-(void)backButtonClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)btnClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    switch (btn.tag)
    {
        case 1:
            if (chkBox1 == NO)
            {
                chkBox1 = YES;
                self.imgView0.image = [UIImage imageNamed:@"check.png"];
                objParser.column1 = 1;
            }
            else
            {
                chkBox1 = NO;
                self.imgView0.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column1 = 0;
            }
            break;
        case 2:
            if (chkBox2 == NO)
            {
                chkBox2 = YES;
                self.imgView1.image = [UIImage imageNamed:@"check.png"];
                objParser.column2 = 1;
            }
            else
            {
                chkBox2 = NO;
                self.imgView1.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column2 = 0;
            }

            break;
        case 3:
            if (chkBox3 == NO)
            {
                chkBox3 = YES;
                self.imgView2.image = [UIImage imageNamed:@"check.png"];
                objParser.column3 = 1;
            }
            else
            {
                chkBox3 = NO;
                self.imgView2.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column3 = 0;
            }

            break;
        case 4:
            if (chkBox4 == NO)
            {
                chkBox4 = YES;
                self.imgView3.image = [UIImage imageNamed:@"check.png"];
                objParser.column4 = 1;
            }
            else
            {
                chkBox4 = NO;
                self.imgView3.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column4 = 0;
            }

            break;
        case 5:
            if (chkBox5 == NO)
            {
                chkBox5 = YES;
                self.imgView4.image = [UIImage imageNamed:@"check.png"];
                objParser.column5 = 1;
            }
            else
            {
                chkBox5 = NO;
                self.imgView4.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column5 = 0;
            }

            break;
        case 6:
            if (chkBox6 == NO)
            {
                chkBox6 = YES;
                self.imgView5.image = [UIImage imageNamed:@"check.png"];
                objParser.column6 = 1;
            }
            else
            {
                chkBox6 = NO;
                self.imgView5.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column6 = 0;
            }

            break;
        case 7:
            if (chkBox7 == NO)
            {
                chkBox7 = YES;
                self.imgView6.image = [UIImage imageNamed:@"check.png"];
                objParser.column7 = 1;
            }
            else
            {
                chkBox7 = NO;
                self.imgView6.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column7 = 0;
            }

            break;
        case 8:
            if (chkBox8 == NO)
            {
                chkBox8 = YES;
                self.imgView7.image = [UIImage imageNamed:@"check.png"];
                objParser.column8 = 1;
            }
            else
            {
                chkBox8 = NO;
                self.imgView7.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column8 = 0;
            }
                            
            break;
        case 9:
            if (chkBox9 == NO)
            {
                chkBox9 = YES;
                self.imgView8.image = [UIImage imageNamed:@"check.png"];
                objParser.column9 = 1;
            }
            else
            {
                chkBox9 = NO;
                self.imgView8.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column9 = 0;
            }

            break;
        case 10:
            if (chkBox10 == NO)
            {
                chkBox10 = YES;
                self.imgView9.image = [UIImage imageNamed:@"check.png"];
                objParser.column10 = 1;
            }
            else
            {
                chkBox10 = NO;
                self.imgView9.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column10 = 0;
            }

            break;
        case 11:
            if (chkBox11 == NO)
            {
                chkBox11 = YES;
                self.imgView10.image = [UIImage imageNamed:@"check.png"];
                objParser.column11 = 1;
            }
            else
            {
                chkBox11 = NO;
                self.imgView10.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column11 = 0;
            }

            break;
        case 12:
            if (chkBox12 == NO)
            {
                chkBox12 = YES;
                self.imgView11.image = [UIImage imageNamed:@"check.png"];
                objParser.column12 = 1;
            }
            else
            {
                chkBox12 = NO;
                self.imgView11.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column12 = 0;
            }

            break;
        case 13:
            if (chkBox13 == NO)
            {
                chkBox13 = YES;
                self.imgView12.image = [UIImage imageNamed:@"check.png"];
                objParser.column13 = 1;
            }
            else
            {
                chkBox13 = NO;
                self.imgView12.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column13 = 0;
            }

            break;
        case 14:
            if (chkBox14 == NO)
            {
                chkBox14 = YES;
                self.imgView13.image = [UIImage imageNamed:@"check.png"];
                objParser.column14 = 1;
            }
            else
            {
                chkBox14 = NO;
                self.imgView13.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column14 = 0;
            }

            break;
        case 15:
            if (chkBox15 == NO)
            {
                chkBox15 = YES;
                self.imgView14.image = [UIImage imageNamed:@"check.png"];
                objParser.column15 = 1;
            }
            else
            {
                chkBox15 = NO;
                self.imgView14.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column15 = 0;
            }

            break;
        case 16:
            if (chkBox16 == NO)
            {
                chkBox16 = YES;
                self.imgView15.image = [UIImage imageNamed:@"check.png"];
                objParser.column16 = 1;
            }
            else
            {
                chkBox16 = NO;
                self.imgView15.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column16 = 0;
            }

            break;
        case 17:
            if (chkBox17 == NO)
            {
                chkBox17 = YES;
                self.imgView16.image = [UIImage imageNamed:@"check.png"];
                objParser.column17 = 1;
            }
            else
            {
                chkBox17 = NO;
                self.imgView16.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column17 = 0;
            }

            break;
        case 18:
            if (chkBox18 == NO)
            {
                chkBox18 = YES;
                self.imgView17.image = [UIImage imageNamed:@"check.png"];
                objParser.column18 = 1;
            }
            else
            {
                chkBox18 = NO;
                self.imgView17.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column18 = 0;
            }

            break;
        case 19:
            if (chkBox19 == NO)
            {
                chkBox19 = YES;
                self.imgView18.image = [UIImage imageNamed:@"check.png"];
                objParser.column19 = 1;
            }
            else
            {
                chkBox19 = NO;
                self.imgView18.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column19 = 0;
            }

            break;
        case 20:
            if (chkBox20 == NO)
            {
                chkBox20 = YES;
                self.imgView19.image = [UIImage imageNamed:@"check.png"];
                objParser.column20 = 1;
            }
            else
            {
                chkBox20 = NO;
                self.imgView19.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column20 = 0;
            }
                    
            break;
        case 21:
            if (chkBox21 == NO)
            {
                chkBox21 = YES;
                self.imgView20.image = [UIImage imageNamed:@"check.png"];
                objParser.column21 = 1;
            }
            else
            {
                chkBox21 = NO;
                self.imgView20.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column21 = 0;
            }

            break;
        case 22:
            if (chkBox22 == NO)
            {
                chkBox22 = YES;
                self.imgView21.image = [UIImage imageNamed:@"check.png"];
                objParser.column22 = 1;
            }
            else
            {
                chkBox22 = NO;
                self.imgView21.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column22 = 0;
            }

            break;
        case 23:
            if (chkBox23 == NO)
            {
                chkBox23 = YES;
                self.imgView22.image = [UIImage imageNamed:@"check.png"];
                objParser.column23 = 1;
            }
            else
            {
                chkBox23 = NO;
                self.imgView22.image = [UIImage imageNamed:@"uncheck.png"];
                objParser.column23 = 0;
            }

            break;
  
        default:
            break;
    }
}



-(void) SavebtnClick
{
    [self startSpinner:@"spinner" andDisplay:@"Saving Report.."]; 
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
      
    NSDate *date = [NSDate date];
    NSDateFormatter *outputFormatter1 = [[NSDateFormatter alloc] init];
    [outputFormatter1 setDateFormat:@"MM-dd-yyyy"];
    NSString *strDate = [[NSString alloc]init];
    strDate = [outputFormatter1 stringFromDate:date];
        
   
    
    objParser.strUserName = objApp.strUserName;
    
    objParser.strSavedDate = strDate;
    
   
    
   
    NSString *urlstr=[NSString stringWithFormat:@"%@/%@/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%@", objApp.strUserId,objParser.selectedProperty,objParser.column1,objParser.column2,objParser.column3,objParser.column4,objParser.column5,objParser.column6,objParser.column7,objParser.column8,objParser.column9,objParser.column10,objParser.column11,objParser.column12,objParser.column13,objParser.column14,objParser.column15,objParser.column16,objParser.column17,objParser.column18,objParser.column19,objParser.column20,objParser.column21,objParser.column22,objParser.column23,strDate];
   
    
     NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@/addPropertyManager_service/json/%@",MainUrl,urlstr]];
      
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
    
    
    NSDate *date = [NSDate date];
    
    NSDateFormatter *outputFormatter1 = [[NSDateFormatter alloc] init];
    [outputFormatter1 setDateFormat:@"MM-dd-yyyy"];
    NSString *strDate = [[NSString alloc]init];
    strDate = [outputFormatter1 stringFromDate:date];
    
 
    
    NSString *Message= [NSString stringWithFormat:@"%@ Created Property Manager Report",objApp.UserName]; 
      
    NSString *temp_url=[NSString stringWithFormat:@"%@/addAlert_service/%@/%@/json",MainUrl,objApp.strUserId,Message];
    
    
      
    
    messagechek=YES;
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
        
        objParser.selectedProperty=[propertyid objectAtIndex:0];
        
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
    scrView.userInteractionEnabled=YES;
    btnNext.enabled=YES;
  
    
    
}

-(void)disabeleview

{
    
    
    scrView.userInteractionEnabled=NO;
    btnNext.enabled=NO;
    
    
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
     
     objParser.selectedProperty=[propertyid objectAtIndex:row];
     
    
 
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
     [self stopSpinner];
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


@end

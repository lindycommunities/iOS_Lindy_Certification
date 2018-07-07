//
//  InclemnetWeatherReportController.m
//  LendiProperty
//
//  Created by Vinay D on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InclemnetWeatherReportController.h"


@implementation InclemnetWeatherReportController


@synthesize Date_view,pikerview;

@synthesize Dateselect_btn,SignDate_btn,Attachphoto_btn,SelectTime_btn,SelectEndTime_btn;

@synthesize date_picker;

@synthesize PropertyM_txt,Contractor_txt,MaintainacesS_txt,Phone_txt,SignDate_txt,Employee_txt,Initales_txt,ActionTaken_txt,Phone1_txt,Phone2_txt,Date_txt,EndTime_txt,Sign_txt;

@synthesize popoverController;

@synthesize Scroll_view;

@synthesize ViewToolBar;

@synthesize spinnerView;

@synthesize Propertypicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        Date_txt.delegate=self;
        Imagearr=[[NSMutableArray alloc]init];
         app=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
       
        
        
         PikerArray =[[NSMutableArray alloc]init];
      
        
     //   -(void)selectMaxofID
        
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

-(void)disabeleview

{
    Attachphoto_btn.userInteractionEnabled=NO; 
    Dateselect_btn.enabled=NO;
    SelectTime_btn.enabled=NO;
    SelectEndTime_btn.enabled=NO;
    SignDate_btn.enabled=NO;
    PropertyM_txt.enabled=NO;
    Contractor_txt.enabled=NO;
    MaintainacesS_txt.enabled=NO;
    Phone_txt.enabled=NO;
    Phone1_txt.enabled=NO;
    Phone2_txt.enabled=NO;
    SignDate_txt.enabled=NO;
    ActionTaken_txt.enabled=NO;
    Sign_txt.enabled=NO;
    Date_txt.enabled=NO;
    STime_txt.enabled=NO;
    EndTime_txt.enabled=NO;
    Employee_txt.enabled=NO;
    Initales_txt.enabled=NO;
    
}

-(void)enableview

{
    Attachphoto_btn.userInteractionEnabled=YES; 
    Dateselect_btn.enabled=YES;
    SelectTime_btn.enabled=YES;
    SelectEndTime_btn.enabled=YES;
    SignDate_btn.enabled=YES;
    PropertyM_txt.enabled=YES;
    Contractor_txt.enabled=YES;
    MaintainacesS_txt.enabled=YES;
    Phone_txt.enabled=YES;
    Phone1_txt.enabled=YES;
    Phone2_txt.enabled=YES;
    SignDate_txt.enabled=YES;
    ActionTaken_txt.enabled=YES;
    Sign_txt.enabled=YES;
    Date_txt.enabled=YES;
    STime_txt.enabled=YES;
    EndTime_txt.enabled=YES;
    Employee_txt.enabled=YES;
    Initales_txt.enabled=YES;
    
    
}


-(void)backButtonClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
    [self.view release];
}

-(void)AttachPhoto
{
        
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"Lindy Property" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"From Camera" otherButtonTitles:@"From Album",nil];
    action.delegate=self;
    action.actionSheetStyle = UIActionSheetStyleAutomatic;
    [action showInView:self.view];

    
}
-(void)SavebtnClick
{
    if ([Date_txt.text length]>0 && [Contractor_txt.text length]>0  && [PropertyM_txt.text length]>0  && [STime_txt.text length] >0 && [EndTime_txt.text length] >0 &&[ActionTaken_txt.text length] >0 && [Employee_txt.text length]>0 && [Initales_txt.text length]>0 && [SignDate_txt.text length]>0 && [MaintainacesS_txt.text length]>0 && [Phone_txt.text length]>0 ) 
    {
        
          
    [self startSpinner:@"spinner" andDisplay:@"Saving Report.."];
        
              
        NSDate *date = [NSDate date];
        NSDateFormatter *outputFormatter1 = [[NSDateFormatter alloc] init];
        [outputFormatter1 setDateFormat:@"MM-dd-yyyy"];
        NSString *strDate = [[NSString alloc]init];
        strDate = [outputFormatter1 stringFromDate:date];
        [outputFormatter1 release];

    
  
    
        LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
        
       
    Obj_Parse.CreationDate = Date_txt.text ;
        
    Obj_Parse.PropertyManager =PropertyM_txt.text;
        
    Obj_Parse.Contractor = Contractor_txt.text;
        
    Obj_Parse.MaintancesSuper = MaintainacesS_txt.text;
        
    Obj_Parse.Phoneno = [NSString stringWithFormat:@"%@-%@-%@",self.Phone_txt.text,self.Phone1_txt.text,self.Phone2_txt.text];
        
    Obj_Parse.StartTime =STime_txt.text;
        
    Obj_Parse.ActionTaken = ActionTaken_txt.text;
        
    Obj_Parse.EndTime = EndTime_txt.text;
        
    Obj_Parse.EmployeeName = Employee_txt.text;
        
    Obj_Parse.Intials = Initales_txt.text;
        
    Obj_Parse.Sign = Sign_txt.text;
        
    Obj_Parse.SignDate = SignDate_txt.text;
        
       
        
          
        NSString *urlstr=[NSString stringWithFormat:@"%@/addInclementReport_service/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@",MainUrl,objApp.strUserId,Obj_Parse.selectedProperty,Obj_Parse.CreationDate,Obj_Parse.PropertyManager,Obj_Parse.Contractor,Obj_Parse.MaintancesSuper,Obj_Parse.Phoneno,Obj_Parse.StartTime, Obj_Parse.ActionTaken ,Obj_Parse.EndTime,Obj_Parse.EmployeeName,Obj_Parse.Intials,Obj_Parse.Sign,Obj_Parse.SignDate];
                                    
  //Obj_Parse.selectedProperty

       
        
        
        NSURL *url=[NSURL URLWithString:[urlstr stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
        
        NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
        
        NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
        
        if (theConnection) 
        {
            webData = [[NSMutableData alloc]init];
        }
        else
        {
            
        }

    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Please Fill The All The Information!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
         alert.delegate=self;
        [alert release];
    }
    
    
    
        
}

-(void)TimeSelect_btn;
{
    chk_str=@"Timepicker";
    Time_str=@"";
    chek_view=YES;
   [self DatePickerView];
    
    
}

-(void)DateSelect_btn
{
    chk_str=@"DatePicker";
    Time_str=@"";
    [self DatePickerView];
       
}

-(void)SingDateSelect
{
    chk_str=@"DatePicker";
    Time_str=@"SignDAte";
    [self DatePickerView];
}

-(void)EndTimeSelect
{
    
    chk_str=@"Timepicker";
    Time_str=@"EndTime";
    [self DatePickerView];    
}

-(void)DatePickerView
{
    CGPoint point = Date_view.center;
    if (point.y==1151.500000)
    {
        
    if([chk_str isEqualToString:@"Timepicker"])
    {
        date_picker.datePickerMode=UIDatePickerModeTime;
    }
    else
    {
        date_picker.datePickerMode=UIDatePickerModeDate;
    }
    [UIView animateWithDuration:0.8 delay:0.0 options:0
                     animations:^{                              
                         CGPoint point = Date_view.center;
                         point.y = point.y - 524;
                         Date_view.center = point;
                         
                     } 
                     completion:^(BOOL finished) {  
                     }];    
    
    
    [self.view bringSubviewToFront:Date_view];
    
    }
}



-(void)Donebtn_clcik
{
    
    if([chk_str isEqualToString:@"Timepicker"])
    {
        
        if([Time_str isEqualToString:@"EndTime"])
        {
            NSDate *time=date_picker.date;
            NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
            [timeFormatter setTimeStyle:NSDateFormatterShortStyle];
            EndTime_txt.text = [NSString stringWithFormat:@"%@", 
                                [timeFormatter stringFromDate:time]];
            
        }

        else
        {
        
         NSDate *time=date_picker.date;
         NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
         [timeFormatter setTimeStyle:NSDateFormatterShortStyle];
         STime_txt.text = [NSString stringWithFormat:@"%@", 
                                                [timeFormatter stringFromDate:time]];
        }
        
    }
    else if([chk_str isEqualToString:@"DatePicker"])
    {
         if([Time_str isEqualToString:@"SignDAte"])
         {
             NSDate *date=date_picker.date;
             NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
             [formatter setDateFormat:@"MM-dd-yyyy"];
             NSString *str=[formatter stringFromDate:date];
             SignDate_txt.text=str;
        }
        else
        {
            NSDate *date=date_picker.date;
            NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"MM-dd-yyyy"];
            NSString *str=[formatter stringFromDate:date];
            Date_txt.text=str;
        }
        
        
        
        
    }
        
    
    
         
    [UIView animateWithDuration:0.8 delay:0.0 options:0
                     animations:^{                              
                         CGPoint point = Date_view.center;
                         point.y = point.y + 524;
                         Date_view.center = point;
                         
                     } 
                     completion:^(BOOL finished) {  
                     }];    

    
}
-(void)Getimage
{
   
    
        NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
        
        if ([currSysVer intValue]<6.0)
            
        {
            
            imagePicker=[[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.sourceType =
            UIImagePickerControllerSourceTypeCamera;
            imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                      (NSString *) kUTTypeImage,
                                      nil];
            imagePicker.allowsEditing = NO;
            
            [self presentModalViewController:imagePicker
                                    animated:YES];
            [imagePicker release];
            
            
            
        }
        
        else
            
        {
            if ([UIImagePickerController isSourceTypeAvailable:
                 UIImagePickerControllerSourceTypeCamera])
            {
                imagePicker =[[UIImagePickerController alloc] init];
                imagePicker.delegate = self;
                imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
                imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
                imagePicker.allowsEditing = NO;
                [self presentViewController:imagePicker
                                   animated:YES completion:nil];
                
            }
            
            
    
            
        }
        
         
    
}
-(void)postmessage
{
    
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
       
    NSString *Message= [NSString stringWithFormat:@"%@ Created Inclement Weather Report",objApp.UserName];
      
   NSString *temp_url=[NSString stringWithFormat:@"%@/addAlert_service/%@/%@/json",MainUrl,objApp.strUserId,Message];
    
    
    messagechek=YES;
    NSURL *url = [[NSURL alloc]initWithString:[temp_url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:url];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (theConnection) 
    {
        webData = [[NSMutableData alloc]init];
    }
    
}

-(void)ImageUpload

{
    NSLog(@"%d",[ImageArray_temp count]);
     //NSString *strURL = [NSString stringWithFormat:@"%@image_upload&report_id=%@&report_type=inclement_weather_report",SecondUrl,get_reprtid];
    
        NSString *strURL = [NSString stringWithFormat:@"%@image_upload&report_id=%@&report_type=inclement_weather_report",SecondUrl,get_reprtid];
           
		ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:strURL]];
		[request setDelegate:self];
	   
        
		for (int i = 0; i < [ImageArray_temp count]; i++) 
        {
            [request addData:[ImageArray_temp objectAtIndex:i] withFileName:@"image.jpg" andContentType:@"image/jpeg" forKey:[NSString stringWithFormat:@"image%d",i]];
		}	
		[request startAsynchronous];
    
}

-(void)LoadUserProperty

{
    
    app=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    propertycheck=YES;
    NSString *temp_url=[NSString stringWithFormat:@"%@/getProperty_service/%@",MainUrl,app.strUserId];
       
    
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
        
        Obj_Parse.selectedProperty=[propertyid objectAtIndex:0];
        
    }
    
   
    [UIView animateWithDuration:0.8 delay:0.0 options:0
                     animations:^{                              
                         CGPoint point = pikerview.center;
                         point.y = point.y + 600;
                         pikerview.center = point;
                         
                     } 
                     completion:^(BOOL finished) {  
                          [self enableview];
                     }];    
    
    
    
    
}





#pragma mark - Image Upload Delegates


- (void)requestFinished:(ASIHTTPRequest *)request

{
  
    
    
   
    [self postmessage];
    UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Report is Saved With Image" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Alert show];
        [Alert release];
         
        
   
    
   
    
   
	
}


- (void)requestFailed:(ASIHTTPRequest *)request 

{
	
	[self postmessage];
    UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Report is Saved Without Image" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [Alert show];
    [Alert release];

    
}






#pragma mark - Image Picker Delegates


- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)imagePickerController:(UIImagePickerController *)picker 
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    [picker dismissModalViewControllerAnimated:YES];
    imagePicker.view.hidden = YES;
    photo1.image = image;
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
        
       
        ImageArray_temp=[[NSMutableArray alloc]init];
    
        Cameradic=[[NSMutableDictionary alloc]initWithDictionary:info];
    
        temp_img=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
       
        [picker dismissModalViewControllerAnimated:YES];
    
        UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"You can reduce the size of scalling image to one of the size below." delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Small" otherButtonTitles:@"Medium",@"Actual Size",nil];
            action.delegate=self;
            action.tag=1;
            action.actionSheetStyle = UIActionSheetStyleAutomatic;
            [action showInView:self.view];

            
            
            
        
      
        

        
}            
            
#pragma mark - Alert View Delegates

-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(alertView.tag==1)
    {
        if (buttonIndex ==0)
        {
            [self Getimage];
        }
        
        
        
    }
    
    
}
            
            
        
 
#pragma mark - TextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [Scroll_view scrollRectToVisible:CGRectMake(0, 0, 768, 1024) animated:YES];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string    
{
    if(textField.tag==11 || textField.tag==12 || textField.tag==13)
    {
        NSString *nameRegex =@"[0-9-.]"; 
        NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex]; 
        BOOL isNumber=[nameTest evaluateWithObject:string];
    
        if(isNumber == YES || [string isEqualToString:@""]) 
        {
            if(textField.tag==11)
               {
                   if ([Phone_txt.text length]==3)
                   {
                       [Phone1_txt becomeFirstResponder];
                   }
               }
            else if(textField.tag==12)
            {
                if([Phone1_txt.text length]==3)
                {
                    [Phone2_txt becomeFirstResponder];
                }
            }
            else if(textField.tag==13)
            {
                if (textField.text.length <=2 )
                {
                   return YES;
                }
                
                else
                {         
                  [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(hide)userInfo:nil repeats:NO];
                    return YES;
                }
            }
            
            return YES;
        }
        else
        {
            return NO;
        }
        
     
    }
    else
    {
                
        return YES;
    }
    
       
}


-(void)hide
{
    [Phone2_txt resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	switch (textField.tag) 
    {
            case 1:
                return YES;
                break;
            case 2:
                [textField resignFirstResponder];
                return NO;
                break;
            case 3:
            [Scroll_view scrollRectToVisible:CGRectMake(0,668,768,1024) animated:YES];
             return YES;
            break;
            case 4:
            [Scroll_view scrollRectToVisible:CGRectMake(0,668,768,1024) animated:YES];
             return YES;
            break;
            case 5:
            [Scroll_view scrollRectToVisible:CGRectMake(0,668,768,1024) animated:YES];
             return YES;
            break;
            default:
                return YES;
                break;
    }
    
}


#pragma mark - ActionSheet Delegates

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	
    
     NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    
     if ([title isEqualToString:@""])
            
     {
         
        [actionSheet dismissWithClickedButtonIndex:[title intValue] animated:YES];
         
     }
    
    
     else if([title isEqualToString:@"From Camera"])
         
     {
         
        [self Getimage];
           
     }
    
    
    
     else if([title isEqualToString:@"From Album"])
         
     {
         
         ELCAlbumPickerController *albumController = [[ELCAlbumPickerController alloc] initWithNibName:@"ELCAlbumPickerController" bundle:[NSBundle mainBundle]];    
         ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initWithRootViewController:albumController];
         [self presentModalViewController:elcPicker animated:YES];
         
         [albumController setParent:elcPicker];
         [elcPicker setDelegate:self];

     }
    
    
    else if([title isEqualToString:@"Small"])
        
    {
        
        
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"];
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 0.5)];
        [ImageArray_temp addObject:imageData];
        
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Do Want To Take Another Picture" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
        [Alert show];
        Alert.tag=1;
        [Alert release];
        
        
    }
    
    
    else if([title isEqualToString:@"Medium"])
        
    {
       temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"];
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 1)];
        [ImageArray_temp addObject:imageData];
        
        
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Do Want To Take Another Picture" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
        [Alert show];
        Alert.tag=1;
        [Alert release];
    }
    
    
    
    else if([title isEqualToString:@"Actual Size"])
        
    {
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"];       
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 2)];
        [ImageArray_temp addObject:imageData];
        
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Do Want To Take Another Picture" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
        [Alert show];
        Alert.tag=1;
        [Alert release];
        
    }
    
    else if([title isEqualToString:@"Cancle"])
        
    {
        
        [actionSheet dismissWithClickedButtonIndex:[title intValue] animated:YES];
        
    }
        
}

#pragma mark - ELCImagePickerControllerDelegate Methods

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
	
	[self dismissModalViewControllerAnimated:YES];
    ImageArray_temp=[[NSMutableArray alloc]init];
	for(NSDictionary *dict in info) 
    {
        
        
        temp_img=[dict objectForKey:UIImagePickerControllerOriginalImage];
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 2)];
        [ImageArray_temp addObject:imageData];
                 
        
        NSLog(@"%d",[ImageArray_temp count]);
       
       
        
    }
    
   /* UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"You can reduce the size of scalling image to one of the size below." delegate:self cancelButtonTitle:@"Small" destructiveButtonTitle:@"Small" otherButtonTitles:@"Medium",@"Actual Size",nil];
    action.delegate=self;
    action.actionSheetStyle = UIActionSheetStyleAutomatic;
    [action showInView:self.view];*/

    
}
- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker {
    
	[self dismissModalViewControllerAnimated:YES];
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



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    
    
    [self startSpinner:@"spinner" andDisplay:@"Loading.."];
    [self LoadUserProperty];
    
      Obj_Parse=[[ParserClass alloc]init];
        
   // self.view.userInteractionEnabled=NO;
    
    isPropertyChanged=NO;
    
    Scroll_view.contentSize=CGSizeMake(768, 1200);
    
    self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
      
    Sign_txt.text =app.UserName;
    
    
    self.title=@"Inclement Weather Report";
    Savebtn = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(SavebtnClick)];
    self.navigationItem.rightBarButtonItem=Savebtn;
    
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    [barButton setTitle:@"Back"];
    [self.navigationItem setLeftBarButtonItem:barButton];
    [barButton release];
   
    NSString *version = [[UIDevice currentDevice] systemVersion];
   
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    
    
    
       
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return (interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown);
    
    
}


- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}


#pragma mark - keyboard Delegates

- (void)keyboardDidShow: (NSNotification *) notif
{
    
}

- (void)keyboardDidHide: (NSNotification *) notif
{
    
     [Scroll_view scrollRectToVisible:CGRectMake(0, 0, 768, 1024) animated:YES];
    
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
    
    Obj_Parse.selectedProperty=[propertyid objectAtIndex:row];
    
   
    
    
    
}





#pragma mark - Image Orientation Delegates


- (UIImage *)fixOrientation {
    
    // No-op if the orientation is already correct
    if (temp_img.imageOrientation == UIImageOrientationUp) return temp_img;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (temp_img.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, temp_img.size.width, temp_img.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, temp_img.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, temp_img.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (temp_img.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, temp_img.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, temp_img.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, temp_img.size.width, temp_img.size.height,
                                             CGImageGetBitsPerComponent(temp_img.CGImage), 0,
                                             CGImageGetColorSpace(temp_img.CGImage),
                                             CGImageGetBitmapInfo(temp_img.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (temp_img.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,temp_img.size.height,temp_img.size.width), temp_img.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,temp_img.size.width,temp_img.size.height), temp_img.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}




#pragma  mark - Connection Delegates

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    if(messagechek !=YES)
    {
        [webData setLength:0];
    }
  
   
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(messagechek !=YES)
    {
        [webData appendData:data];
    }
   
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
     
        [self stopSpinner];
        [webData release];
        [connection release];
       
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
               
            [self stopSpinner];
            
            if([PikerArray count]>0)
            {
            
                [Propertypicker reloadAllComponents];
            
                
            
                [UIView animateWithDuration:0.8 delay:0.0 options:0
                         animations:^{                              
                             CGPoint point = pikerview.center;
                             point.y = point.y - 600;
                             pikerview.center = point;
                             
                         } 
                         completion:^(BOOL finished) {  
                         }];    
        
        
                [self.view bringSubviewToFront:pikerview];
              
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
            [connection release];
            [self.navigationController dismissModalViewControllerAnimated:YES];    
        
        }
        else
        {
        
            NSString *jsonStr = [[NSString alloc] 
                             initWithData:webData                         
                             encoding:NSASCIIStringEncoding];
        
            SBJsonParser *parser = [[SBJsonParser alloc] init];
        
            NSDictionary *jsondic = [parser objectWithString:jsonStr];
            
            get_reprtid=[NSString stringWithFormat:@"%@",[jsondic valueForKey:@"report_id"]];
        
        
            [webData release];
            if([ImageArray_temp count]>0)
            {
                [self ImageUpload];
            }
            else
            {
                [self postmessage];
            }
             
           
        }
        
        
    }
    
    
}


@end

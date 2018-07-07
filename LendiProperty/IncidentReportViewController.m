//
//  IncidentReportViewController.m
//  LendiProperty
//
//  Created by Vinay Devdikar on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IncidentReportViewController.h"


@implementation IncidentReportViewController

@synthesize txtProperty,txtResidentName,txtAPT,txtPhone,txtPreparedBy,txtWitness,txtAddress,txtPhone1,txtPhone2,txtPhone3,txtPhone4,txtPhone5;

@synthesize txtViewDesc;

@synthesize scrView;

@synthesize spinnerView;

@synthesize attachphotobtn;

@synthesize Propertylbl;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        
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

    
    self.title = @"Incident Report";
      
    self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
    self.scrView.contentSize = CGSizeMake(768, 1500);
    
    self.scrView.scrollEnabled = NO;
    
     objParser = [[ParserClass alloc]init];
    
    btnNext = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(SavebtnClick)];
    
    self.navigationItem.rightBarButtonItem =btnNext;
    
    
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    
    [barButton setTitle:@"Back"];
    
    [self.navigationItem setLeftBarButtonItem:barButton];
    
    
   /* [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:)
    name:UIKeyboardDidShowNotification:nil];*/
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];

    
    
    
    [self startSpinner:@"spinner" andDisplay:@"Loading.."];
    
    [self LoadUserProperty];
    
    
    
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
   
    
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

#pragma mark - keyboard Delegates

- (void)keyboardDidShow: (NSNotification *) notif
{
   
}

- (void)keyboardDidHide: (NSNotification *) notif
{
       
     [self.scrView scrollRectToVisible:CGRectMake(0, 0, 768, 1004) animated:YES];
    
}




#pragma mark- App Methods

-(void)backButtonClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)Attachphoto
{
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"Lindy Property" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"From Camera" otherButtonTitles:@"From Album",nil];
    action.delegate=self;
    action.actionSheetStyle = UIActionSheetStyleAutomatic;
    [action showInView:self.view];
    
}



-(void)postmessage
{
    
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    

    messagechek=YES;
    
    NSString *Message= [NSString stringWithFormat:@"%@ Created Incident Report",objApp.UserName]; 
    
    NSString *temp_url=[NSString stringWithFormat:@"%@/addAlert_service/%@/%@/json",MainUrl,objApp.strUserId,Message];
    
    NSURL *url = [[NSURL alloc]initWithString:[temp_url stringByAddingPercentEscapesUsingEncoding:
                  NSASCIIStringEncoding]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    
    [request setURL:url];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(theConnection) {
        webData = [[NSMutableData data] retain];
    }
    
       
}


-(void) SavebtnClick
{
     [self startSpinner:@"spinner" andDisplay:@"Saving Report.."];
      
   
    
    if (self.txtResidentName.text.length > 0 && self.txtAPT.text.length > 0 && self.txtPhone.text.length > 0 && self.txtPreparedBy.text.length > 0 && self.txtWitness.text.length > 0 && self.txtAddress.text.length > 0 && self.txtPhone1.text.length > 0 && self.txtViewDesc.text.length > 0)
    {
        
        btnNext.enabled=NO;  
                
               
            NSDate *date = [NSDate date];
            NSDateFormatter *outputFormatter1 = [[NSDateFormatter alloc] init];
            [outputFormatter1 setDateFormat:@"MM-dd-yyyy"];
            NSString *strDate = [[NSString alloc]init];
            strDate = [outputFormatter1 stringFromDate:date];
           [outputFormatter1 release];
            
          
          
           
            
       
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
        
   // objParser.strIRProperty = self.txtProperty.text;
    objParser.strIRResiName = self.txtResidentName.text;
    objParser.strIRAPT = self.txtAPT.text ;
    objParser.strIRPhone = [NSString stringWithFormat:@"%@-%@-%@",self.txtPhone.text,self.txtPhone2.text,self.txtPhone3.text];
    objParser.strIRDesc=self.txtViewDesc.text;
    objParser.strIRPreparedBy =self.txtPreparedBy.text;
    objParser.strIRWitness = self.txtWitness.text;
    objParser.strIRAddress = self.txtAddress.text;
    objParser.strIRPhone1 = [NSString stringWithFormat:@"%@-%@-%@",self.txtPhone1.text,self.txtPhone4.text,self.txtPhone5.text];
    objParser.CreationDate=strDate;
           
            
                    
        NSString *url_str = [NSString stringWithFormat:@"%@/addIncidentReport_service/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@", MainUrl,objApp.strUserId,objParser.strIRProperty,objParser.strIRResiName,objParser.strIRAPT,objParser.strIRPhone,objParser.strIRDesc, objParser.strIRPreparedBy,objParser.strIRWitness,objParser.strIRAddress,objParser.strIRPhone1,objParser.CreationDate,objParser.ReportID];
        
          
    NSURL *url = [[NSURL alloc]initWithString:[url_str stringByAddingPercentEscapesUsingEncoding:
                      NSASCIIStringEncoding]];
        
             
             
       
        
        NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
        
        NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
        
        if (theConnection) 
        {
            webData = [[NSMutableData alloc]init];
        }
       
         
        
        
    } 
    else
    {
        [self stopSpinner];
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Lendi Property" message:@"Please fill all information.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];    
        [alt show];
        [alt release];
    }
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

-(void)ImageUpload
{
    [self stopSpinner];
    [self startSpinner:@"spinner" andDisplay:@"Image uploading...."];
    
    NSString *strURL = [NSString stringWithFormat:@"%@image_upload&report_id=%@&report_type=incident_report",SecondUrl,get_reportid];
    
    
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:strURL]];
    [request setDelegate:self];
     [request setTimeOutSeconds:10];
    
    for (int i = 0; i < [ImageArray_temp count]; i++) 
    {
        [request addData:[ImageArray_temp objectAtIndex:i] withFileName:@"image.jpg" andContentType:@"image/jpeg" forKey:[NSString stringWithFormat:@"image%d",i]];
    }	
    [request startSynchronous];
    
    NSError *error = [request error];
    if (!error) 
    {
        NSString *response = [request responseString];
       
    }
	    
}


-(void)LoadUserProperty

{
    
    //  http://50.57.50.220/lindiproperty/index.php/lindiproperty/getProperty_service/108
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







-(void)OpenPOP
{
    
    viewControllerTest = [[UIViewController alloc]init];
    viewControllerTest.view.backgroundColor = [UIColor colorWithRed:(float)(255.00/255) green:(float)(204.00/255) blue:(float)(153.00/255) alpha:1];
    
    
    tblViewTest = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, 500, 480) style:UITableViewStylePlain];
    
    CGRect frame = tblViewTest.frame;
    frame.size.height = MIN(40 * [PikerArray count], 480); // 400 is the maximum height that the table view can have. You can change it to whatever you like
    tblViewTest.frame = frame;
    
    
    tblViewTest.backgroundColor = [UIColor clearColor];
    tblViewTest.tag = 2;
    tblViewTest.delegate = self;
    tblViewTest.dataSource = self;
    
    [viewControllerTest.view addSubview:tblViewTest];
    
    
    lblHeaderTest = [[UILabel alloc]init];
    lblHeaderTest.frame=CGRectMake(0, 0, tblViewTest.frame.size.width, 30);
    lblHeaderTest.backgroundColor = [UIColor clearColor];
    lblHeaderTest.textColor = [UIColor blackColor];
    lblHeaderTest.font=[UIFont boldSystemFontOfSize:20];
    lblHeaderTest.textAlignment = UITextAlignmentCenter;
    [viewControllerTest.view addSubview:lblHeaderTest];
    lblHeaderTest.text=@"User Properties";
        
        
    
    
    
    
    close_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    close_btn.frame=CGRectMake(tblViewTest.frame.size.width-50, 10, 30, 25);
    [close_btn setImage:[UIImage imageNamed:@"Cross btn.png"] forState:UIControlStateNormal];
    [close_btn addTarget:self action:@selector(closebtn_click) forControlEvents:UIControlEventTouchUpInside];
    [viewControllerTest.view addSubview:close_btn];
    
    popView = [[UIPopoverController alloc]initWithContentViewController:viewControllerTest];
    
    
    
    // CGSize tableViewSize=tblViewTest.contentSize;
    
    
    
            
        popView.popoverContentSize = CGSizeMake(tblViewTest.frame.size.width, tblViewTest.frame.size.height+80.0);
       
        
        
}

-(IBAction)PropertyClick

{
    
    [tblViewTest reloadData];
    popView.popoverContentSize = CGSizeMake(tblViewTest.frame.size.width, tblViewTest.frame.size.height+80.0);
    [popView presentPopoverFromRect:CGRectMake(350,80, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
}

- (void)closebtn_click

{
    [popView dismissPopoverAnimated:YES];
    
}


#pragma mark - Image Upload Delegates


- (void)requestFinished:(ASIHTTPRequest *)request

{
    
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Report is Saved With Image" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Alert show];
        [Alert release];
        [self postmessage];
        
   
    
    
    
    
    
	
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
   
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
        ImageArray_temp=[[NSMutableArray alloc]init];
    
     temp_img =[info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
   /* image_Data=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 90)];//
    
    [ImageArray_temp addObject:image_Data];
       
        
    UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Do Want To Take Another Picture" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
    [Alert show];
    Alert.tag=1;
    [Alert release];*/
        
    
    Cameradic=[[NSMutableDictionary alloc]initWithDictionary:info];
    
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
         phototype=1;
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
        image_Data=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 0.5)];
        [ImageArray_temp addObject:image_Data];
        
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Do Want To Take Another Picture" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
        [Alert show];
        Alert.tag=1;
        [Alert release];
        
        
    }
    
    
    else if([title isEqualToString:@"Medium"])
        
    {
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"];
        image_Data=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 1)];
        [ImageArray_temp addObject:image_Data];
        
        
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Do Want To Take Another Picture" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
        [Alert show];
        Alert.tag=1;
        [Alert release];
    }
    
    
    
    else if([title isEqualToString:@"Actual Size"])
        
    {
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"]; 
        
        image_Data=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 2)];
        [ImageArray_temp addObject:image_Data];
        
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

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info {
	
	[self dismissModalViewControllerAnimated:YES];
	//int i=1;
    ImageArray_temp=[[NSMutableArray alloc]init];
    for(NSDictionary *dict in info) 
    {
        
      
       temp_img=[dict objectForKey:UIImagePickerControllerOriginalImage];
       image_Data=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 90)];
       [ImageArray_temp addObject:image_Data];
        
    }
}
- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker {
    
	[self dismissModalViewControllerAnimated:YES];
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
    
    if (textField.tag == 5 || textField.tag == 6 || textField.tag == 7 || textField.tag == 8  || textField.tag==10 || textField.tag==9)
    {
        [self.scrView scrollRectToVisible:CGRectMake(0, 200, 768, 1004) animated:YES];
    }
    else
    {
        [self.scrView scrollRectToVisible:CGRectMake(0, 0, 768, 1004) animated:YES];
    }
    return YES;
}


-(void) textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 5 || textField.tag == 6 || textField.tag == 7 || textField.tag == 8  || textField.tag==10 || textField.tag==9)
    {
        [self.scrView scrollRectToVisible:CGRectMake(0, 200, 768, 1004) animated:YES];
    }
    
    
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string    
{
    
    if(textField.tag==1 || textField.tag==2 || textField.tag==3 || textField.tag==8 || textField.tag==9 || textField.tag==10)
    {
        
        NSString *nameRegex =@"[0-9-.]"; 
        NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex]; 
        BOOL isNumber=[nameTest evaluateWithObject:string];
        
        if(isNumber == YES || [string isEqualToString:@""]) 
        {

        
            if(textField.tag==1)
            {
                if (textField.text.length ==3 )
                {
                    [txtPhone2 becomeFirstResponder]; // return NO to not change text
                }
                else
                {
                    return YES;
                }
            
            }
        
            if(textField.tag==2)
            {
                if (textField.text.length ==3 )
                {
                
                    [txtPhone3 becomeFirstResponder]; // return NO to not change text
                
                }
                else
                {
                
                return YES;
                
                }
            
            
        }
        
        
            if(textField.tag==3)
            {
            
                if (textField.text.length <=2 )
                {
                
                    return YES;
                }
            
                else
                {         
                
                    hidedata=YES;
                    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(hide)userInfo:nil repeats:NO];
                    return YES;
                    
                }
            
            }
            if(textField.tag==8)
            {
            
                if (textField.text.length ==3 )
                {
                
                    [txtPhone4 becomeFirstResponder]; // return NO to not change text
                
                }
            
                else
                {
                
                    return YES;
                
                }
            
            
            
            }
            if (textField.tag==9) 
            {
                
                if (textField.text.length ==3 )
                {
                
                    [txtPhone5 becomeFirstResponder]; // return NO to not change text
                
                }
            
                else
                {
                
                    return YES;
                
                }
            
            
            }
        
            if (textField.tag==10) 
            {
           

                if (textField.text.length <=2 )
                {
                
                    return YES;
                }
            
                else
                {         
                    hidedata=NO;
                    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(hide)userInfo:nil repeats:NO];
                    return YES;

                }
            
            }
        
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
return YES;
}
-(void)hide
{
    if(hidedata==YES)
    {
        [txtPhone3 resignFirstResponder];
    }
    else
    {
        
        [self.scrView scrollRectToVisible:CGRectMake(0,0,768,1004) animated:YES];
        [txtPhone5 resignFirstResponder]; // return NO to not change text
        
    }
    
}

#pragma mark- UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
           
        return [PikerArray count];
      
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    tableView.separatorColor = [UIColor blackColor];
    
    cell.contentView.backgroundColor = [UIColor colorWithRed:(float)(187.00/255) green:(float)(224.00/255) blue:(float)(227.00/255) alpha:1];
    
    UIView* myBackgroundView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    
    myBackgroundView.backgroundColor =  [UIColor colorWithRed:(float)(187.00/255) green:(float)(224.00/255) blue:(float)(227.00/255) alpha:1];
    
    cell.backgroundView = myBackgroundView;
    
    cell.textLabel.text = [PikerArray objectAtIndex:indexPath.row];
        
      
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 50;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 

{
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    
    if (selectedCell.accessoryType == UITableViewCellAccessoryNone)
        
    {
        
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
        Propertylbl.text=[PikerArray objectAtIndex:indexPath.row];
        objParser.strIRProperty=[propertyid objectAtIndex:indexPath.row];
        [popView dismissPopoverAnimated:YES];
        selectedCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
}

#pragma mark- UITextView Delegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [self.scrView scrollRectToVisible:CGRectMake(0,0,768,1004) animated:YES];
	return YES;
}


- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
	[textView resignFirstResponder];
	return YES;
}






#pragma mark - Image Orientation Delegates


- (UIImage *)fixOrientation 
{
    
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
         
    if(messagechek ==YES)
    {
        [self stopSpinner];
        [webData release];
        [connection release];
    }
    else
    {
        [self stopSpinner];
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
            
                                                
                        [self OpenPOP];
                        [self stopSpinner];
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
            btnNext.enabled=YES;
            [self.navigationController dismissModalViewControllerAnimated:YES];    
        
        }
        else
        {
            NSString *jsonStr = [[NSString alloc] 
                             initWithData:webData                         
                             encoding:NSASCIIStringEncoding];
        
            SBJsonParser *parser = [[SBJsonParser alloc] init];
            
            NSDictionary *jsondic = [parser objectWithString:jsonStr];
        
            get_reportid=[NSString stringWithFormat:@"%@",[jsondic valueForKey:@"report_id"]];
        
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

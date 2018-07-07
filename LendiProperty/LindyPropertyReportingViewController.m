//
//  LindyPropertyReportingViewController.m
//  LendiProperty
//
//  Created by Vinay Devdikar on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LindyPropertyReportingViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "JSON.h"
#import "LendiPropertyAppDelegate.h"
#import "ServiceAlertDetailVC.h"
#import "InclemnetWeatherReportController.h"
#import "WeeklyManagerReportViewConroller.h"
#import "ReportSelectionViewController.h"
@implementation LindyPropertyReportingViewController

@synthesize lblHeader,DateMessageLabel,FirstMessageLabel,SecondMessageLabel;

@synthesize tblView;

@synthesize txtView,txtDate,txtProperty,txtdate1,txtdate2;

@synthesize spinnerView,imgView;

@synthesize spinnerlandscape;

@synthesize CreateNewReportebtn,ViewReportbtn,PhotoAlbumbtn,Sendmsgbtn,SendAlertbtn,viewalertbtn;

@synthesize ImageVie;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        Imagearr=[[NSMutableArray alloc]init];
        ImageArray_temp=[[NSMutableArray alloc]init];
        
        
        
        
        
        
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
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
 
    self.txtProperty.frame=CGRectMake(190, 469, 424, 37);
    
   Logout_btn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(LogoutbtnClick)];
    self.navigationItem.leftBarButtonItem=Logout_btn;

 
    
    if ([objApp.strOriantation isEqualToString:@"LandscapeLeft"]||[objApp.strOriantation isEqualToString:@"LandscapeRight"]) 
    {
        
        [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
 
    }
    
    else
    {
        
        [self startSpinner:@"spinner" andDisplay:@"Loading.."];
        
    }
    
    
    
    
   self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
    self.lblHeader.backgroundColor = [UIColor colorWithRed:(float)(187.00/255) green:(float)(224.00/255) blue:(float)(227.00/255) alpha:1];
    
    self.tblView.backgroundColor = [UIColor clearColor];
     arrName = [[NSArray alloc]initWithObjects:@"Create New Report",@"View Report",@"Photo Album",@"Send Message",@"Send Alert", nil];
    
    arrNameTest = [[NSArray alloc]initWithObjects:@"Property Manager Report",@"Incident Report",@"Inclement Weather Report",@"Apartment Damage Inspection",@"Daily Activity ChekLists",@"Leasing Agent",@"Weekly Manager Report", nil];
    //,@"Apartment Inspection"
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    // Return YES for supported orientations
	if(interfaceOrientation==UIInterfaceOrientationLandscapeRight || interfaceOrientation==UIInterfaceOrientationLandscapeLeft ||interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown)
    {
        if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        {
            LandScapebool=YES;
            objApp.strOriantation = @"LandscapeLeft";
            objApp.chkorientation=YES;
            [self rotatingLandscape];
        }
        
        if (interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            LandScapebool=YES;
            objApp.strOriantation = @"LandscapeRight";
            objApp.chkorientation=YES;
            [self rotatingLandscape];
            
        }
        
        if (interfaceOrientation == UIInterfaceOrientationPortrait)
        {
            LandScapebool=NO;
            objApp.strOriantation = @"Portrait";
            [self rotatingPotrait];
            
            
        }
        
        if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        { 
            LandScapebool=NO;
            objApp.strOriantation = @"PortraitUpsideDown";
            [self rotatingPotrait];
            
        }
    }
    return YES;
}
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
   
    
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait )
    {
        
        LandScapebool=NO;
        objApp.strOriantation = @"Portrait";
        [self rotatingPotrait];
        
    }
    
    
    else if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        
    {
        LandScapebool=NO;
        objApp.strOriantation = @"PortraitUpsideDown";
        [self rotatingPotrait];
    }
    
    else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft )
    {
        LandScapebool=YES;
        objApp.strOriantation = @"LandscapeLeft";
        objApp.chkorientation=YES;
        [self rotatingLandscape];
    }
    else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeRight )
    {
        
        LandScapebool=YES;
        objApp.strOriantation = @"LandscapeRight";
        objApp.chkorientation=YES;
        [self rotatingLandscape];
        
    }
    
}



- (BOOL)shouldAutorotate
{
    return NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title=@"DashBoard";
    
    
    NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@/alert_service/json",MainUrl]];
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
    
    if (theConnection) 
    {
        webData = [[NSMutableData alloc]init];
    }
    else
    {
      
    }
    
    NSString *version = [[UIDevice currentDevice] systemVersion];
    int ver_val = [version intValue];
   
    
    if(ver_val >=6.0 ){
    
               
        LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
        
        
        
        if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait )
        {
            
            LandScapebool=NO;
            objApp.strOriantation = @"Portrait";
            [self rotatingPotrait];
            
        }
        
        
        else if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)
            
        {
            LandScapebool=NO;
            objApp.strOriantation = @"PortraitUpsideDown";
            [self rotatingPotrait];
        }
        
        else if([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft )
        {
            LandScapebool=YES;
            objApp.strOriantation = @"LandscapeLeft";
            objApp.chkorientation=YES;
            [self rotatingLandscape];
        }
        else if([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight )
        {
            
            LandScapebool=YES;
            objApp.strOriantation = @"LandscapeRight";
            objApp.chkorientation=YES;
            [self rotatingLandscape];
            
        }

        
        
    }
    else{

      
        if ([[UIDevice currentDevice]orientation] == UIInterfaceOrientationLandscapeLeft){
        [self shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft];
        }
        if ([[UIDevice currentDevice]orientation] == UIInterfaceOrientationLandscapeRight){
        [self shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeRight];
        }
        if ([[UIDevice currentDevice]orientation] == UIInterfaceOrientationPortrait){
        [self shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortrait];
        }
        if ([[UIDevice currentDevice]orientation] == UIInterfaceOrientationPortraitUpsideDown){
        [self shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown];
        }
    }
    
    
}

#pragma mark- App Methods

-(void)LogoutbtnClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) openPOP:(int)_tag
{
    switch (_tag)
    {
        case 0:
            
            [self showViewController:_tag];

            break;
        case 1:
            
            [self showViewController:_tag];
            
            break;
        case 2:
            
            alt = [[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Work In Progress.." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alt show];
            
            break;
        case 3:
            
            [self openMail];
            
            break;
        case 4:
            
            alt = [[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Work In Progress.." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alt show];

            break;

        default:
            break;
    }
}

-(void) openMail
{

	if([MFMailComposeViewController canSendMail]) { 
		mailViewController = [[MFMailComposeViewController alloc] init]; 
		mailViewController.mailComposeDelegate = self;
		[mailViewController setSubject:@"Contact from iPhone app"];
        mailViewController.modalPresentationStyle = UIModalPresentationFullScreen;
		[self presentModalViewController:mailViewController animated:YES]; 
		
	}
	else{ 
		
		
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry !" message:@"Your device is not ready to send mail." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
		[alert show]; 
	}
}


-(void) showViewController:(int)_int
{
    viewControllerTest = [[UIViewController alloc]init];
    viewControllerTest.view.backgroundColor = [UIColor colorWithRed:(float)(255.00/255) green:(float)(204.00/255) blue:(float)(153.00/255) alpha:1];
    
    
    lblHeaderTest = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    lblHeaderTest.backgroundColor = [UIColor clearColor];
    lblHeaderTest.textColor = [UIColor blackColor];
    lblHeaderTest.textAlignment = UITextAlignmentCenter;
    if (_int == 0)
    {
        lblHeaderTest.text = @"New Report";
    }
    else if(_int == 1)
    {
        lblHeaderTest.text = @"View Report";
    }
    [viewControllerTest.view addSubview:lblHeaderTest];
    
    tblViewTest = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, 320, 350) style:UITableViewStylePlain];
    tblViewTest.backgroundColor = [UIColor clearColor];
    tblViewTest.tag = 2;
    tblViewTest.delegate = self;
    tblViewTest.dataSource = self;
    [tblViewTest reloadData];
    
    [viewControllerTest.view addSubview:tblViewTest];
     
    close_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    close_btn.frame=CGRectMake(280, 5, 30, 25);
    [close_btn setImage:[UIImage imageNamed:@"Cross btn.png"] forState:UIControlStateNormal];
    [close_btn addTarget:self action:@selector(closebtn_click) forControlEvents:UIControlEventTouchUpInside];
    [viewControllerTest.view addSubview:close_btn];
    
    popView = [[UIPopoverController alloc]initWithContentViewController:viewControllerTest];
    popView.popoverContentSize = CGSizeMake(320,400);
    
    if (_int == 0)
    {

        if (LandScapebool==YES) 
        {
            [popView presentPopoverFromRect:CGRectMake(410,570, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
        }
        else {
           [popView presentPopoverFromRect:CGRectMake(160,780, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
        }
         
    }
    else if(_int == 1)
    {

        if (LandScapebool==YES) 
        {
           [popView presentPopoverFromRect:CGRectMake(570,570, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES]; 
        }
        else 
        {
          [popView presentPopoverFromRect:CGRectMake(240,800, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
        }
        

    }
    

}


-(void) openNextVC:(int)_vcTag
{
        switch (_vcTag)
        {
            case 0:
                if (IsWork == YES)
                {
                    [popView dismissPopoverAnimated:YES];
                    
                    objPropManVC = [[PropertyManagerViewController alloc]init];
                    
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:objPropManVC];
                    
                    [self.navigationController presentModalViewController:navBar animated:YES];
                    
                    
                   
                    
                    
                } 
                else
                {
                    [popView dismissPopoverAnimated:YES];
                    
                    ReportSelectionViewController *objSelectionVC = [[ReportSelectionViewController alloc]initWithTag:1];
    
            
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:objSelectionVC];
                    
                    [self.navigationController presentModalViewController:navBar animated:YES];
                    
                   
                    
                    
                   
                }
                break;
            case 1:
                if (IsWork == YES)
                {
                    [popView dismissPopoverAnimated:YES];
                    
                    objIncidentVC = [[IncidentReportViewController alloc]initWithNibName:@"IncidentReportViewController" bundle:Nil];
                    
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:objIncidentVC];
                    
                    [self.navigationController presentModalViewController:navBar animated:YES];
                    
                    
                    
                    
                } 
                else
                {
                    [popView dismissPopoverAnimated:YES];
                    
                   ReportSelectionViewController *objSelectionVC = [[ReportSelectionViewController alloc]initWithTag:2];    
                    
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:objSelectionVC];
                    
                    [self.navigationController presentModalViewController:navBar animated:YES];

                  
                    
                    
                }
                break;
            case 2:
                
                if (IsWork == YES)
                {
                    [popView dismissPopoverAnimated:YES];
                    
                    InclemnetWeatherReportController *incview_obj=[[InclemnetWeatherReportController alloc]init];
                    
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:incview_obj];
                    
                    [self.navigationController presentModalViewController:navBar animated:YES];

                 

                } 
                else
                {
                    [popView dismissPopoverAnimated:YES];
                    
                     ReportSelectionViewController *objSelectionVC = [[ReportSelectionViewController alloc]initWithTag:3];
                                       
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:objSelectionVC];
                    
                    [self.navigationController presentModalViewController:navBar animated:YES];

                  
                                   
                }
                
                      
                break;
            case 3:
                
                if (IsWork == YES)
                {
                    [popView dismissPopoverAnimated:YES];
                    ApartmentInspectionViewController *objAprtInsp=[[ApartmentInspectionViewController alloc]init];
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:objAprtInsp];
                    [self.navigationController presentModalViewController:navBar animated:YES];
                    
                }
                
                else
                    
                {
                    [popView dismissPopoverAnimated:YES];
                    ReportSelectionViewController *objSelectionVC = [[ReportSelectionViewController alloc]initWithTag:7];
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:objSelectionVC];
                    [self.navigationController presentModalViewController:navBar animated:YES];
                    
                }
                break;

                
                
            case 4:
             
                if (IsWork == YES)
                {
                    
                    [popView dismissPopoverAnimated:YES];
                    DailyAct_obj=[[DailyActivityCheklistViewController alloc]init];
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:DailyAct_obj];
                    [self.navigationController presentModalViewController:navBar animated:YES];
                }
                
                else
                {
                    
                    [popView dismissPopoverAnimated:YES];
                    ReportSelectionViewController *objSelectionVC = [[ReportSelectionViewController alloc]initWithTag:4];
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:objSelectionVC];
                    [self.navigationController presentModalViewController:navBar animated:YES];

                }
                break;
                
            case 5:
                
                if (IsWork == YES)
                {
                    
                    [popView dismissPopoverAnimated:YES];
                    LeaseProperty_Obj=[[ LeasingAgentReportController alloc]init];
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:LeaseProperty_Obj];
                    [self.navigationController presentModalViewController:navBar animated:YES];
                    
                    
                    
                }
                else
                {
                    
                    [popView dismissPopoverAnimated:YES];
                    ReportSelectionViewController *objSelectionVC = [[ReportSelectionViewController alloc]initWithTag:5];
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:objSelectionVC];
                    [self.navigationController presentModalViewController:navBar animated:YES];
                                 
                    
                }

                
                
                break;
            case 6:
                
                if (IsWork == YES)
                {
                    [popView dismissPopoverAnimated:YES];
                    
                    WeeklyManagerReportViewConroller *Obj_WeekRM=[[WeeklyManagerReportViewConroller alloc]init];
                    
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:Obj_WeekRM];
                    
                    [self.navigationController presentModalViewController:navBar animated:YES];
                    
                    
                }
                else
                {
                    [popView dismissPopoverAnimated:YES];
                    
                    ReportSelectionViewController *objSelectionVC = [[ReportSelectionViewController alloc]initWithTag:6];
                    
                    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:objSelectionVC];
                    
                    [self.navigationController presentModalViewController:navBar animated:YES];
                }

                break;
            case 7:
                
                break;
            default:
                break;
        }
}
-(IBAction)clickCreateNewReport:(id)sender
{
     IsWork = YES;
    [self openPOP:0];
    

}
-(IBAction)clickViewReport:(id)sender
{
     IsWork = NO;
    [self openPOP:1];
    

}
-(IBAction)clickPhotoAlbum:(id)sender

{
    
    PhotoLibraryViewController *Imag_obj=[[PhotoLibraryViewController alloc]init];
    
    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:Imag_obj];
    [self.navigationController presentModalViewController:navBar animated:YES];
    
//    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"Lindy Property" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Take Photo" otherButtonTitles:@"View Photo",nil];
//    action.delegate=self;
//    action.actionSheetStyle = UIActionSheetStyleAutomatic;
//    [action showInView:self.view];
    
    
}

-(IBAction)clickSendMessage:(id)sender

{
     [self openMail];
}

-(IBAction)clickSendAlert:(id)sender
{
     AlertMessageViewController *obj_alert=[[AlertMessageViewController alloc]init];
    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:obj_alert];
    [self.navigationController presentModalViewController:navBar animated:YES];
      
}
-(IBAction)vieAlertServices:(id)sender
{
    ServiceAlertDetailVC *alertdetails=[[ServiceAlertDetailVC alloc]init];
     UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:alertdetails];
    [self presentModalViewController:navBar animated:YES];
}

-(void) rotatingPotrait
{
    self.imgView.frame = CGRectMake(0, 0, 768, 1024);
    self.imgView.image = [UIImage imageNamed:@"Portrait_1.png"];
    self.txtProperty.frame=CGRectMake(190,469,424,36);
    self.txtView.frame=CGRectMake(195,601,414,120);
    self.CreateNewReportebtn.frame=CGRectMake(62,480,142,42);
    self.ViewReportbtn.frame=CGRectMake(221,480,142,42);
    self.PhotoAlbumbtn.frame=CGRectMake(377,480,142,41);
    self.Sendmsgbtn.frame=CGRectMake(535,480,143,43);
    self.SendAlertbtn.frame=CGRectMake(297,550,142,42);
    self.txtDate.frame=CGRectMake(190, 546, 93, 37);
    self.txtdate1.frame=CGRectMake(308, 546, 88, 37);
    self.txtdate2.frame=CGRectMake(429, 546, 88, 37);
    self.viewalertbtn.frame=CGRectMake(621, 850, 94, 27);
    
    self.FirstMessageLabel.frame=CGRectMake(180, 640, 500, 50);
    self.SecondMessageLabel.frame=CGRectMake(180, 690, 500, 50);
    self.DateMessageLabel.frame=CGRectMake(180, 740, 500, 50);
    Portiatebool=YES;

    
}
-(void) rotatingLandscape
{
    self.imgView.frame = CGRectMake(0, 0, 1024, 768);
    self.imgView.image = [UIImage imageNamed:@"Landscape12.png"];
    self.txtProperty.frame=CGRectMake(492,267,424,37);
    self.txtView.frame=CGRectMake(492,395,418,120);
    self.CreateNewReportebtn.frame=CGRectMake(364,300,142,42);
    self.ViewReportbtn.frame=CGRectMake(521,300,142,42);
    self.PhotoAlbumbtn.frame=CGRectMake(677,300,142,41);
    self.Sendmsgbtn.frame=CGRectMake(835,300,143,43);
    self.SendAlertbtn.frame=CGRectMake(597,380,142,42);
   
    self.txtDate.frame=CGRectMake(492, 340, 93, 37);
    self.txtdate1.frame=CGRectMake(612, 340, 88, 37);
    self.txtdate2.frame=CGRectMake(730, 340, 88, 37);
    self.viewalertbtn.frame=CGRectMake(920, 620, 98, 27);
    self.FirstMessageLabel.frame=CGRectMake(480, 450, 500, 50);
    self.SecondMessageLabel.frame=CGRectMake(480, 500, 500, 50);
    self.DateMessageLabel.frame=CGRectMake(480, 550, 500, 50); 
}




-(void)closebtn_click
{
     [popView dismissPopoverAnimated:YES];
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
      //  [imagePicker release];

        
             
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

        
         NSLog(@"version is 6.0");
        
    }
    
    
    /*
    
                  
    
   */
       
    
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
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    
  
  
  /* temp_img=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
   app=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
   app.Camera_img=[self  fixOrientation];
   
    imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self  fixOrientation], 2)];
    [ImageArray_temp addObject:imageData];
    
    
    
    [self dismissModalViewControllerAnimated:YES];*/
    
    
    Cameradic=[[NSMutableDictionary alloc]initWithDictionary:info];
    
    [picker dismissModalViewControllerAnimated:YES];
    
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"You can reduce the size of scalling image to one of the size below." delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Small" otherButtonTitles:@"Medium",@"Actual Size",nil];
    action.delegate=self;
    action.tag=1;
    action.actionSheetStyle = UIActionSheetStyleAutomatic;
    [action showInView:self.view];

    
    
    
    
    
   /* Camera_ImageViewController *Camera_obj=[[Camera_ImageViewController alloc]initWithMutableArray:ImageArray_temp];
    
    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:Camera_obj];
    
    [self.navigationController presentModalViewController:navBar animated:YES];
    
  */
   


    
    
    
    
    

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

#pragma mark- UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1)
    {
        return [arrName count];
    }
    else //if (tableView.tag == 2)
    {
        return [arrNameTest count];
    }
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    tableView.separatorColor = [UIColor blackColor];
    
    cell.contentView.backgroundColor = [UIColor colorWithRed:(float)(187.00/255) green:(float)(224.00/255) blue:(float)(227.00/255) alpha:1];
    if (tableView.tag == 1)
    {
        cell.textLabel.text = [arrName objectAtIndex:indexPath.row];
    }
    else if (tableView.tag == 2)
    {
        cell.textLabel.text = [arrNameTest objectAtIndex:indexPath.row];
    }
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
      
    if (tableView.tag == 1)
    {
        if (indexPath.row == 0)
        {
            IsWork = YES;
        }
        else
        {
            IsWork = NO;
        }
        
        [self openPOP:indexPath.row];
    }
    else
    {
        [self openNextVC:indexPath.row];
    }
}



#pragma mark -
#pragma mark MFMailComposeResult Method

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	
	if(result == MFMailComposeResultCancelled)
		
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"E-mail cancelled" message:@"No message was sent." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
		[alert show];
	}
	
	else if (result == MFMailComposeResultSaved)
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Mail Saved" message:@"The email message was saved in the user's Drafts folder" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
		[alert show];
		//[alert release];
	} 
	
	else if (result == MFMailComposeResultSent)
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Succeed" message:@"Your mail has been sent." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil]; 
		[alert show];
	}
	else 
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Failed" message:@"The email message has not been sent due to network problem." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];		
		[alert show];
	}
	[self dismissModalViewControllerAnimated:YES];
}


#pragma mark- UITextFeild Delegate

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag == 2)
    {
        [self.txtProperty resignFirstResponder];
        return NO;
    }
    else
    {
        return YES;
    }
}



#pragma mark- UITextView Delegate

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return NO;
}


#pragma mark - Alert View Delegates

-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alertView.tag==1)
    
    {
        
        if (buttonIndex==0)
        
        {
         
            [self Getimage];
            
        }
        
        
        else if(buttonIndex==1)
            
        {
            
            
            
            
            Camera_ImageViewController *Camera_obj=[[Camera_ImageViewController alloc]initWithMutableArray:ImageArray_temp];
            [self.navigationController pushViewController:Camera_obj animated:YES];
            
            
        }
        
        
        
        
        
    }
    
    
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
    if(LandScapebool==YES)
    {
        [self stopSpinnerforlandscape];
    }
    else 
    {
        [self stopSpinner];
        
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Internet connection is down,please try again after some time." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];             
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
        
      
        
        if ([str isEqualToString:@"1"])
        {
            if(LandScapebool==YES)
            {
                [self stopSpinnerforlandscape];
            }
            else 
            {
                [self stopSpinner];
                
            }
            
            
         
           
            
            NSMutableArray *dictResult=[[NSMutableArray alloc]init];
            NSMutableArray *DateArray=[[NSMutableArray alloc]init];
            NSMutableArray *MessageArray=[[NSMutableArray alloc]init];
            dictResult=[jsondic valueForKey:@"result"];
            
            if([dictResult count]>0)
            {
            
            
            
            for (int i=0; i<[dictResult count]; i++)
            {
                
        [DateArray addObject:[[dictResult objectAtIndex:i] valueForKey:@"date"]];
        [MessageArray addObject:[[dictResult objectAtIndex:i] valueForKey:@"message"]];
        
                
            }
           
            
                NSString *FirstDate;
                NSString *SecondDate;
                NSString *ThirdDate;
                NSString *FirstMessage;
                NSString *SecondMessage;
                
                
                if ([MessageArray count]==1)
                    
                {
                    FirstDate=[DateArray objectAtIndex:0];
                    FirstDate=[FirstDate stringByReplacingOccurrencesOfString:@"." withString:@"/"];
                    
                    FirstMessage=[NSString stringWithFormat:@"%@ %@",FirstDate,[MessageArray objectAtIndex:0]];
                    
                    self.FirstMessageLabel.text=FirstMessage;
                   
                }   
                
                else if([MessageArray count]==2)
                    
                {
                    FirstDate=[DateArray objectAtIndex:0];
                    SecondDate=[DateArray objectAtIndex:1];
                    
                    FirstDate=[FirstDate stringByReplacingOccurrencesOfString:@"." withString:@"/"];
                    SecondDate=[SecondDate stringByReplacingOccurrencesOfString:@"." withString:@"/"];
                    
                    FirstMessage=[NSString stringWithFormat:@"%@ %@",FirstDate,[MessageArray objectAtIndex:0]];
                    SecondMessage=[NSString stringWithFormat:@"%@ %@",SecondDate,[MessageArray objectAtIndex:1]];
                    
                    self.FirstMessageLabel.text=FirstMessage;
                    self.SecondMessageLabel.text=SecondMessage;
                }
                
                else if([MessageArray count]>0)
                    
                {
                    
                    FirstDate=[DateArray objectAtIndex:0];
                    SecondDate=[DateArray objectAtIndex:1];
                    ThirdDate=[DateArray objectAtIndex:2];
                    
                    FirstDate=[FirstDate stringByReplacingOccurrencesOfString:@"." withString:@"/"];
                    SecondDate=[SecondDate stringByReplacingOccurrencesOfString:@"." withString:@"/"];
                    ThirdDate= [ThirdDate stringByReplacingOccurrencesOfString:@"." withString:@"/"];
                    
                    
                    FirstMessage=[NSString stringWithFormat:@"%@ %@",FirstDate,[MessageArray objectAtIndex:0]];
                    SecondMessage=[NSString stringWithFormat:@"%@ %@",SecondDate,[MessageArray objectAtIndex:1]];
                     Finalstr=[NSString stringWithFormat:@"%@ %@",ThirdDate,[MessageArray objectAtIndex:2]];
                    
                    self.FirstMessageLabel.text=FirstMessage;
                    self.SecondMessageLabel.text=SecondMessage;
                    self.DateMessageLabel.text=Finalstr; 
                    
                    
                }
                
                         
                
                
                
                
                
       
       
      
            
            
           
                   
            }
                
        }
            
        else
        {
            if(LandScapebool==YES)
            {
                [self stopSpinnerforlandscape];
            }
            else 
            {
                [self stopSpinner];
                
            }
            
            UIAlertView *alt55 = [[UIAlertView alloc]initWithTitle:@"Lindi Property" message:@"Please Check The Internet Connection Or Wifi..." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alt55 show];
        }
    }
}


#pragma mark - ActionSheet Delegates

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	
    
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if (title==@"")
        
    {
        [actionSheet dismissWithClickedButtonIndex:[title intValue] animated:YES];
    }
	
    else if([title isEqualToString:@"Take Photo"])
        
    {
         phototype=1;
        [self Getimage];
           
        
    }
    
    else if([title isEqualToString:@"View Photo" ])
        
    {
        
        
        PhotoLibraryViewController *Imag_obj=[[PhotoLibraryViewController alloc]init];
        
        UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:Imag_obj];
        [self.navigationController presentModalViewController:navBar animated:YES];
              
    }
    
    else if([title isEqualToString:@"From Album"])
    {
        phototype=2;
        [self Getimage];

    
    }
    
    
    else if([title isEqualToString: @"Small"])
        
    {
        
        
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        app=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
        app.Camera_img=[self  fixOrientation];
        
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self  fixOrientation], 0.5)];
        [ImageArray_temp addObject:imageData];
        
        Camera_ImageViewController *Camera_obj=[[Camera_ImageViewController alloc]initWithMutableArray:ImageArray_temp];
        
        UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:Camera_obj];
        
        [self.navigationController presentModalViewController:navBar animated:YES];
        
        
        
        
    }
    
    
    else if([title isEqualToString:@"Medium"])
        
    {
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        app=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
        
        app.Camera_img=[self  fixOrientation];
        
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self  fixOrientation], 1)];
        [ImageArray_temp addObject:imageData];
        
        
        Camera_ImageViewController *Camera_obj=[[Camera_ImageViewController alloc]initWithMutableArray:ImageArray_temp];
        
        UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:Camera_obj];
        
        [self.navigationController presentModalViewController:navBar animated:YES];
    }
    
    
    
    else if([title isEqualToString:@"Actual Size"])
        
    {
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"]; 
        
        app=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
        
        app.Camera_img=[self  fixOrientation];
        
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self  fixOrientation], 2)];
        [ImageArray_temp addObject:imageData];
        
        Camera_ImageViewController *Camera_obj=[[Camera_ImageViewController alloc]initWithMutableArray:ImageArray_temp];
        
        UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:Camera_obj];
        
        [self.navigationController presentModalViewController:navBar animated:YES];
        
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
	for(NSDictionary *dict in info) 
    {
        
        
       
        temp_img=[dict objectForKey:@"UIImagePickerControllerOriginalImage"];
        app=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
        app.Camera_img=[self  fixOrientation];
        
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self  fixOrientation], 2)];
        [ImageArray_temp addObject:imageData];
        
             
        
      
        
        
    }
    
    [self dismissModalViewControllerAnimated:YES];
    Camera_ImageViewController *Camera_obj=[[Camera_ImageViewController alloc]initWithMutableArray:ImageArray_temp];
    [self.navigationController pushViewController:Camera_obj animated:YES];
    
}
- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker {
    
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

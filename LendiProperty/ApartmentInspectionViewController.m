//
//  ApartmentInspectionViewController.m
//  LendiProperty
//
//  Created by Vinay Devdikar on 9/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ApartmentInspectionViewController.h"

@implementation ApartmentInspectionViewController

@synthesize spinnerView;

@synthesize chekbox1,chekbox2,chekbox3,chekbox4,chekbox5,chekbox6,chekbox7,chekbox8;

@synthesize DecspText;

@synthesize SelectedTableView,DamageTypeTableView,DamageCostTableView;

@synthesize ActivityLbl,Buildinglb,Roomtypelbl,DamageTypelbl,DamageCostlbl;

@synthesize Unitno_txt,Residentname_txt;

@synthesize DamageViewPopup = _DamageViewPopup;

@synthesize ScrollView = _ScrollView;

@synthesize checkedIndexPath,TablesecondIndexpath;

@synthesize Total_lbl = _Totallbl;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
        
    {
        arrayval=0;
        RoomtypeArray=[[NSMutableArray alloc]initWithObjects:@"Dining Room",@"Kitchen",@"Bedroom 1",@"Bedroom 2",@"Bedroom 3",@"Bathroom 1",@"Bathroom 2", nil];
    }
    
    return self;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
       
       
    self.title=@"Apartment Damage Inspection";
    
    chkBox1=NO;
    chkBox2=NO;
    chkBox3=NO;
    chkBox4=NO;
    chkBox5=NO;
    chkBox6=NO;
    chkBox7=NO;
    chkBox8=NO;
    
    
    objParser=[[ParserClass alloc]init];
    
    
    
    UIBarButtonItem* barButtonBack = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    
    [barButtonBack setTitle:@"Back"];
    
    [self.navigationItem setLeftBarButtonItem:barButtonBack];
    
    
    UIBarButtonItem* barButtonSubmit = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStylePlain target:self action:@selector(SubmitButtonClicked)];
    
    [barButtonSubmit setTitle:@"Submit"];
    
    [self.navigationItem setRightBarButtonItem:barButtonSubmit];
    
    
    [self startSpinner:@"spinner" andDisplay:@"Loading.."];
    
    DamageTypeSelectedArray =[[NSMutableArray alloc]init];
    DamageCostSelectedArray=[[NSMutableArray alloc]init];
  
    [self LoadActivites];
    
 
   
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];

    
    

    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    
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
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}


#pragma mark- App Methods


-(void)SetAllArray{
    
    DamageTypeArray=[[NSMutableArray alloc]initWithObjects:@"Painting",@"Carpet",@"Miscellaneous",@"Locks",@"Failure to Return Keys",@"Bathroom",@"Kitchen",@"Doors", nil];
    
    PaintingCostArray =[[NSMutableArray alloc]initWithObjects:@"Open Door Colors per room Repair : $150",@"Holes in Walls each hole Repair : $40",@"Wallpaper Removal per roomRepair : $400",@"Border Removal per room Repair $150", nil];
    
    CarpetCostArray=[[NSMutableArray alloc]initWithObjects:@"Shampoo 1 bedroom : $100" , @"Shampoo 2 bedroom : $150",@"Stain Removal: $50",@"Burns : $150",@"Deodorize : $60",@"Pet Treatment odor: $75",@"Replace Carpet 1 bedroom : $800",@"Replace Carpet 2 bedroom : $1,100", nil];
    
    LockArray=[[NSMutableArray alloc]initWithObjects:@"Remove debris(per bag) Replace: $25",@"Removal of bulk items: Furniture, Bedding etc Replace: $50",@"Clear Storage Locker Clean: $150",@"Closet Shelves Replace: $25",@"Window Sills Replace: $25",@"Window Screen(s) Repair: $25",@"Window Screen(s) Replace: $40",@"Broken Window Glass (per pane) Replace: $50",@"Mini Blind(s) (each) Replace: $25",@"Vertical Blinds Replace: $65",@"Siding Mirror/Glass Door (2) Replace: $200",@"Carbon Monoxide Detector Replace: $50",@"Smoke Detector Alarm Replace: $100",@"Fire extinguisher, cabinet/equipment Replace: $100",@"Vinyl Tile Kitchen/Bathroom Replace: $100",@"Exhaust Fan Clean: $25",@"Exhaust Fan Repair: $50",@"Exhaust Fan Replace: $75",@"Phone Jack Replace: $95",@"Fan Blades/Light Globes Replace: $40",@"Door Inter-Com System Repair: $250",@"Door Inter-Com System Replace:$1,000",@"Switch Plate Covers Replace: $10",@"Railings Replace: $100",@"Outside Lights Replace: $250",@"Stoppage by foreign objects in any drain Replace: $100",@"Thermostat Cover Replace: $25",@"Cleaning of the Apartment: $100",@"Common area damaged during move out Repair : $100",nil];
    
    FailuerToreturnArray=[[NSMutableArray alloc]initWithObjects:@"Door Lock Replace : $25" , @"Door Knob Replace: $25",@"Fix Door when extra lock is removed (Repair): $50",@" Mail Box Lock Replace: $20", nil];
    
    BathroomArray=[[NSMutableArray alloc]initWithObjects:@"Apartment Key Replace: $50" , @"Mail Box Key Replace: $20",nil];
    
    KitchenArray=[[NSMutableArray alloc]initWithObjects:@" Mirror / Medicine Cabinet Repair: $75",@"Mirror / Medicine Cabinet Replace: $100",@"Vanity Cabinet Replace: $200",@"Sink Replace: $75",@"Toilet Tank Cover Replace : $40",@"Toilet Tank Replace: $150",@"Toilet Bowl Replace: $150",@"Complete Toilet Replace: $250",@"Toilet Paper Holder Replace: $20",@"Shower Head Replace: $25",@"Tub Knob(s) Replace: $20",@"Shower Curtain Bar Replace: 25",@"Towel Bar Replace: $25",@"Tab Reglazing Replace: $250",@"Toothbrush Holder Replace: $25",@"Soap Dish (Sink or Tub) Replace: $25",@"Remove Mildew on Tile(s) Clean: $100",@"Cleaning Bathroom Clean: $75",nil];
    
    
    DoorsArray=[[NSMutableArray alloc]initWithObjects: @"Cabinets Clean: $40",@"Cabinets Repair: $50",@"Cabinet Door Repair: $50",@"Cabinet Door Replace: $50",@"Cabinet Handle Replace: $10",@"Counter Top Replace: $300",@"Refrigerator / Freezer Replace: $400",@"Refrigerator Shelf / Bars Replace: $40",@"Refrigerator Drawer(s) Replace: $30",@"Refrigerator Crisper Glass/Plastic Replace: $30",@"Cleaning Refrigerator Clean: $60",@"Dishwasher Rack Replace: $35",@"Dishwasher Silverware Holder Replace: $25",@" Dishwasher Knob Replace: $25",@"Steve Knob Replace : $8",@"Cleaning of Stove Clean: $60",@"Garbage Disposal Replace: $75",@"Rubber Stopper Replace : $5",@"Oven Door Handle Replace : $50",@"Oven Racks Replace : $40",@"Kitchen Sink Replace: $85",@"Faucet Knobs Replace: $20",@"Spout Replace: $20",@"Drip Pan Replace : $10",@"Range Hood Replace : $50",@" Range Top Replace : $150",@"Ceiling Light Fixture Clean : $20",@"Ceiling Light Fixture Repair: $40",@"Ceiling Light Defuser Replace: $25",@"Ceiling Fan Clean: $20",@"Ceiling Fan Replace : $80",nil];
    
    
    MiscellaneousArray=[[NSMutableArray alloc]initWithObjects:@"Apartment Door Repair: $75",@"Mirror / Medicine Cabinet Replace: $100",@"Solid Core & Steel Repair: $125",@"Solid Core & Steel Replace: $250",@"Frame (Jams) Repair: $30",@"Frame (Jams) Replace: $75",@"Hollow Repair: $20",@" Hollow Replace: $40",nil];
    
    
    /* Final Array
     
     
      LockArray=[[NSMutableArray alloc]initWithObjects:@"Remove debris(per bag) Replace: 25",@"Removal of bulk items: Furniture, Bedding etc Replace: 50",@"Clear Storage Locker Clean: 150",@"Closet Shelves Replace: 25",@"Window Sills Replace: 25",@"Window Screen(s) Repair: 25",@"Window Screen(s) Replace: 40",@"Broken Window Glass (per pane) Replace: 50",@"Mini Blind(s) (each) Replace: 25",@"Vertical Blinds Replace: 65",@"Siding Mirror/Glass Door (2) Replace: 200",@"Carbon Monoxide Detector Replace: 50",@"Smoke Detector Alarm Replace: 100",@"Fire extinguisher, cabinet/equipment Replace: 100",@"Vinyl Tile Kitchen/Bathroom Replace: 100",@"Exhaust Fan Clean: 25",@"Exhaust Fan Repair: 50",@"Exhaust Fan Replace: 75",@"Phone Jack Replace: 95",@"Fan Blades/Light Globes Replace: 40",@"Door Inter-Com System Repair: 250",@"Door Inter-Com System Replace: 1,000",@"Switch Plate Covers Replace: 10",@"Railings Replace: 100",@"Outside Lights Replace: 250",@"Stoppage by foreign objects in any drain Replace: 100",@"Thermostat Cover Replace: 25",@"Cleaning of the Apartment: 100",@"Common area damaged during move out Repair : 100",nil];
     
      FailuerToreturnArray=[[NSMutableArray alloc]initWithObjects:@"Door Lock Replace : 25" , @"Door Knob Replace: 25",@"Fix Door when extra lock is removed (Repair): 50",@" Mail Box Lock Replace: 20", nil];
     
     BathroomArray=[[NSMutableArray alloc]initWithObjects:@"Apartment Key Replace: 50" , @"Mail Box Key Replace: 20",nil];
     
     KitchenArray=[[NSMutableArray alloc]initWithObjects:@" Mirror / Medicine Cabinet Repair: 40-75",@"Mirror / Medicine Cabinet Replace: 100",@"Vanity Cabinet Replace: 200",@"Sink Replace: 75",@"Toilet Tank Cover Replace : 40",@"Toilet Tank Replace: 150",@"Toilet Bowl Replace: 150",@"Complete Toilet Replace: 250",@"Toilet Paper Holder Replace: 20",@"Shower Head Replace: 25",@"Tub Knob(s) Replace: 20",@"Shower Curtain Bar Replace: 25",@"Towel Bar Replace: 25",@"Tab Reglazing Replace: 250",@"Toothbrush Holder Replace: 25",@"Soap Dish (Sink or Tub) Replace: 25",@"Remove Mildew on Tile(s) Clean: 100",@"Cleaning Bathroom Clean: 75",nil];
     
     
     DoorsArray=[[NSMutableArray alloc]initWithObjects: @"Cabinets Clean: 40",@"Cabinets Repair: 50",@"Cabinet Door Repair: 50",@"Cabinet Door Replace: 50",@"Cabinet Handle Replace: 10",@"Counter Top Replace: 300",@"Refrigerator / Freezer Replace: 400",@"Refrigerator Shelf / Bars Replace: 40",@"Refrigerator Drawer(s) Replace: 30",@"Refrigerator Crisper Glass/Plastic Replace: 30",@"Cleaning Refrigerator Clean: 60",@"Dishwasher Rack Replace: 35",@"Dishwasher Silverware Holder Replace: 25",@" Dishwasher Knob Replace: 25",@"Steve Knob Replace : 8",@"Cleaning of Stove Clean: 60",@"Garbage Disposal Replace: 75",@"Rubber Stopper Replace : 5",@"Oven Door Handle Replace : 50",@"Oven Racks Replace : 40",@"Kitchen Sink Replace: 85",@"Faucet Knobs Replace: 20",@"Spout Replace: 20",@"Drip Pan Replace : 10",@"Range Hood Replace : 50",@" Range Top Replace : 150",@"Ceiling Light Fixture Clean : 20",@"Ceiling Light Fixture Repair: 40",@"Ceiling Light Defuser Replace: 25",@"Ceiling Fan Clean: 20",@"Ceiling Fan Replace : 80",nil];
     
     
      MiscellaneousArray=[[NSMutableArray alloc]initWithObjects:@"Apartment Door Repair: 75",@"Mirror / Medicine Cabinet Replace: 100",@"Solid Core & Steel Repair: 125",@"Solid Core & Steel Replace: 250",@"Frame (Jams) Repair: 30",@"Frame (Jams) Replace: 75",@"Hollow Repair: 20",@" Hollow Replace: 40",nil];
     
     
     */
    
    
    
    
    
}


-(IBAction)ActivityClcick
{
    if([ActivitesArray count]>0)
    
    {
        lblHeaderTest.text=@"Activites";
        tag=0;
         [tblViewTest reloadData];
        popView.popoverContentSize = CGSizeMake(tblViewTest.frame.size.width, tblViewTest.frame.size.height+80.0);
        [popView presentPopoverFromRect:CGRectMake(500,350, 500, 100) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    }
    
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Activities Are Not Avilable!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        alert.delegate=self;
        [alert release];
        
    }
    
    
    
   
    

    
}



- (void)backButtonClicked:(id)sender

{
    [self dismissModalViewControllerAnimated:YES];
    
}

- (void)closebtn_click

{
    [popView dismissPopoverAnimated:YES];
    
}

-(void)LoadActivites

{
    
 
    activityload=YES;
    NSString *temp_url=[NSString stringWithFormat:@"%@/getAllActivity_service",MainUrl];
    
    
    NSURL *url = [[NSURL alloc]initWithString:[temp_url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:url];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (theConnection) 
    {
        webData = [[NSMutableData alloc]init];
    }
    else
    {
       
    }

    
    
    
    
    
}

- (IBAction)BuildingClick

{
    if ([PikerArray count]>0)
    
    {
        
        tag=1;
         [tblViewTest reloadData];
        lblHeaderTest.text=@"User Properties";
        popView.popoverContentSize = CGSizeMake(tblViewTest.frame.size.width, tblViewTest.frame.size.height+80.0);
        [popView presentPopoverFromRect:CGRectMake(150,350, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
        
    }
    
    
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Properties Are Not Avilable!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        alert.delegate=self;
        [alert release];

    }
    
}

- (IBAction) RoomTypeBtnClick:(id)sender

{
    
    
    tag=2;
    [tblViewTest reloadData];
    lblHeaderTest.text=@"Room Type";
     popView.popoverContentSize = CGSizeMake(tblViewTest.frame.size.width, tblViewTest.frame.size.height+80.0);
    [popView presentPopoverFromRect:CGRectMake(150,400, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
    
    
    
}


- (IBAction) DamageTypeBtnClick:(id)sender

{
    [self SetAllArray];
    
   
     [DamageTypeTableView reloadData];
    [UIView animateWithDuration:0.8 delay:0.0 options:0
                     animations:^{
                         CGPoint point = _DamageViewPopup.center;
                         point.y = point.y - 800;
                         _DamageViewPopup.center = point;
                     }
                     completion:^(BOOL finished) {
                         
                        
//                         tag=4;
//                         [DamageCostTableView reloadData];
                         
                     }];
    
    
    [self.view bringSubviewToFront:_DamageViewPopup];
    
    
    
  //  _DamageViewPopup
    
    
    
   
    
    
    
    
}

-(IBAction)DamagerCost:(id)sender

{
   
    
    if(tag==4  || [DamageTypelbl.text isEqualToString:@"• Painting"] )
        
    {
        
        tag=4;
        [tblViewTest reloadData];
        lblHeaderTest.text=@"Damage Type";
        popView.popoverContentSize = CGSizeMake(500,250);
        [popView presentPopoverFromRect:CGRectMake(150,450, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
    }
    
    else if(tag==5 || [DamageTypelbl.text isEqualToString:@"• Carpet"])
        
    {
        
        tag=5;
        [tblViewTest reloadData];
        lblHeaderTest.text=@"Damage Type";
        popView.popoverContentSize = CGSizeMake(tblViewTest.frame.size.width, tblViewTest.frame.size.height+80.0);
        [popView presentPopoverFromRect:CGRectMake(150,450, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    }
   // Locks
    else if([DamageTypelbl.text isEqualToString:@"Locks"])
        
    {
        tag=6;
        [tblViewTest reloadData];
        lblHeaderTest.text=@"Damage Type";
        popView.popoverContentSize = CGSizeMake(500,250);
        [popView presentPopoverFromRect:CGRectMake(150,450, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
    }
    
    else if([DamageTypelbl.text isEqualToString:@"Failure to Return Keys"])
        
    {
        tag=7;
        [tblViewTest reloadData];
        lblHeaderTest.text=@"Damage Type";
        popView.popoverContentSize = CGSizeMake(tblViewTest.frame.size.width, tblViewTest.frame.size.height+80.0);
        [popView presentPopoverFromRect:CGRectMake(150,450, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
    } 
    else if([DamageTypelbl.text isEqualToString:@"Bathroom"])
        
    {
        tag=8;
        [tblViewTest reloadData];
        lblHeaderTest.text=@"Damage Type";
        popView.popoverContentSize = CGSizeMake(tblViewTest.frame.size.width, tblViewTest.frame.size.height+80.0);
        [popView presentPopoverFromRect:CGRectMake(150,450, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
    }
    else if([DamageTypelbl.text isEqualToString:@"Kitchen"])
        
    {
        tag=9;
        [tblViewTest reloadData];
        lblHeaderTest.text=@"Damage Type";
        popView.popoverContentSize = CGSizeMake(tblViewTest.frame.size.width, tblViewTest.frame.size.height+80.0);
        [popView presentPopoverFromRect:CGRectMake(150,450, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
    }

    else if([DamageTypelbl.text isEqualToString:@"Doors"])
        
    {
        tag=10;
        [tblViewTest reloadData];
        lblHeaderTest.text=@"Damage Type";
        popView.popoverContentSize = CGSizeMake(tblViewTest.frame.size.width, tblViewTest.frame.size.height+80.0);
        [popView presentPopoverFromRect:CGRectMake(150,450, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
    }
    else if([DamageTypelbl.text isEqualToString:@"Miscellaneous"])
        
    {
        tag=11;
        [tblViewTest reloadData];
        lblHeaderTest.text=@"Damage Type";
        popView.popoverContentSize = CGSizeMake(tblViewTest.frame.size.width, tblViewTest.frame.size.height+80.0);
        [popView presentPopoverFromRect:CGRectMake(150,450, 50, 50) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
    }

    
    
    
        
    
        
    else
        
    {
        
       UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Please Select the Damage Type First !" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
        
    }
    
   
    
    
}


- (IBAction)CheckBoxBtnClick:(id)sender

{
    
    UIButton *btn=(UIButton *)sender;
    
   
    switch (btn.tag)
    {
        case 1:
            if (chkBox1 == NO)
            {
                [chekbox1 setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
                chkBox1=YES;
                objParser.column1=1;
            }
            else
            {
                [chekbox1 setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
                chkBox1=NO;
                objParser.column1=0;
            }
            break;
        case 2:
            if (chkBox2 == NO)
            {
                [chekbox2 setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
                chkBox2 = YES;       
                objParser.column2=1;
                
            }
            else
            {
                [chekbox2 setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
                chkBox2 = NO;
                objParser.column2=0;
            }
            break;
        case 3:
            if (chkBox3 == NO)
            {
                [chekbox3 setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
                chkBox3 = YES;
                
                objParser.column3=1;
            }
            else
            {
                [chekbox3 setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
                chkBox3 = NO;
                objParser.column3=0;
                
            }
            break;
        case 4:
            if (chkBox4 == NO)
            {
                [chekbox4 setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
                chkBox4 =YES;
                objParser.column4=1;
                
            }
            else
            {
                [chekbox4 setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
                chkBox4 = NO;
                objParser.column4=0;
            }
            break;
        case 5:
            if (chkBox5 == NO)
            {
                [chekbox5 setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
                chkBox5 =YES;
                objParser.column5=1;
                
            }
            else
            {
                [chekbox5 setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
                chkBox5 = NO;
                objParser.column5=0;
            }
            
            break;
        case 6:
            if (chkBox6 == NO)
            {
                [chekbox6 setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
                chkBox6=YES;
                objParser.column6=1;
                
            }
            else
            {
                [chekbox6 setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
                chkBox6=NO;
                objParser.column6=0;
                
            }
            break;
        case 7:
            if (chkBox7 == NO)
            {
                [chekbox7 setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
                chkBox7=YES;
                objParser.column7=1;
            }
            else
            {
                [chekbox7 setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
                chkBox7=NO;
                objParser.column7=0;
            }
            break;
        case 8:
            if (chkBox8 == NO)
            {
                [chekbox8 setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
                chkBox8=YES;
                objParser.column8=1;
                
            }
            else
            {
                [chekbox8 setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
                chkBox8=NO;
                objParser.column8=0;
            }
            break;
    }
    
    
}




-(void)OpenPOP
{
    
    viewControllerTest = [[UIViewController alloc]init];
    viewControllerTest.view.backgroundColor = [UIColor colorWithRed:(float)(255.00/255) green:(float)(204.00/255) blue:(float)(153.00/255) alpha:1];
    
       
    tblViewTest = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, 500, 480) style:UITableViewStylePlain];
    
    CGRect frame = tblViewTest.frame;
    frame.size.height = MIN(40 * [ActivitesArray count], 480); // 400 is the maximum height that the table view can have. You can change it to whatever you like
    tblViewTest.frame = frame;
    
    
    tblViewTest.backgroundColor = [UIColor clearColor];
    tblViewTest.delegate = self;
    tblViewTest.dataSource = self;
    [tblViewTest reloadData];
    [viewControllerTest.view addSubview:tblViewTest];
    
    
    lblHeaderTest = [[UILabel alloc]init];
    lblHeaderTest.frame=CGRectMake(0, 0, tblViewTest.frame.size.width, 30);
    lblHeaderTest.backgroundColor = [UIColor clearColor];
    lblHeaderTest.textColor = [UIColor blackColor];
    lblHeaderTest.font=[UIFont boldSystemFontOfSize:20];
    lblHeaderTest.textAlignment = UITextAlignmentCenter;
    [viewControllerTest.view addSubview:lblHeaderTest];
    
       
    close_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    close_btn.frame=CGRectMake(tblViewTest.frame.size.width-50, 10, 30, 25);
    [close_btn setImage:[UIImage imageNamed:@"Cross btn.png"] forState:UIControlStateNormal];
    [close_btn addTarget:self action:@selector(closebtn_click) forControlEvents:UIControlEventTouchUpInside];
    [viewControllerTest.view addSubview:close_btn];
    
    popView = [[UIPopoverController alloc]initWithContentViewController:viewControllerTest];
    
   
    
   // CGSize tableViewSize=tblViewTest.contentSize;

        
    
       
    
   
    
    
   
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
    else
    {
       
    }
    
    
}

-(void)SubmitButtonClicked

{
    
    if([Buildinglb.text isEqualToString:@""])
        
    {
         
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Please Fill The Data Properly" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [alert release];
        
        
    }
    else
        
    {
        
        [self startSpinner:@"spinner" andDisplay:@"Loading..."];
        
        NSDate *date = [NSDate date];
        NSDateFormatter *outputFormatter1 = [[NSDateFormatter alloc] init];
        [outputFormatter1 setDateFormat:@"MM-dd-yyyy"];
        NSString *strDate = [[NSString alloc]init];
        strDate = [outputFormatter1 stringFromDate:date];
        
        
        LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
        
       
        NSString *Roomtype_str  =Roomtypelbl.text;
        NSString *ResidentName_str=Residentname_txt.text;
        NSString *Unitno_str=Unitno_txt.text;
        
       // http://75.147.113.169/lindiproperty/index.php/lindiproperty/addInspectionForm_service/52/1/description/01-01-2012/resident_name123/unit_no123/room_type
                      
        NSString *temp_url=[NSString stringWithFormat:@"%@/addInspectionForm_service/%@/%@/%@/%@/%@/%@/%@",MainUrl,objApp.strUserId,objParser.Building,DecspText.text,strDate,ResidentName_str,Unitno_str,Roomtype_str];
                            
           NSLog(@"%@",temp_url);                  
       
                            /*/%@/%@/%@/%@/%d/%d/%d/%d/%d/%d/%d/%d/%@/%@/%@/%@/",MainUrl,objApp.strUserId, objParser.Building,objParser.Activity,DecspText.text,objParser.column1,objParser.column2,objParser.column3,objParser.column4,objParser.column5,objParser.column6,objParser.column7,objParser.column8,strDate,ResidentName_str,Unitno_str,Roomtype_str];
*/
        
        submitdata=YES;
        NSURL *url = [[NSURL alloc]initWithString:[temp_url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
        
        NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
        [request setURL:url];
        
        NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        if (theConnection) 
        {
            webData = [[NSMutableData alloc]init];
        }
        else
        {
           
        }

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




- (IBAction)AttachPhoto
{
    
     ImageArray_temp=[[NSMutableArray alloc]init];
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"Lindy Property" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"From Camera" otherButtonTitles:@"From Album",nil];
    action.delegate=self;
    action.actionSheetStyle = UIActionSheetStyleAutomatic;
    [action showInView:self.view];
    
    
}

-(void)postmessage
{
    
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    NSString *Message= [NSString stringWithFormat:@"%@ Created Inspection Report",objApp.UserName]; 
    
    NSString *temp_url=[NSString stringWithFormat:@"%@/addAlert_service/%@/%@/json",MainUrl,objApp.strUserId,Message];
    
    messagechek=YES;
    
    NSURL *url = [[NSURL alloc]initWithString:[temp_url stringByAddingPercentEscapesUsingEncoding:
                                               NSASCIIStringEncoding]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    
    [request setURL:url];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(theConnection) {
        webData = [[NSMutableData data] retain];
    }
    else {
      
    }
    
}


-(void)ImageUpload

{
    
    NSString *strURL = [NSString stringWithFormat:@"%@image_upload&report_id=%@&report_type=inspection_form",SecondUrl,Reportid];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:strURL]];
    [request setDelegate:self];
    
    
    
    for (int i = 0; i < [ImageArray_temp count]; i++) 
    {
        [request addData:[ImageArray_temp objectAtIndex:i] withFileName:@"image.jpg" andContentType:@"image/jpeg" forKey:[NSString stringWithFormat:@"image%d",i]];
        [request addData:[DamageTypeSelectedArray objectAtIndex:i] forKey:@"DamageType"];
    }	
    [request startAsynchronous];
    
    
    
}

-(IBAction)AddButtonClick:(id)sender{

    self.checkedIndexPath=nil;
    self.TablesecondIndexpath=nil;
    [UIView animateWithDuration:0.8 delay:0.0 options:0
                     animations:^{
                         CGPoint point = _DamageViewPopup.center;
                         point.y = point.y + 800;
                         _DamageViewPopup.center = point;
                     }
                     completion:^(BOOL finished) {
                         [PaintingCostArray removeAllObjects];
                         [CarpetCostArray removeAllObjects];
                         [LockArray removeAllObjects];
                         [FailuerToreturnArray removeAllObjects];
                         [BathroomArray removeAllObjects];
                         [KitchenArray  removeAllObjects];
                         [DoorsArray removeAllObjects];
                         [MiscellaneousArray removeAllObjects];
                         [DamageCostTableView reloadData];
                        }];
    
    [DamageTypeSelectedArray addObject:SelectedDamageType];
    [DamageCostSelectedArray addObject:SelectedDamageCost];
    
    
    
    NSArray *arr = [SelectedDamageCost componentsSeparatedByString:@"$"];
    NSString *coststr = [arr objectAtIndex:1];
    
    
    if([ _Totallbl.text isEqualToString:@"$ 0 "]){
        
         lastTotal=[coststr integerValue];
        _Totallbl.text=[NSString stringWithFormat:@"%@ $",coststr];
    }else{
        
         
        NSLog(@"%d",lastTotal);
        int newValue=[coststr integerValue];
        lastTotal=lastTotal+newValue;
        NSLog(@"%d",newValue);
        NSLog(@"$ %d",lastTotal);
        _Totallbl.text=[NSString stringWithFormat:@"$ %d",lastTotal];
        
    }
    
       
    NSLog(@"%@",coststr);
    
    
    
    if ([DamageCostSelectedArray count]==[DamageTypeSelectedArray count]) {
        [SelectedTableView reloadData];
    }
  
}

-(void)AddTheDamageDetailsWithTheDamageType:(NSString *)_damageType AnWithDamageCost:(NSString *)_damageCost{
    
      
   
        
        NSString *damageType=_damageType;
        NSString* damageCost=_damageCost;
        damageCost=[damageCost stringByReplacingOccurrencesOfString:@": $" withString:@","];
        NSString *strURL=[NSString stringWithFormat:@"%@/addInspectionDamage_service/%@/%@/%@",MainUrl,Reportid,damageType,damageCost];
        NSLog(@"%@",[strURL stringByAddingPercentEscapesUsingEncoding:
                 NSASCIIStringEncoding]);
        InsertingDamageDetails=YES;
        NSURL *url = [[NSURL alloc]initWithString:[strURL stringByAddingPercentEscapesUsingEncoding:
                                               NSASCIIStringEncoding]];
        NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
        [request setURL:url];
        NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        if(theConnection) {
            webData = [[NSMutableData data] retain];
        }
          

}


#pragma mark - Image Upload Delegates


- (void)requestFinished:(ASIHTTPRequest *)request{
    [self postmessage];
}


- (void)requestFailed:(ASIHTTPRequest *)request {
	
        [self postmessage];
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Report is Saved Without Image" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Alert show];
        [Alert release];
}


#pragma mark - Textfield Delegate


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark- UITextView Delegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
     _ScrollView.contentSize=CGSizeMake(768, 1200);
     [_ScrollView scrollRectToVisible:CGRectMake(0, 200, 768, 1004) animated:YES];
    _ScrollView.scrollEnabled=NO;
	return YES;
}


- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
	[textView resignFirstResponder];
	return YES;
}

#pragma mark - keyboard Delegates

- (void)keyboardDidShow: (NSNotification *) notif
{
    
}

- (void)keyboardDidHide: (NSNotification *) notif
{
     _ScrollView.contentSize=CGSizeMake(768, 1200);
    [_ScrollView scrollRectToVisible:CGRectMake(0, 0, 768, 1004) animated:YES];
    _ScrollView.scrollEnabled=NO;
    
}

#pragma mark - ActionSheet Delegates

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([title isEqualToString:@""]){
        [actionSheet dismissWithClickedButtonIndex:[title intValue] animated:YES];
    }
    
    else if([title isEqualToString:@"From Camera"]){
        [self Getimage];
    }
    else if([title isEqualToString:@"From Album"]){
        
        ELCAlbumPickerController *albumController = [[ELCAlbumPickerController alloc] initWithNibName:@"ELCAlbumPickerController" bundle:[NSBundle mainBundle]];    
        ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initWithRootViewController:albumController];
        [self presentModalViewController:elcPicker animated:YES];
        [albumController setParent:elcPicker];
        [elcPicker setDelegate:self];
    }
    
    else if([title isEqualToString:@"Small"]){
        
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"];
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 0.5)];
        [ImageArray_temp addObject:imageData];
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Do Want To Take Another Picture" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
        [Alert show];
        Alert.tag=1;
        [Alert release];
    }
    
    
    else if([title isEqualToString:@"Medium"]){
        
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"];
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 1)];
        [ImageArray_temp addObject:imageData];
        
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Do Want To Take Another Picture" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
        [Alert show];
        Alert.tag=1;
        [Alert release];
    }
    
    
    
    else if([title isEqualToString:@"Actual Size"]){
        
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"]; 
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 2)];
        [ImageArray_temp addObject:imageData];
        
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Do Want To Take Another Picture" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
        [Alert show];
        Alert.tag=1;
        [Alert release];
        
    }
    
    else if([title isEqualToString:@"Cancle"]){
        [actionSheet dismissWithClickedButtonIndex:[title intValue] animated:YES];
    }

    
	
}



#pragma  mark - Connection Delegates

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [webData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [webData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    [self stopSpinner];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Lindy Property" message:@"Internet connection is down,please try again after some time." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];             
    [alertView show];
    [alertView release];
    
    [webData release];
    [connection release];
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSString *jsonStr = [[NSString alloc] 
                         initWithData:webData                         
                         encoding:NSASCIIStringEncoding];
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *jsondic = [parser objectWithString:jsonStr];
    NSString *str = [NSString stringWithFormat:@"%@",[jsondic valueForKey:@"success"]];
    
    
    if ([str isEqualToString:@"1"]){
      
            if (propertycheck==YES){
        
            NSDictionary *resultdic=[[NSDictionary alloc]init];
            resultdic=[jsondic valueForKey:@"result"];
            PikerArray=[[NSMutableArray alloc]initWithArray:[resultdic valueForKey:@"property_name"]];
            PropertyID=[[NSMutableArray alloc]initWithArray:[resultdic valueForKey:@"property_id"]];
            [self stopSpinner];
            [webData release];   
            [self OpenPOP];
             propertycheck=NO;
            }
        
            if(activityload==YES){
                
                NSDictionary *resultdic=[[NSDictionary alloc]init];
                resultdic=[jsondic valueForKey:@"result"];
                ActivitesArray=[[NSMutableArray alloc]initWithArray:[resultdic valueForKey:@"activity_name"]];
                ActivitesIDArray=[[NSMutableArray alloc]initWithArray:[resultdic valueForKey:@"activity_id"]];
                activityload=NO;
                [webData release];
                
                [self LoadUserProperty];
            }
        
            if (submitdata==YES){
                
                if (!getthereportid){
                    Reportid=[[NSString alloc]init];
                    Reportid=[jsondic valueForKey:@"report_id"];
                    getthereportid=YES;
                }
                
                
                NSLog(@"%@",Reportid);
                if (arrayval<[DamageTypeSelectedArray count] && [DamageTypeSelectedArray count]!=0){
                    
                    NSLog(@"%d",arrayval);
                    [self AddTheDamageDetailsWithTheDamageType:[DamageTypeSelectedArray objectAtIndex:arrayval] AnWithDamageCost:[DamageCostSelectedArray objectAtIndex:arrayval]];
                    [Reportid retain];
                    arrayval=arrayval+1;

                }
                else{
                     [webData release];
                    submitdata=NO;
                    getthereportid=NO;
                    
                    
                    if([ImageArray_temp count]>0){
                        [self ImageUpload];
                    }
                    else{
                        [self postmessage];
                    }
                }
                           
            }
            if (messagechek==YES){
                
                [self stopSpinner];
                messagechek=NO;
                [connection release];
                [self.navigationController dismissModalViewControllerAnimated:YES];  
            }
        
                  
    }
    else{
       [self stopSpinner];
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


-(void) stopSpinner{
    
    [self.spinnerView.view removeFromSuperview];
    self.spinnerView = nil;    
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
   // imagePicker.view.hidden = YES;
   // photo1.image = image;
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    
    temp_img=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
    /*imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 2)];
    [ImageArray_temp addObject:imageData];
    
    
    [picker dismissModalViewControllerAnimated:YES];
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


#pragma mark - ELCImagePickerControllerDelegate Methods

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
	
	[self dismissModalViewControllerAnimated:YES];
	for(NSDictionary *dict in info) 
    {
        
        
        temp_img=[dict objectForKey:UIImagePickerControllerOriginalImage];
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self fixOrientation], 2)];
        [ImageArray_temp addObject:imageData];
        
        
    }
}
- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker {
    
	[self dismissModalViewControllerAnimated:YES];
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
    if (tableView.tag==1) {
        return [DamageTypeArray count];
        
    }
    else if (tableView.tag==2){
        
        if(tag==4){
            return [PaintingCostArray count];
        }
        else if(tag==5){
            return [CarpetCostArray count];
        }
        else if(tag==6){
            return [MiscellaneousArray  count];
        }
        else if(tag==7){
            return [LockArray  count];
        }
        else if(tag==8){
            return [FailuerToreturnArray count];
        }
        else if(tag==9){
            return [BathroomArray count];
        }
        else if(tag==10){
            return [KitchenArray count];
        }
        else if(tag==11){
            return [DoorsArray count];
        }
        else{
            return 0;
        }

        
    }
    else if (tableView.tag==3){
        return [DamageCostSelectedArray count];
        
    }
    else{
        
        if(tag==0){
            return [ActivitesArray count];
        }
        else if(tag==1){
            return [PikerArray count];
        }
        else if(tag==2) {
            return [RoomtypeArray count];
        }
        else{
            return 0;
        }

    }
      
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    
    
    tableView.separatorColor = [UIColor blackColor];
    
    
    for (UIView *view in cell.contentView.subviews){
        [view removeFromSuperview];
        
    }
    
    
     cell.contentView.backgroundColor = [UIColor colorWithRed:(float)(187.00/255) green:(float)(224.00/255) blue:(float)(227.00/255) alpha:1];
    
    UIView* myBackgroundView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    
    myBackgroundView.backgroundColor =  [UIColor colorWithRed:(float)(187.00/255) green:(float)(224.00/255) blue:(float)(227.00/255) alpha:1];
    
    cell.backgroundView = myBackgroundView;
    
   
    
    
    if (tableView.tag==1) {
        
            UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 250, 50)];
            lbl.font=[UIFont boldSystemFontOfSize:12.0];
            lbl.numberOfLines=2;
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=[DamageTypeArray objectAtIndex:indexPath.row];
            [cell.contentView addSubview:lbl];
            //cell.textLabel.text =[DamageTypeArray objectAtIndex:indexPath.row];
    }
    else if (tableView.tag==2){
        
        if(tag==4){
            
            UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 250, 50)];
            lbl.font=[UIFont boldSystemFontOfSize:12.0];
            lbl.numberOfLines=2;
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=[PaintingCostArray objectAtIndex:indexPath.row];
            [cell.contentView addSubview:lbl];
            //cell.textLabel.text =[PaintingCostArray objectAtIndex:indexPath.row];
        }
        else if(tag==5){
            UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 250, 50)];
            lbl.font=[UIFont boldSystemFontOfSize:12.0];
            lbl.numberOfLines=2;
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=[CarpetCostArray objectAtIndex:indexPath.row];
            [cell.contentView addSubview:lbl];
            //cell.textLabel.text =[CarpetCostArray objectAtIndex:indexPath.row];
        }
        else if(tag==6){
            UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 250, 50)];
            lbl.font=[UIFont boldSystemFontOfSize:12.0];
            lbl.numberOfLines=2;
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=[MiscellaneousArray objectAtIndex:indexPath.row];
            [cell.contentView addSubview:lbl];
           // cell.textLabel.text =[LockArray objectAtIndex:indexPath.row];
        }
        else if(tag==7){
            UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 250, 50)];
            lbl.font=[UIFont boldSystemFontOfSize:12.0];
            lbl.numberOfLines=2;
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=[LockArray objectAtIndex:indexPath.row];
            [cell.contentView addSubview:lbl];
           // cell.textLabel.text =[FailuerToreturnArray objectAtIndex:indexPath.row];
        }
        else if(tag==8){
            UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 250, 50)];
            lbl.font=[UIFont boldSystemFontOfSize:12.0];
            lbl.numberOfLines=2;
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=[FailuerToreturnArray objectAtIndex:indexPath.row];
            [cell.contentView addSubview:lbl];
            //cell.textLabel.text =[BathroomArray objectAtIndex:indexPath.row];
        }
        else if(tag==9){
            UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 250, 50)];
            lbl.font=[UIFont boldSystemFontOfSize:12.0];
            lbl.numberOfLines=2;
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=[BathroomArray objectAtIndex:indexPath.row];
            [cell.contentView addSubview:lbl];
            //cell.textLabel.text =[KitchenArray objectAtIndex:indexPath.row];
        }
        else if(tag==10){
            UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 250, 50)];
            lbl.font=[UIFont boldSystemFontOfSize:12.0];
            lbl.numberOfLines=2;
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=[KitchenArray objectAtIndex:indexPath.row];
            [cell.contentView addSubview:lbl];
            //cell.textLabel.text =[DoorsArray objectAtIndex:indexPath.row];
        }
        else if(tag==11){
            UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 250, 50)];
            lbl.font=[UIFont boldSystemFontOfSize:12.0];
            lbl.numberOfLines=2;
            lbl.backgroundColor=[UIColor clearColor];
            lbl.text=[DoorsArray objectAtIndex:indexPath.row];
            [cell.contentView addSubview:lbl];
           // cell.textLabel.text =[MiscellaneousArray objectAtIndex:indexPath.row];
        }
        
    }
    else if (tableView.tag==3){
        
        
        UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 150, 50)];
        lbl.font=[UIFont boldSystemFontOfSize:12.0];
        lbl.numberOfLines=2;
        lbl.backgroundColor=[UIColor clearColor];
        lbl.textAlignment=UITextAlignmentLeft;
        lbl.text=[DamageTypeSelectedArray objectAtIndex:indexPath.row];
        [cell.contentView addSubview:lbl];
        
        
        UILabel *lbl1=[[UILabel alloc]initWithFrame:CGRectMake(180, 0, 300, 50)];
        lbl1.font=[UIFont boldSystemFontOfSize:12.0];
        lbl1.numberOfLines=2;
        lbl1.backgroundColor=[UIColor clearColor];
        lbl1.textAlignment=UITextAlignmentLeft;
        lbl1.text=[DamageCostSelectedArray objectAtIndex:indexPath.row];
        [cell.contentView addSubview:lbl1];
        
        
       
        
        
       // DamageCostSelectedArray
    }
    else{
        
        if(tag==0){
            cell.textLabel.text = [ActivitesArray objectAtIndex:indexPath.row];
        }
        else if(tag==1){
            cell.textLabel.text = [PikerArray objectAtIndex:indexPath.row];
        }
        else if(tag==2){
            cell.textLabel.text =[RoomtypeArray objectAtIndex:indexPath.row];
        }
        
    }
    

       
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.accessoryType=UITableViewCellAccessoryNone;
   
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 50;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
     if (tableView.tag==3){
    return 50;
     }
     else{
         return 0;
     }
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,0,768,50)];
   
    
    if (tableView.tag==3){
      
         tempView.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
        UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 150, 50)];
        lbl.font=[UIFont boldSystemFontOfSize:12.0];
        lbl.backgroundColor=[UIColor clearColor];
        lbl.textAlignment=UITextAlignmentLeft;
        lbl.text=@"Damage Type";
        [tempView addSubview:lbl];
        
        UILabel *lbl1=[[UILabel alloc]initWithFrame:CGRectMake(180, 0, 300, 50)];
        lbl1.font=[UIFont boldSystemFontOfSize:12.0];
        lbl1.backgroundColor=[UIColor clearColor];
        lbl1.textAlignment=UITextAlignmentLeft;
        lbl1.text=@"Damage Cost";
        [tempView addSubview:lbl1];
    }

    return tempView;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    
    
    
        
    
    if (tableView.tag==1) {
        
        
        if(self.checkedIndexPath){
            
            UITableViewCell *uncheckCell=[tableView cellForRowAtIndexPath:self.checkedIndexPath];
            uncheckCell.accessoryType=UITableViewCellAccessoryNone;
        }
        if ([self.checkedIndexPath isEqual:indexPath]) {
            self.checkedIndexPath=nil;
        }
        else{
            UITableViewCell *selectedCell=[tableView cellForRowAtIndexPath:indexPath];
            selectedCell.accessoryType=UITableViewCellAccessoryCheckmark;
            self.checkedIndexPath=indexPath;
        }
        
        if(indexPath.row==0){
            tag=4;
            [DamageCostTableView reloadData];
        }
        else if (indexPath.row==1){
            tag=5;
            [DamageCostTableView reloadData];
        }
        else if (indexPath.row==2){
            tag=6;
            [DamageCostTableView reloadData];
        }
        else if (indexPath.row==3){
            tag=7;
            [DamageCostTableView reloadData];
        }
        else if (indexPath.row==4){
            tag=8;
            [DamageCostTableView reloadData];
        }
        else if (indexPath.row==5){
            tag=9;
            [DamageCostTableView reloadData];
        }
        else if (indexPath.row==6){
            tag=10;
            [DamageCostTableView reloadData];
        }
        else if (indexPath.row==7){
            tag=11;
            [DamageCostTableView reloadData];
        }
        
        SelectedDamageType=[[NSString alloc]initWithString:[DamageTypeArray objectAtIndex:indexPath.row]];
        
    }
    else if (tableView.tag==2){
        
       
        
        
        if(self.TablesecondIndexpath){
            
        UITableViewCell *uncheckCell=[tableView cellForRowAtIndexPath:self.TablesecondIndexpath];
            uncheckCell.accessoryType=UITableViewCellAccessoryNone;
        }
        if ([self.TablesecondIndexpath isEqual:indexPath]) {
            self.TablesecondIndexpath=nil;
        }
        else{
            UITableViewCell *selectedCell=[tableView cellForRowAtIndexPath:indexPath];
            selectedCell.accessoryType=UITableViewCellAccessoryCheckmark;
            self.TablesecondIndexpath=indexPath;
        }
        
        
        if(tag==4){
           SelectedDamageCost=[[NSString alloc]initWithString:[PaintingCostArray objectAtIndex:indexPath.row] ];
           
        }
        if(tag==5){
            SelectedDamageCost=[[NSString alloc]initWithString:[CarpetCostArray objectAtIndex:indexPath.row] ] ;
            
        }
        if(tag==6){
            SelectedDamageCost=[[NSString alloc]initWithString:[MiscellaneousArray  objectAtIndex:indexPath.row] ] ;
            
        }
        if(tag==7){
            SelectedDamageCost=[[NSString alloc]initWithString:[LockArray  objectAtIndex:indexPath.row] ] ;
            
        }
        if(tag==8){
            SelectedDamageCost=[[NSString alloc]initWithString:[FailuerToreturnArray  objectAtIndex:indexPath.row] ];
            
        }
        if(tag==9){
            SelectedDamageCost=[[NSString alloc]initWithString:[BathroomArray  objectAtIndex:indexPath.row] ] ;
            
        }
        if(tag==10){
            SelectedDamageCost=[[NSString alloc]initWithString:[KitchenArray  objectAtIndex:indexPath.row] ] ;
            
        }
        if(tag==11){
            SelectedDamageCost=[[NSString alloc]initWithString:[DoorsArray objectAtIndex:indexPath.row]] ;
        }
    
    
               
    }
    else if (tableView.tag==3){
        
    }
    else{
        
        if(tag==0){
            ActivityLbl.text=[ActivitesArray objectAtIndex:indexPath.row];
            [popView dismissPopoverAnimated:YES];
            objParser.Activity=[ActivitesIDArray objectAtIndex:indexPath.row];
        }
        else if(tag==1){
            Buildinglb.text=[PikerArray objectAtIndex:indexPath.row];
            [popView dismissPopoverAnimated:YES];
            objParser.Building=[PropertyID objectAtIndex:indexPath.row];
        }
        else if(tag==2){
            Roomtypelbl.text=[RoomtypeArray objectAtIndex:indexPath.row];
           [popView dismissPopoverAnimated:YES];
        }

                      
    }
    
    
    
    
}

/*else if( tag==3)
 
 {
 
 if (indexPath.row==0)
 
 {
 
 tag=4;
 
 }
 else if(indexPath.row==1)
 
 {
 
 tag=5;
 }
 
 DamageCostlbl.text=@"";
 DamageTypelbl.text=[DamageTypeArray objectAtIndex:indexPath.row];
 [popView dismissPopoverAnimated:YES];
 
 }
 else if(tag==4)
 
 {
 [popView dismissPopoverAnimated:YES];
 DamageCostlbl.text=[PaintingCostArray objectAtIndex:indexPath.row];
 
 //  cell.textLabel.text =[PaintingCostArray objectAtIndex:indexPath.row];
 
 }
 
 else if(tag==5)
 
 {
 [popView dismissPopoverAnimated:YES];
 DamageCostlbl.text=[CarpetCostArray objectAtIndex:indexPath.row];
 //cell.textLabel.text =[CarpetCostArray objectAtIndex:indexPath.row];
 
 
 }
 else if(tag==6)
 {
 
 [popView dismissPopoverAnimated:YES];
 DamageCostlbl.text=[LockArray objectAtIndex:indexPath.row];
 
 
 
 }
 else if(tag==7)
 
 {
 [popView dismissPopoverAnimated:YES];
 DamageCostlbl.text=[FailuerToreturnArray objectAtIndex:indexPath.row];
 }
 
 else if(tag==8)
 
 {
 [popView dismissPopoverAnimated:YES];
 DamageCostlbl.text=[BathroomArray objectAtIndex:indexPath.row];
 }
 
 else if(tag==9)
 
 {
 [popView dismissPopoverAnimated:YES];
 DamageCostlbl.text=[KitchenArray objectAtIndex:indexPath.row];
 }
 
 else if(tag==10)
 
 {
 [popView dismissPopoverAnimated:YES];
 DamageCostlbl.text=[DoorsArray objectAtIndex:indexPath.row];
 }
 
 else if(tag==11)
 
 {
 [popView dismissPopoverAnimated:YES];
 DamageCostlbl.text=[MiscellaneousArray objectAtIndex:indexPath.row];
 }
 
 
 if ([DamageTypeSelectedArray count]!=0){
 
 
 for (int i=0; i<[DamageTypeSelectedArray count]; i++){
 
 [self AddTheDamageDetailsWithTheDamageType:[DamageTypeSelectedArray objectAtIndex:arrayval] AnWithDamageCost:[DamageCostSelectedArray objectAtIndex:arrayval]];
 NSLog(@"%d",i);
 }
 
 }
 else{
 submitdata=NO;
 getthereportid=NO;
 
 if([ImageArray_temp count]>0){
 [self ImageUpload];
 }
 else{
 [self postmessage];
 }
 }
 
 }

 
 
 
*/
@end

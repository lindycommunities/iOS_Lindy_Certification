//
//  WeeklyManagerReportController.m
//  LendiProperty
//
//  Created by Vinay D on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WeeklyManagerReportController.h"
#import "WeeklyReportViewPart2Controller.h"
#import "LendiPropertyAppDelegate.h"
@implementation WeeklyManagerReportController

@synthesize FromDate_txt,ToDate_txt,Property_txt,Manager_txt;

@synthesize Scroll_view;

@synthesize DateFirst_lab,DateSecond_lab,DateThird_lab,DateFourth_lab;

@synthesize spinnerView;

@synthesize btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8,btn9,btn10,btn11,btn12,btn13,btn14,btn15,btn16,btn17,btn18,btn19,btn20,btn21,btn22,btn23,btn24,btn25,btn26,btn27,btn28,btn29,btn30,btn31,btn32,btn33,btn34,btn35,btn36,btn37,btn38,btn39,btn40,btn41,btn42,btn43,btn44,btn45,btn46,btn47,btn48,btn49,btn50,btn51,btn52,btn53,btn54,btn55,btn56,btn57,btn58,btn59,btn60,btn61,btn62,btn63,btn64,btn65,btn66,btn67,btn68,btn69,btn70,btn71,btn72,btn73,btn74,btn75,btn76,btn77,btn78,btn79,btn80,btn81,btn82,btn83,btn84,btn85,btn86,btn87,btn88,btn89,btn90,btn91,btn92,btn93,btn94,btn95,btn96,btn97,btn98,btn99,btn100;


@synthesize btn101,btn102,btn103,btn104,btn105,btn106,btn107,btn108,btn109,btn110,btn111,btn112,btn113,btn114,btn115,btn116,btn117,btn118,btn119,btn120,btn121,btn122,btn123,btn124,btn125,btn126,btn127,btn128,btn129,btn130,btn131,btn132,btn133,btn134,btn135,btn136,btn137,btn138,btn139,btn140,btn141,btn142,btn143,btn144,btn145,btn146,btn147,btn148,btn149,btn150,btn151,btn152,btn153,btn154,btn155,btn156,btn157,btn158,btn159,btn160,btn161,btn162,btn163,btn164,btn165,btn166,btn167,btn168,btn169,btn170,btn171,btn172,btn173,btn174,btn175,btn176,btn177,btn178,btn179,btn180,btn181,btn182,btn183,btn184,btn185,btn186,btn187,btn188,btn189,btn190,btn191,btn192;



- (id)initWithReportID:(int)_Rid WithUserName:(NSString *)_Username
{
    self = [super init];
    if (self) 
    {
        objParser = [[ParserClass alloc]init];
        Reportid=_Rid;
        UserName=_Username;
    }
    return self;
}

#pragma mark - TextField Delegates

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - Apps Methods

-(void)clickNext
{
    
    WeeklyReportViewPart2Controller *obj_Week=[[WeeklyReportViewPart2Controller alloc]initWithParserObj:objParser];
    [self.navigationController pushViewController:obj_Week animated:YES];
    
    
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

    
    self.Scroll_view.contentSize=CGSizeMake(768, 3000);
    
    self.title=@"Weekly Manager Checklist";
    
    self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
   
    DateFirst_lab.layer.borderColor = [UIColor blackColor].CGColor;
    DateFirst_lab.layer.borderWidth = 2.0;
   
    DateSecond_lab.layer.borderColor = [UIColor blackColor].CGColor;
    DateSecond_lab.layer.borderWidth = 2.0;
    
    DateThird_lab.layer.borderColor = [UIColor blackColor].CGColor;
    DateThird_lab.layer.borderWidth = 2.0;
    
    DateFourth_lab.layer.borderColor = [UIColor blackColor].CGColor;
    DateFourth_lab.layer.borderWidth = 2.0;
    
    btnNext = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(clickNext)];
    self.navigationItem.rightBarButtonItem =btnNext;

    
    [self startSpinner:@"spinner" andDisplay:@"Loading.."];
    
    NSString *temp_url=[NSString stringWithFormat:@"%@getWeeklyDetails&report_id=%d",SecondUrl,Reportid];
    
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


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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

#pragma mark - Apps Methods

-(void)setData

{
    [self stopSpinner];
    
    if(objParser.column1==1)
    {
        [btn1 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column2 == 1)
    {
        [btn2 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column3 == 1) 
    {
        [btn3 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column4 == 1)
    {
        [btn4 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column5 == 1)
    {
        [btn5 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column6 == 1)
    {
        [btn6 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column7 == 1)
    {
        [btn7 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column8 == 1)
    {
        [btn8 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column9 == 1)
    {
        [btn9 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column10 == 1)
    {
        [btn10 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column11 == 1)
    {
        [btn11 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column12 == 1)
    {
        [btn12 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column13 == 1)
    {
        [btn13 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column14 == 1)
    {
        [btn14 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column15 == 1)
    {
        [btn15 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column16 == 1)
    {
        [btn16 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column17 == 1)
    {
        [btn17 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column18 == 1)
    {
        [btn18 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }    
    if(objParser.column19 == 1)
    {
        [btn19 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column20 == 1)
    {
        [btn20 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column21 == 1)
    {
        [btn21 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column22 == 1)
    {
        [btn22 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column23 == 1)
    {
        [btn23 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column24 == 1)
    {
        [btn24 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column25 == 1)
    {
        [btn25 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column26 == 1)
    {
        [btn26 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column27 == 1)
    {
        [btn27 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column28 == 1)
    {
        [btn28 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column29 == 1)
    {
        [btn29 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column30 == 1)
    {
        [btn30 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column31 == 1)
	{
        [btn31 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column32 == 1)
    {
        [btn32 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column33 == 1)
    {
        [btn33 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column34 == 1)
    {
        [btn34 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column35 == 1)
    {
        [btn35 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column36 == 1)
    {
        [btn36 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column37 == 1)
    {
        [btn37 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column38 == 1)
    {
        [btn38 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column39 == 1)
    {
        [btn39 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column40 == 1)
    {
        [btn40 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column41 == 1)
    {
        [btn41 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column42 == 1) 
    {
        [btn42 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column43 == 1)
    {
        [btn43 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column44 == 1)
    {
        [btn44 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column45 == 1)
    {
        [btn45 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column46 == 1)
    {
        [btn46 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column47 == 1)
    {
        [btn47 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column48 == 1)
    {
        [btn48 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column49 == 1)
    {
        [btn49 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column50 == 1)
    {
        [btn50 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column51 == 1)
    {
        [btn51 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column52 == 1)
    {
        [btn52 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column53 == 1)
    {
        [btn53 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column54 == 1)
    {
        [btn54 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column55 == 1)
    {
        [btn55 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column56 == 1)
    {
        [btn56 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column57 == 1)
    {
        [btn57 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column58 == 1)
    {
        [btn58 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column59 == 1)
    {
        [btn59 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column60 == 1)
    {
        [btn60 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column61 == 1)
    {
        [btn61 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column62 == 1)
    {
        [btn62 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column63 == 1)
    {
        [btn63 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column64 == 1)
    {
        [btn64 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column65 == 1)
    {
        [btn65 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column66 == 1)
    {
        [btn66 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column67 == 1)
    {
        [btn67 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column68 == 1)
    {
        [btn68 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column69 == 1)
    {
        [btn69 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column70 == 1)
    {
        [btn70 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column71 == 1)
    {
        [btn71 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column72 == 1)
    {
        [btn72 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column73 == 1)
    {
        [btn73 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column74 == 1)
    {
        [btn74 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column75 == 1)
    {
        [btn75 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column76 == 1)
    {
        [btn76 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column77 == 1)
	{
        [btn77 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column78 == 1)
	{
        [btn78 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column79 == 1)
    {
        [btn79 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column80 == 1)
    {
        [btn80 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column81 == 1)
    {
        [btn81 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column82 == 1)
    {
        [btn82 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column83 == 1)
    {
        [btn83 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    
    if(objParser.column84 == 1)
    {
        [btn84 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column85 == 1)
    {
        [btn85 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column86 == 1)
    {
        [btn86 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column87 == 1)
    {
        [btn87 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column88 == 1)
    {
        [btn88 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column89 == 1)
    {
        [btn89 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column90 == 1)
    {
        [btn90 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column91 == 1)
    {
        [btn91 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column92 == 1)
    {
        [btn92 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column93 == 1)
    {
        [btn93 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column94 == 1)
    {
        [btn94 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column95 == 1)
    {
        [btn95 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column96 == 1)
    {
        [btn96 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column97 == 1)
    {
        [btn97 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column98 == 1)
    {
        [btn98 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column99 == 1)
    {
        [btn99 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column100 == 1)
    {
        [btn100 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column101 == 1)
	{
        [btn101 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column102 == 1)
    {
        [btn102 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column103 == 1)
	{
        [btn103 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column104 == 1)
    {
        [btn104 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column105 == 1)
    {
        [btn105 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column106 == 1) 
    {
        [btn106 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column107 == 1) 
    {
        [btn107 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column108 == 1) 
    {
        [btn108 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column109 == 1)
    {
        [btn109 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }  
    
    if(objParser.column110 == 1)
    {
        [btn110 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    } 
    
    if(objParser.column111 == 1)
    {
        [btn111 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column112 == 1) 
    {
        [btn112 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column113 == 1)
    {
        [btn113 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column114 == 1)
    {
        [btn114 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column115 == 1)
    {
        [btn115 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column116 == 1)
    {
        [btn116 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column117 == 1)
    {
        [btn117 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column118 == 1)
    {
        [btn118 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column119 == 1)
    {
        [btn119 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column120 == 1) 
    {
        [btn120 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column121 == 1)
    {
        [btn121 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column122 == 1)
    {
        [btn122 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column123 == 1)
    {
        [btn123 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column124 == 1) 
    {
        [btn124 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column125 == 1)
    {
        [btn125 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column126 == 1)
    {
        [btn126 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column127 == 1)
    {
        [btn127 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column128 == 1)
    {
        [btn128 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column129 == 1)
    {
        [btn129 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column130 == 1)
    {
        [btn130 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column131 == 1)
    {
        [btn131 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column132 == 1)
    {
        [btn132 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column133 == 1)
    {
        [btn133 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column134 == 1)
    {
        [btn134 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column135 == 1)
    {
        [btn135 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column136 == 1)
    {
        [btn136 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column137 == 1)
    {
        [btn137 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column138 == 1)
    {
        [btn138 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column139 == 1)
    {
        [btn139 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column140 == 1)
    {
        [btn140 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column141 == 1)
    {
        [btn141 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column142 == 1)
    {
        [btn142 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column143 == 1)
    {
        [btn143 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column144 == 1)
    {
        [btn144 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column145 == 1)
    {
        [btn145 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column146 == 1)
    {
        [btn146 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column147 == 1)
    {
        [btn147 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column148 == 1)
    {
        [btn148 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    
    if(objParser.column149 == 1)
    {
        [btn149 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column150 == 1)
    {
        [btn150 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column151 == 1)
    {
        [btn151 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    if(objParser.column152 == 1) 
    {
        [btn152 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column153 == 1)
    {
        [btn153 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column154 == 1)
    {
        [btn154 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column155 == 1)
    {
        [btn155 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column156 == 1)
    {
        [btn156 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column157 == 1)
    {
        [btn157 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column158 == 1) 
    {
        [btn158 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column159 == 1)
    {
        [btn159 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column160 == 1)
    {
        [btn160 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column161 == 1)
    {
        [btn161 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column162 == 1)
    {
        [btn162 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column163 == 1)
    {
        [btn163 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column164 == 1) 
    {
        [btn164 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column165 == 1)
    {
        [btn165 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column166 == 1)
    {
        [btn166 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column167 == 1) 
    {
        [btn167 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column168 == 1)
    {
        [btn168 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column169 == 1)
    {
        [btn169 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column170 == 1)
    { 
        [btn170 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
        
    }
    
    if(objParser.column171 == 1)
    {
        [btn171 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column172 == 1)
    {
        [btn172 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column173 == 1)
    {
        [btn173 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column174 == 1)
    {
        [btn174 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column175 == 1)
    {
        [btn175 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column176 == 1)
    {
        [btn176 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column177 == 1)
    {
        [btn177 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column178 == 1)
    {
        [btn178 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column179 == 1)
    {
        [btn179 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column180 == 1)
    {
        [btn180 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column181 == 1)
    {
        [btn181 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column182 == 1)
    {
        [btn182 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column183 == 1)
    {
        [btn183 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column184 == 1)
    {
        [btn184 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column185 == 1)
    {
        [btn185 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column186 == 1)
    {
        [btn186 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column187 == 1)
    {
        [btn187 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column188 == 1)
    {
        [btn188 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column189 == 1)
    {
        [btn189 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column190 == 1)
    {
        [btn190 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column191 == 1)
    {
        [btn191 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    if(objParser.column192 == 1) 
    {
        [btn192 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
    }
    
    
    
    FromDate_txt.text=objParser.FromDate;
    ToDate_txt.text=objParser.ToDate;
    
    Property_txt.text=objParser.Property;
    Manager_txt.text=objParser.Manager;
    
    DateFirst_lab.text=objParser.FirstDate;
    DateSecond_lab.text=objParser.SecondDate;
    DateThird_lab.text=objParser.ThirdDate;
    DateFourth_lab.text=objParser.FourthDate;
    
    
    
    
    

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
        
        
        
        objParser.column1=[[dic valueForKey:@"column1"]intValue];
        objParser.column2=[[dic valueForKey:@"column2"]intValue];
        objParser.column3=[[dic valueForKey:@"column3"]intValue];
        objParser.column4=[[dic valueForKey:@"column4"]intValue];
        objParser.column5=[[dic valueForKey:@"column5"]intValue];
        objParser.column6=[[dic valueForKey:@"column6"]intValue];
        objParser.column7=[[dic valueForKey:@"column7"]intValue];
        objParser.column8=[[dic valueForKey:@"column8"]intValue];
        objParser.column9=[[dic valueForKey:@"column9"]intValue];
        objParser.column10=[[dic valueForKey:@"column10"]intValue];
        objParser.column11=[[dic valueForKey:@"column11"]intValue];
        objParser.column12=[[dic valueForKey:@"column12"]intValue];
        objParser.column13=[[dic valueForKey:@"column13"]intValue];
        objParser.column14=[[dic valueForKey:@"column14"]intValue];
        objParser.column15=[[dic valueForKey:@"column15"]intValue];
        objParser.column16=[[dic valueForKey:@"column16"]intValue];
        objParser.column17=[[dic valueForKey:@"column17"]intValue];
        objParser.column18=[[dic valueForKey:@"column18"]intValue];
        objParser.column19=[[dic valueForKey:@"column19"]intValue];
        objParser.column20=[[dic valueForKey:@"column20"]intValue];
        objParser.column21=[[dic valueForKey:@"column21"]intValue];
        objParser.column22=[[dic valueForKey:@"column22"]intValue];
        objParser.column23=[[dic valueForKey:@"column23"]intValue];
        objParser.column24=[[dic valueForKey:@"column24"]intValue];
        objParser.column25=[[dic valueForKey:@"column25"]intValue];
        objParser.column26=[[dic valueForKey:@"column26"]intValue]; 
        objParser.column27=[[dic valueForKey:@"column27"]intValue];
        objParser.column28=[[dic valueForKey:@"column28"]intValue];
        objParser.column29=[[dic valueForKey:@"column29"]intValue];
        objParser.column30=[[dic valueForKey:@"column30"]intValue];
        objParser.column31=[[dic valueForKey:@"column31"]intValue];
        objParser.column32=[[dic valueForKey:@"column32"]intValue];
        objParser.column33=[[dic valueForKey:@"column33"]intValue];
        objParser.column34=[[dic valueForKey:@"column34"]intValue];
        objParser.column35=[[dic valueForKey:@"column35"]intValue]; 
        objParser.column36=[[dic valueForKey:@"column36"]intValue];
        objParser.column37=[[dic valueForKey:@"column37"]intValue];
        objParser.column38=[[dic valueForKey:@"column38"]intValue]; 
        objParser.column39=[[dic valueForKey:@"column39"]intValue];
        objParser.column40=[[dic valueForKey:@"column40"]intValue];
        objParser.column41=[[dic valueForKey:@"column41"]intValue];
        objParser.column42=[[dic valueForKey:@"column42"]intValue];
        objParser.column43=[[dic valueForKey:@"column43"]intValue];
        objParser.column44=[[dic valueForKey:@"column44"]intValue];
        objParser.column45=[[dic valueForKey:@"column45"]intValue];
        objParser.column46=[[dic valueForKey:@"column46"]intValue];
        objParser.column47=[[dic valueForKey:@"column47"]intValue];
        objParser.column48=[[dic valueForKey:@"column48"]intValue];
        objParser.column49=[[dic valueForKey:@"column49"]intValue];
        objParser.column50=[[dic valueForKey:@"column50"]intValue];
        objParser.column51=[[dic valueForKey:@"column51"]intValue];
        objParser.column52=[[dic valueForKey:@"column52"]intValue];
        objParser.column53=[[dic valueForKey:@"column53"]intValue];
        objParser.column54=[[dic valueForKey:@"column54"]intValue];
        objParser.column55=[[dic valueForKey:@"column55"]intValue];
        objParser.column56=[[dic valueForKey:@"column56"]intValue];
        objParser.column57=[[dic valueForKey:@"column57"]intValue];
        objParser.column58=[[dic valueForKey:@"column58"]intValue];
        objParser.column59=[[dic valueForKey:@"column59"]intValue];
        objParser.column60=[[dic valueForKey:@"column60"]intValue];
        objParser.column61=[[dic valueForKey:@"column61"]intValue];
        objParser.column62=[[dic valueForKey:@"column62"]intValue];
        objParser.column63=[[dic valueForKey:@"column63"]intValue];
        objParser.column64=[[dic valueForKey:@"column64"]intValue];
        objParser.column65=[[dic valueForKey:@"column65"]intValue];
        objParser.column66=[[dic valueForKey:@"column66"]intValue];
        objParser.column67=[[dic valueForKey:@"column67"]intValue];
        objParser.column68=[[dic valueForKey:@"column68"]intValue];
        objParser.column69=[[dic valueForKey:@"column69"]intValue];
        objParser.column70=[[dic valueForKey:@"column70"]intValue];
        objParser.column71=[[dic valueForKey:@"column71"]intValue];
        objParser.column72=[[dic valueForKey:@"column72"]intValue];
        objParser.column73=[[dic valueForKey:@"column73"]intValue];
        objParser.column74=[[dic valueForKey:@"column74"]intValue]; 
        objParser.column75=[[dic valueForKey:@"column75"]intValue];
        objParser.column76=[[dic valueForKey:@"column76"]intValue];
        objParser.column77=[[dic valueForKey:@"column77"]intValue];
        objParser.column78=[[dic valueForKey:@"column78"]intValue];
        objParser.column79=[[dic valueForKey:@"column79"]intValue];
        objParser.column80=[[dic valueForKey:@"column80"]intValue];
        objParser.column81=[[dic valueForKey:@"column81"]intValue];
        objParser.column82=[[dic valueForKey:@"column82"]intValue];
        objParser.column83=[[dic valueForKey:@"column83"]intValue];
        objParser.column84=[[dic valueForKey:@"column84"]intValue];
        objParser.column85=[[dic valueForKey:@"column85"]intValue];
        objParser.column86=[[dic valueForKey:@"column86"]intValue];
        objParser.column87=[[dic valueForKey:@"column87"]intValue];
        objParser.column88=[[dic valueForKey:@"column88"]intValue];
        objParser.column89=[[dic valueForKey:@"column89"]intValue];
        objParser.column90=[[dic valueForKey:@"column90"]intValue];
        objParser.column91=[[dic valueForKey:@"column91"]intValue];
        objParser.column92=[[dic valueForKey:@"column92"]intValue];
        objParser.column93=[[dic valueForKey:@"column93"]intValue];
        objParser.column94=[[dic valueForKey:@"column94"]intValue];
        objParser.column95=[[dic valueForKey:@"column95"]intValue];
        objParser.column96=[[dic valueForKey:@"column96"]intValue];
        objParser.column97=[[dic valueForKey:@"column97"]intValue];
        objParser.column98=[[dic valueForKey:@"column98"]intValue];
        objParser.column99=[[dic valueForKey:@"column99"]intValue];
        objParser.column100=[[dic valueForKey:@"column100"]intValue];
        objParser.column101=[[dic valueForKey:@"column101"]intValue];
        objParser.column102=[[dic valueForKey:@"column102"]intValue];
        objParser.column103=[[dic valueForKey:@"column103"]intValue];
        objParser.column104=[[dic valueForKey:@"column104"]intValue];
        objParser.column105=[[dic valueForKey:@"column105"]intValue];
        objParser.column106=[[dic valueForKey:@"column106"]intValue];
        objParser.column107=[[dic valueForKey:@"column107"]intValue];
        objParser.column108=[[dic valueForKey:@"column108"]intValue];
        objParser.column109=[[dic valueForKey:@"column109"]intValue];
        objParser.column110=[[dic valueForKey:@"column110"]intValue];
        objParser.column111=[[dic valueForKey:@"column111"]intValue];
        objParser.column112=[[dic valueForKey:@"column112"]intValue];
        objParser.column113=[[dic valueForKey:@"column113"]intValue];
        objParser.column114=[[dic valueForKey:@"column114"]intValue];
        objParser.column115=[[dic valueForKey:@"column115"]intValue];
        objParser.column116=[[dic valueForKey:@"column116"]intValue];
        objParser.column117=[[dic valueForKey:@"column117"]intValue];
        objParser.column118=[[dic valueForKey:@"column118"]intValue];
        objParser.column119=[[dic valueForKey:@"column119"]intValue];
        objParser.column120=[[dic valueForKey:@"column120"]intValue];
        objParser.column121=[[dic valueForKey:@"column121"]intValue];
        objParser.column122=[[dic valueForKey:@"column122"]intValue];
        objParser.column123=[[dic valueForKey:@"column123"]intValue];
        objParser.column124=[[dic valueForKey:@"column124"]intValue];
        objParser.column125=[[dic valueForKey:@"column125"]intValue];
        objParser.column126=[[dic valueForKey:@"column126"]intValue];
        objParser.column127=[[dic valueForKey:@"column127"]intValue];
        objParser.column128=[[dic valueForKey:@"column128"]intValue];
        objParser.column129=[[dic valueForKey:@"column129"]intValue];
        objParser.column130=[[dic valueForKey:@"column130"]intValue];
        objParser.column131=[[dic valueForKey:@"column131"]intValue];
        objParser.column132=[[dic valueForKey:@"column132"]intValue];
        objParser.column133=[[dic valueForKey:@"column133"]intValue];
        objParser.column134=[[dic valueForKey:@"column134"]intValue];
        objParser.column135=[[dic valueForKey:@"column135"]intValue];
        objParser.column136=[[dic valueForKey:@"column136"]intValue];
        objParser.column137=[[dic valueForKey:@"column137"]intValue];
        objParser.column138=[[dic valueForKey:@"column138"]intValue];
        objParser.column139=[[dic valueForKey:@"column139"]intValue];
        objParser.column140=[[dic valueForKey:@"column140"]intValue];
        objParser.column141=[[dic valueForKey:@"column141"]intValue];
        objParser.column142=[[dic valueForKey:@"column142"]intValue];
        objParser.column143=[[dic valueForKey:@"column143"]intValue];
        objParser.column144=[[dic valueForKey:@"column144"]intValue];
        objParser.column145=[[dic valueForKey:@"column145"]intValue];
        objParser.column146=[[dic valueForKey:@"column146"]intValue];
        objParser.column147=[[dic valueForKey:@"column147"]intValue]; 
        objParser.column148=[[dic valueForKey:@"column148"]intValue];
        objParser.column149=[[dic valueForKey:@"column149"]intValue];
        objParser.column150=[[dic valueForKey:@"column150"]intValue];
        objParser.column151=[[dic valueForKey:@"column151"]intValue];
        objParser.column152=[[dic valueForKey:@"column152"]intValue];
        objParser.column153=[[dic valueForKey:@"column153"]intValue];
        objParser.column154=[[dic valueForKey:@"column154"]intValue];
        objParser.column155=[[dic valueForKey:@"column155"]intValue];
        objParser.column156=[[dic valueForKey:@"column156"]intValue];
        objParser.column157=[[dic valueForKey:@"column157"]intValue];
        objParser.column158=[[dic valueForKey:@"column158"]intValue];
        objParser.column159=[[dic valueForKey:@"column159"]intValue];
        objParser.column160=[[dic valueForKey:@"column160"]intValue];
        objParser.column161=[[dic valueForKey:@"column161"]intValue];
        objParser.column162=[[dic valueForKey:@"column162"]intValue];
        objParser.column163=[[dic valueForKey:@"column163"]intValue];
        objParser.column164=[[dic valueForKey:@"column164"]intValue];
        objParser.column165=[[dic valueForKey:@"column165"]intValue];
        objParser.column166=[[dic valueForKey:@"column166"]intValue];
        objParser.column167=[[dic valueForKey:@"column167"]intValue];
        objParser.column168=[[dic valueForKey:@"column168"]intValue];
        objParser.column169=[[dic valueForKey:@"column169"]intValue];
        objParser.column170=[[dic valueForKey:@"column170"]intValue];
        objParser.column171=[[dic valueForKey:@"column171"]intValue];
        objParser.column172=[[dic valueForKey:@"column172"]intValue];
        objParser.column173=[[dic valueForKey:@"column173"]intValue];
        objParser.column174=[[dic valueForKey:@"column174"]intValue];
        objParser.column175=[[dic valueForKey:@"column175"]intValue]; 
        objParser.column176=[[dic valueForKey:@"column176"]intValue];
        objParser.column177=[[dic valueForKey:@"column177"]intValue];
        objParser.column178=[[dic valueForKey:@"column178"]intValue];
        objParser.column179=[[dic valueForKey:@"column179"]intValue];
        objParser.column180=[[dic valueForKey:@"column180"]intValue];
        objParser.column181=[[dic valueForKey:@"column181"]intValue];
        objParser.column182=[[dic valueForKey:@"column182"]intValue];
        objParser.column183=[[dic valueForKey:@"column183"]intValue];
        objParser.column184=[[dic valueForKey:@"column184"]intValue]; 
        objParser.column185=[[dic valueForKey:@"column185"]intValue];
        objParser.column186=[[dic valueForKey:@"column186"]intValue];
        objParser.column187=[[dic valueForKey:@"column187"]intValue];
        objParser.column188=[[dic valueForKey:@"column188"]intValue];
        objParser.column189=[[dic valueForKey:@"column189"]intValue];
        objParser.column190=[[dic valueForKey:@"column190"]intValue];
        objParser.column191=[[dic valueForKey:@"column191"]intValue]; 
        objParser.column192=[[dic valueForKey:@"column192"]intValue];
        
        
        
        
        objParser.FromDate=[dic valueForKey:@"from_date"];
        objParser.ToDate=[dic valueForKey:@"to_date"];
        
        objParser.Property=[dic valueForKey:@"property"];
        objParser.Manager=[dic valueForKey:@"manager"];
        
        objParser.FirstDate=[dic valueForKey:@"first_date"];
        objParser.SecondDate=[dic valueForKey:@"second_date"];
        objParser.ThirdDate=[dic valueForKey:@"third_date"];
        objParser.FourthDate=[dic valueForKey:@"fourth_date"];
        
        
        objParser.A=[dic valueForKey:@"a"];
        objParser.B=[dic valueForKey:@"b"];
        objParser.C=[dic valueForKey:@"c"];
        objParser.D=[dic valueForKey:@"d"];
        objParser.E=[dic valueForKey:@"e"];
        objParser.F=[dic valueForKey:@"f"];
        objParser.G=[dic valueForKey:@"g"];
        objParser.H=[dic valueForKey:@"h"];
        objParser.I=[dic valueForKey:@"i"];
        objParser.J=[dic valueForKey:@"j"];
        objParser.K=[dic valueForKey:@"k"];
        
        
        
        
        
        
        
        
        objParser.CreationDate=[dic valueForKey:@"creation_date"];
        
        [self setData];
        
        
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
 
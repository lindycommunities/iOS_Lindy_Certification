//
//  WeeklyReportViewPart2.m
//  LendiProperty
//
//  Created by Vinay D on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WeeklyReportViewPart2.h"


@implementation WeeklyReportViewPart2

@synthesize Scroll_view;

@synthesize spinnerView;

@synthesize A_txt,B_txt,C_txt,D_txt,E_txt,F_txt,G_txt,H_txt,I_txt,J_txt,K_txt;



- (id)initWithParserObj:(ParserClass *)_objParser
{
    self = [super init];
    if (self) 
    {
              classObj = (ParserClass *)_objParser;
        self.title=@"Reponse/ Note Sheet";
    }
    return self;
}



#pragma mark - Apps Methods 

-(void)DataInsertaion
{
    if([A_txt.text length]>0)
    {
        
        classObj.A = [A_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
    }
    else
    {
        
        classObj.A=@"NA";
        
    }
    if([B_txt.text length]>0)
    {
        
        classObj.B = [B_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
    }
    else
    {
        
        classObj.B=@"NA";
        
    }
    
    if([C_txt.text length]>0)
    {
        classObj.C = [C_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    }
    else
    {
        
        classObj.C=@"NA";
        
    }
    if([D_txt.text length]>0)
    {
        
        classObj.D = [D_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    }
    else
    {
        
        classObj.D=@"NA";
        
    }
    
    if([E_txt.text length]>0)
    {
        
        classObj.E = [B_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
    }
    else
    {
        
        classObj.E=@"NA";
        
    }
    
    if([F_txt.text length]>0)
    {
        classObj.F = [F_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
        
    }
    else
    {
        
        classObj.F=@"NA";
        
    }
    
    if([G_txt.text length]>0)
    {
        
        classObj.G = [G_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
    }
    else
    {
        
        classObj.G=@"NA";
        
    }
    
    if([H_txt.text length]>0)
    {
        
        classObj.H = [H_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
    }
    else
    {
        
        classObj.H=@"NA";
        
    }
    
    if([I_txt.text length]>0)
    {
        
        classObj.I = [I_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
    }
    else
    {
        
        classObj.I=@"NA";
        
    }
    
    if([J_txt.text length]>0)
    {
        
        classObj.J = [J_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
    }
    else
    {
        
        classObj.J=@"NA";
        
    }
    
    if([K_txt.text length]>0)
    {
        
        classObj.K = [K_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
    }
    else
    {
        
        classObj.K=@"NA";
        
    }

}




-(void)postmessage
{
    
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
       
    NSString *Message= [NSString stringWithFormat:@"%@ Created Weekly  Manager Report",objApp.UserName]; 
    
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
    else {
        NSLog(@"theConnection is NULL");
    }
    
}



-(void)clickSave
{
     
    [self startSpinner:@"spinner" andDisplay:@"Saving Report.."]; 
    
    [self DataInsertaion];
    
    
    
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    NSDate *date = [NSDate date];
    NSDateFormatter *outputFormatter1 = [[NSDateFormatter alloc] init];
    [outputFormatter1 setDateFormat:@"MM-dd-yyyy"];
    NSString *strDate = [[NSString alloc]init];
    strDate = [outputFormatter1 stringFromDate:date];
   
     
    
    
    
    NSString *urlstr=[NSString stringWithFormat:@"%@/%@/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/",objApp.strUserId,classObj.selectedProperty,classObj.column1,classObj.column2,classObj.column3,classObj.column4,classObj.column5,classObj.column6,classObj.column7,classObj.column8,classObj.column9,classObj.column10,classObj.column11,classObj.column12,classObj.column13,classObj.column14,classObj.column15,classObj.column16,classObj.column17,classObj.column18,classObj.column19,classObj.column20,classObj.column21,classObj.column22,classObj.column23,classObj.column24,classObj.column25,classObj.column26,classObj.column27,classObj.column28,classObj.column29,classObj.column30,classObj.column31,classObj.column32,classObj.column33,classObj.column34,classObj.column35,classObj.column36,classObj.column37,classObj.column38,classObj.column39,classObj.column40,classObj.column41,classObj.column42,classObj.column43,classObj.column44,classObj.column45,classObj.column46,classObj.column47,classObj.column48,classObj.column49,classObj.column50,classObj.column51,classObj.column52,classObj.column53,classObj.column54,classObj.column55,classObj.column56,classObj.column57,classObj.column58,classObj.column59,classObj.column60,classObj.column61,classObj.column62,classObj.column63,classObj.column64,classObj.column65,classObj.column66,classObj.column67,classObj.column68,classObj.column69,classObj.column70,classObj.column71,classObj.column72,classObj.column73,classObj.column74,classObj.column75,classObj.column76,classObj.column77,classObj.column78,classObj.column79,classObj.column80,classObj.column81,classObj.column82,classObj.column83,classObj.column84,classObj.column85,classObj.column86,classObj.column87,classObj.column88,classObj.column89,classObj.column90,classObj.column91,classObj.column92,classObj.column93,classObj.column94,classObj.column95,classObj.column96,classObj.column97,classObj.column98,classObj.column99,classObj.column100];
    
    
    
    
   
    
    NSString *urlstr1=[NSString stringWithFormat:@"%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/",classObj.column101,classObj.column102,classObj.column103,classObj.column104,classObj.column105,classObj.column106,classObj.column107,classObj.column108,classObj.column109,classObj.column110,classObj.column111,classObj.column112,classObj.column113,classObj.column114,classObj.column115,classObj.column116,classObj.column117,classObj.column118,classObj.column119,classObj.column120,classObj.column121,classObj.column122,classObj.column123,classObj.column124,classObj.column125,classObj.column126,classObj.column127,classObj.column128,classObj.column129,classObj.column130,classObj.column131,classObj.column132,classObj.column133,classObj.column134,classObj.column135,classObj.column136,classObj.column137,classObj.column138,classObj.column139,classObj.column140,classObj.column141,classObj.column142,classObj.column143,classObj.column144,classObj.column145,classObj.column146,classObj.column147,classObj.column148,classObj.column149,classObj.column150,classObj.column151,classObj.column152,classObj.column153,classObj.column154,classObj.column155,classObj.column156,classObj.column157,classObj.column158,classObj.column159,classObj.column160,classObj.column161,classObj.column162,classObj.column163,classObj.column164,classObj.column165,classObj.column166,classObj.column167,classObj.column168,classObj.column169,classObj.column170,classObj.column171,classObj.column172,classObj.column173,classObj.column174,classObj.column175,classObj.column176,classObj.column177,classObj.column178,classObj.column179,classObj.column180,classObj.column181,classObj.column182,classObj.column183,classObj.column184,classObj.column185,classObj.column186,classObj.column187,classObj.column188,classObj.column189,classObj.column190,classObj.column191,classObj.column192];
    
    NSString *urlstr2=[NSString stringWithFormat:@"%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@",strDate, classObj.FromDate,classObj.ToDate,classObj.Property,classObj.Manager,classObj.FirstDate, classObj.SecondDate,classObj.ThirdDate,classObj.FourthDate, classObj.A, classObj.B,classObj.C,classObj.D, classObj.E,classObj.F, classObj.G,classObj.H,classObj.I,classObj.J,classObj.K];
 
   // objParser.User_ID=objApp.UserName;
   
      
  
 
    
    NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@/addWeeklyManager_service/%@%@%@",MainUrl,urlstr,urlstr1,urlstr2]];

    
    
   // NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"http://www.whitelakeinteractive.com/lindiproperty/index.php/lindiproperty/addWeeklyManager_service/%@%@%@",urlstr,urlstr1,urlstr2]];
    
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
    
    if (theConnection) 
    {
        webData = [[NSMutableData alloc]init];
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }

       
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [Scroll_view scrollRectToVisible:CGRectMake(0, 0, 768, 1024) animated:YES];
     return YES;
}






#pragma mark - Alert View Delegates

-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==1)
    {

//        [self.navigationController popToViewController: [self.navigationController.viewControllers objectAtIndex:2] animated:YES];
        [self dismissModalViewControllerAnimated:YES];
        
    }
    
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
        [webData release];
        [connection release];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Internet Down !" message:@"Sorry Internet Connection Is Down Please Try Again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
    
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
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





#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *version = [[UIDevice currentDevice] systemVersion];
    int ver_val = [version intValue];
    
    
    if(ver_val >=6.0 ){
        [[UIDevice currentDevice] setOrientation:UIDeviceOrientationPortrait];
    }

    
    self.Scroll_view.contentSize=CGSizeMake(768, 2200);
    self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
    btnNext = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(clickSave)];
    self.navigationItem.rightBarButtonItem =btnNext;
    
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


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

@end

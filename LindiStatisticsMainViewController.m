//
//  LindiMainViewController.m
//  LindiCertification
//
//  Created by Sudip Deshpande on 15/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import "LindiStatisticsMainViewController.h"
#import "MyPieElement.h"
#import "Example2PieView.h"
#import "PieLayer.h"
#import "LindiStatContractGridViewViewController.h"
#import "LindiStatCertificateGridViewViewController.h"

@interface LindiStatisticsMainViewController ()
{
    BOOL showPercent;
}
@property (nonatomic, retain) IBOutlet Example2PieView* pieView;
@property (nonatomic, retain) IBOutlet Example2PieView* pieView1;
@property (retain, nonatomic) IBOutlet UIView *VIewContractColorGreen;
@property (retain, nonatomic) IBOutlet UIView *VIewContractColorRed;
@property (retain, nonatomic) IBOutlet UILabel *LblActiveContract;
@property (retain, nonatomic) IBOutlet UILabel *LblExpiredContract;
@property (retain, nonatomic) IBOutlet UIView *VIewCertificateColorGreen;
@property (retain, nonatomic) IBOutlet UIView *VIewCertificateColorRed;
@property (retain, nonatomic) IBOutlet UILabel *LblActiveCertificate;
@property (retain, nonatomic) IBOutlet UILabel *LblExpiredCertificate;

@end

@implementation LindiStatisticsMainViewController
@synthesize pieView;
@synthesize pieView1;
@synthesize jsonResultObject;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    UIColor *testColor = [UIColor redColor];
    
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL success = [testColor getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    NSLog(@"success: %i hue: %0.2f, saturation: %0.2f, brightness: %0.2f, alpha: %0.2f", success, hue, saturation, brightness, alpha);

    
    
    
   
    
    
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
    
    GlobalJSONParser *json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"%@",@"statReport"]];
    
    json.delegate=self;

    

    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;

   

    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)click:(id)sender
{
   }

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation

{
    // return YES;
    //return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);

}

//- (void)dealloc {
//    [_VIewContractColorGreen release];
//    [_VIewContractColorRed release];
//    [_LblActiveContract release];
//    [_LblExpiredContract release];
//    [_VIewCertificateColorGreen release];
//    [_VIewCertificateColorRed release];
//    [_LblActiveCertificate release];
//    [_LblExpiredCertificate release];
//    [super dealloc];
//}
#pragma mark- JSON PARSER Delegate

-(void) RequestFinished:(NSDictionary*)JsonDictionary
{
    bool issuccess = [[JsonDictionary valueForKey:@"success"]boolValue];
    if(issuccess)
    {
        self.jsonResultObject =[JsonDictionary objectForKey:@"result"];
        
        if (self.jsonResultObject) {
            
            
            NSMutableArray *color = [[NSMutableArray alloc]init];
//            [color addObject:[UIColor colorWithHue:0.33 saturation:1.00 brightness:1.00 alpha:1]];
//            [color addObject:[UIColor colorWithHue:1.00 saturation:1.00 brightness:1.00 alpha:1]];
            [color addObject:[UIColor greenColor]];
            [color addObject:[UIColor redColor]];

            valuesContracts = [[NSMutableArray alloc]init];
            
            NSDictionary *DContracts=[self.jsonResultObject valueForKey:@"Contracts"];
            NSDictionary *DCertificates=[self.jsonResultObject valueForKey:@"Certificates"];

            
            [valuesContracts addObject:[DContracts valueForKey:@"Active_Contracts"]];
            [valuesContracts addObject:[DContracts valueForKey:@"Expired_Contracts"]];
//            self..text=[NSString stringWithFormat:@"Active Contracts : %@",];
//            self..text=[NSString stringWithFormat:@"Expired Contracts : %@",];
            self.VIewContractColorGreen.backgroundColor=[UIColor greenColor];
            self.VIewContractColorRed.backgroundColor=[UIColor redColor];

            

            
            float allQuestions=0.0;
            for(int ind = 0; ind < [valuesContracts count]; ind++){
                float data=[[valuesContracts objectAtIndex:ind] floatValue];
                allQuestions+=data;
            }
            
            
            for(int ind = 0; ind < [valuesContracts count]; ind++){
                float data=[[valuesContracts objectAtIndex:ind] floatValue];
                data = (100 * data)/allQuestions;
                MyPieElement* elem = [MyPieElement pieElementWithValue:data color:[color objectAtIndex:ind]];
                elem.title = [NSString stringWithFormat:@"%.1f", data];
                elem.title = [elem.title stringByAppendingString:@" %"];
                if(ind==0)
                    self.LblActiveContract.text=[NSString stringWithFormat:@"Active Contracts : %@ (%@)",[DContracts valueForKey:@"Active_Contracts"],elem.title];
                else
                    self.LblExpiredContract.text=[NSString stringWithFormat:@"Expired Contracts : %@ (%@)",[DContracts valueForKey:@"Expired_Contracts"],elem.title];

                [pieView.layer addValues:@[elem] animated:NO];
            }
            
            //mutch easier do this with array outside
            showPercent = YES;
            pieView.layer.transformTitleBlock = ^(PieElement* elem, float percent){
              //  [elem setColor:[UIColor blackColor]];

                return [(MyPieElement*)elem title];

            };
            pieView.layer.showTitles = ShowTitlesAlways;
            pieView.userInteractionEnabled=NO;
            pieView.backgroundColor=[UIColor clearColor];
            
            
            ValuesCertificates = [[NSMutableArray alloc]init];

            
            [ValuesCertificates addObject:[DCertificates valueForKey:@"Active_Certificates"]];
            [ValuesCertificates addObject:[DCertificates valueForKey:@"Expired_Certificates"]];
            self.VIewCertificateColorGreen.backgroundColor=[UIColor greenColor];
            self.VIewCertificateColorRed.backgroundColor=[UIColor redColor];

            
            
            allQuestions=0.0;
            for(int ind = 0; ind < [ValuesCertificates count]; ind++){
                float data=[[ValuesCertificates objectAtIndex:ind] floatValue];
                allQuestions+=data;
            }
            
            for(int ind = 0; ind < [ValuesCertificates count]; ind++){
                float data=[[ValuesCertificates objectAtIndex:ind] floatValue];
                data = (100 * data)/allQuestions;
                MyPieElement* elem = [MyPieElement pieElementWithValue:data color:[color objectAtIndex:ind]];
                elem.title = [NSString stringWithFormat:@"%.1f", data];
                elem.title = [elem.title stringByAppendingString:@" %"];
                if(ind==0)
                self.LblActiveCertificate.text=[NSString stringWithFormat:@"Active Certificates : %@ (%@)",[DCertificates valueForKey:@"Active_Certificates"],elem.title];
                else
                self.LblExpiredCertificate.text=[NSString stringWithFormat:@"Expired Certificates : %@ (%@)",[DCertificates valueForKey:@"Expired_Certificates"],elem.title];

                
                
                [pieView1.layer addValues:@[elem] animated:NO];
            }
            
            //mutch easier do this with array outside
            showPercent = YES;
            pieView1.layer.transformTitleBlock = ^(PieElement* elem, float percent){
                return [(MyPieElement*)elem title];
            };
            pieView1.layer.showTitles = ShowTitlesAlways;
            pieView1.userInteractionEnabled=NO;
            pieView1.backgroundColor=[UIColor clearColor];            [self stopSpinnerforlandscape];
            
        }
    }
    else
    {
        [self stopSpinnerforlandscape];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"No Results Found." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alertView show];
       // [alertView release];
    }
}

-(void) RequestError
{
    
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
    [self.view bringSubviewToFront:self.spinnerlandscape.view];
}

-(void) stopSpinnerforlandscape

{
    
    [self.spinnerlandscape.view removeFromSuperview];
    self.spinnerlandscape= nil;
}
- (IBAction)StatCert:(id)sender {
        
    LindiStatCertificateGridViewViewController *stat=[[LindiStatCertificateGridViewViewController alloc]init];
    [self.navigationController pushViewController:stat animated:YES];

}

- (IBAction)StatContract:(id)sender {
    
    LindiStatContractGridViewViewController *stat=[[LindiStatContractGridViewViewController alloc]init];
    [self.navigationController pushViewController:stat animated:YES];
}
@end

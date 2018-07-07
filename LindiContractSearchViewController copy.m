//
//  LindiSearchViewController.m
//  LindiCertification
//
//  Created by Sudip Deshpande on 15/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import "LindiContractSearchViewController.h"
#import "LindiContractGridViewViewController.h"

@interface LindiContractSearchViewController ()

@end

@implementation LindiContractSearchViewController
@synthesize      arrbuilding,arrtype,arrcontractor,arrtypeid,arrcontractorid;
@synthesize jsonResultObject,arrbuildingid;
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
    

    
    GlobalJSONParser *json1 =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"certType"]];
    
    json1.delegate=self;
    
    
    id1=@"";
    id2=@"";
    id3=@"";

    
    
    // Do any additional setup after loading the view from its nib.
}
#pragma mark- JSON PARSER Delegate

-(void) RequestFinished:(NSDictionary*)JsonDictionary
{
    bool issuccess = [[JsonDictionary valueForKey:@"success"]boolValue];
    if(issuccess)
    {
        
        
        
    if([[JsonDictionary valueForKey:@"type"]isEqualToString:@"certType"])
    {
        
        NSArray* latestLoans=[[NSArray alloc]init];
        self.arrtype=[[NSMutableArray alloc]init];
        self.arrtypeid =[[NSMutableArray alloc]init];
        
        latestLoans = [JsonDictionary objectForKey:@"result"];
        
        //NSDictionary* details = [latestLoans objectAtIndex:0];
        
        for (NSDictionary *tweetValues in latestLoans) {
            
            NSNumber* certTypeID = [tweetValues objectForKey:@"certTypeID"];
            
            NSString* certType = [tweetValues objectForKey:@"certType"];
            NSLog(@"Building ID ------ %@",certTypeID);
            
            NSLog(@"Building Name----- %@",certType);
            
            
            
            [self.arrtype addObject:certType];
            [self.arrtypeid addObject:certTypeID];
            NSLog(@"Count %d",[self.arrbuildingid count]);
        }
        
    }
    
    
    
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"DNo Results Found." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }
}

-(void) RequestError
{
    
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

#pragma mark- show DropDowntable controller in modelpopup
-(void) showTableViewController {
    
}

-(void)dropDownCellSelected:(NSInteger)returnIndex
{
    if([strflag isEqualToString:@"Building"])
    {
        LblBuilding.text=[self.arrbuilding objectAtIndex:returnIndex];
        id1=[self.arrbuildingid objectAtIndex:returnIndex];

    }
    if([strflag isEqualToString:@"Certificate"])
    {
        LblCertificate.text=[self.arrtype objectAtIndex:returnIndex];
        id2=[self.arrtypeid objectAtIndex:returnIndex];
        
    }
    if([strflag isEqualToString:@"Contractor"])
    {
        LblContractor.text=[self.arrcontractor objectAtIndex:returnIndex];
        id3=[self.arrcontractorid objectAtIndex:returnIndex];

    }
  

}
- (void)dealloc {
    [LblBuilding release];
    [BtnBuilding release];
    [LblContractor release];
    [LblCertificate release];
    [TxtContractName release];
    [super dealloc];
}
- (void)viewDidUnload {
    [LblBuilding release];
    LblBuilding = nil;
    [BtnBuilding release];
    BtnBuilding = nil;
    [LblContractor release];
    LblContractor = nil;
    [LblCertificate release];
    LblCertificate = nil;
    [TxtContractName release];
    TxtContractName = nil;
    [super viewDidUnload];
}
- (IBAction)Building:(id)sender {
    dropDown=[[DropDownView alloc]initWithArrayData:self.arrbuilding  cellHeight:50 heightTableView:200 paddingTop:-9 paddingLeft:10 paddingRight:20 refView:LblBuilding animation:BOTH openAnimationDuration:0.5 closeAnimationDuration:0.5];
    dropDown.delegate=self;
    [self.view addSubview:dropDown.view];
    [dropDown openAnimation];
    strflag=@"Building";

}
- (IBAction)Certificate:(id)sender {
    dropDown=[[DropDownView alloc]initWithArrayData:self.arrtype  cellHeight:50 heightTableView:200 paddingTop:-9 paddingLeft:10 paddingRight:20 refView:LblCertificate animation:BOTH openAnimationDuration:0.5 closeAnimationDuration:0.5];
    dropDown.delegate=self;
    [self.view addSubview:dropDown.view];
    [dropDown openAnimation];
    strflag=@"Certificate";

}

- (IBAction)Contractor:(id)sender {
    
    dropDown=[[DropDownView alloc]initWithArrayData:self.arrcontractor  cellHeight:50 heightTableView:200 paddingTop:-9 paddingLeft:10 paddingRight:20 refView:LblContractor animation:BOTH openAnimationDuration:0.5 closeAnimationDuration:0.5];
    dropDown.delegate=self;
    [self.view addSubview:dropDown.view];
    [dropDown openAnimation];
    strflag=@"Contractor";

}

- (IBAction)Search:(id)sender {
    LindiContractGridViewViewController *home = [[LindiContractGridViewViewController alloc]init];
    home.Cert_Type=[NSString stringWithFormat:@"Searchcontracts&cert_id=%@&Contractor=%@",id2,TxtContractName.text];
    [self.navigationController pushViewController:home animated:YES];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
//    for (UIView *v in self.view.subviews)
//    {
//        if([v isMemberOfClass:[DropDownView class]])
//        {
//            [v removeFromSuperview];
//        }
//        
//    }
    [dropDown closeAnimation];
    
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation

{
    // return YES;
    //return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBarHidden=NO;
}

@end

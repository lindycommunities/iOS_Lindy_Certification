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
@synthesize jsonResultObject,arrbuildingid,arrcontracttype;
@synthesize fullyExcecuted,isLindy;
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
    

    
//    GlobalJSONParser *json1 =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"certType"]];
//    
//    json1.delegate=self;
    NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
    NSString *RoleID=[defaults_user stringForKey:@"roleAID"];
    NSString *userID=[defaults_user stringForKey:@"userID"];
    
    
    GlobalJSONParser *json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"buildings&userID=%@&RoldID=%@",userID,RoleID]];
    
    json.delegate=self;

    
    
    id1=@"";
    id2=@"";
    id3=@"";

    self.arrcontracttype=[[NSMutableArray alloc]init];
    [self.arrcontracttype addObject:@"Active"];
    [self.arrcontracttype addObject:@"Replaced"];
    LblContracttype.text=@"Active";
    
    [TxtMeterNo setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [TxtAccountNO setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    self.arrtype=[[NSMutableArray alloc]init];
    [self.arrtype addObject:@"Custodial"];
    [self.arrtype addObject:@"Electric"];
    [self.arrtype addObject:@"Elevator"];
    [self.arrtype addObject:@"Gas"];
    [self.arrtype addObject:@"Guards"];
    [self.arrtype addObject:@"Landscaping"];
    [self.arrtype addObject:@"Laundry"];
    [self.arrtype addObject:@"Office Equipment"];
    [self.arrtype addObject:@"Pet Control"];
    [self.arrtype addObject:@"Pool"];
    [self.arrtype addObject:@"Security/Alarms"];
    [self.arrtype addObject:@"Snow Removal"];
    [self.arrtype addObject:@"Telecommunications"];
    [self.arrtype addObject:@"Waste Removal"];
    
    self.isLindy=@"1";
    self.fullyExcecuted=@"1";
    segisLindy.selectedSegmentIndex=0;
    segfullyExcecuted.selectedSegmentIndex=0;


    
    // Do any additional setup after loading the view from its nib.
}
#pragma mark- JSON PARSER Delegate

-(void) RequestFinished:(NSDictionary*)JsonDictionary
{
    bool issuccess = [[JsonDictionary valueForKey:@"success"]boolValue];
    if(issuccess)
    {
        

        
        if([[JsonDictionary valueForKey:@"type"]isEqualToString:@"buildings"])
        {
            
            NSArray* latestLoans=[[NSArray alloc]init];
            self.arrbuilding=[[NSMutableArray alloc]init];
            self.arrbuildingid =[[NSMutableArray alloc]init];
            
            latestLoans = [JsonDictionary objectForKey:@"result"];
            
            //NSDictionary* details = [latestLoans objectAtIndex:0];
            
            for (NSDictionary *tweetValues in latestLoans) {
                
                NSNumber* buildingID = [tweetValues objectForKey:@"buildingID"];
                
                NSString* buildingName = [tweetValues objectForKey:@"building"];
                NSLog(@"Building ID ------ %@",buildingID);
                
                NSLog(@"Building Name----- %@",buildingName);
                
                
                
                [self.arrbuilding addObject:buildingName];
                [self.arrbuildingid addObject:buildingID];
                NSLog(@"Count %d",[self.arrbuildingid count]);
            }
            
        }
    
    
    
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"No Results Found." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alertView show];
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
        LblBuildingNo.text=[self.arrbuilding objectAtIndex:returnIndex];
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
    if([strflag isEqualToString:@"arrcontracttype"])
    {
        LblContracttype.text=[self.arrcontracttype objectAtIndex:returnIndex];
        
    }

  

}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)sender
{
    self.lastVisibleView=sender;
    return YES;
}
//- (void)dealloc {
//    [LblBuilding release];
//    [BtnBuilding release];
//    [LblContractor release];
//    [LblCertificate release];
//    [TxtContractName release];
//    [LblContracttype release];
//    [TxtAccountNO release];
//    [TxtMeterNo release];
//    [LblBuildingNo release];
//    [super dealloc];
//}
//- (void)viewDidUnload {
//    [LblBuilding release];
//    LblBuilding = nil;
//    [BtnBuilding release];
//    BtnBuilding = nil;
//    [LblContractor release];
//    LblContractor = nil;
//    [LblCertificate release];
//    LblCertificate = nil;
//    [TxtContractName release];
//    TxtContractName = nil;
//    [LblContracttype release];
//    LblContracttype = nil;
//    [TxtAccountNO release];
//    TxtAccountNO = nil;
//    [TxtMeterNo release];
//    TxtMeterNo = nil;
//    [LblBuildingNo release];
//    LblBuildingNo = nil;
//    [super viewDidUnload];
//}
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
    home.Cert_Type=[NSString stringWithFormat:@"Searchcontracts&contractStatus=%@&accountNo=%@&buildingID=%@&meterNo=%@&servicetype=%@&isLindyLanguage=%@&isFullyExecuted=%@",[LblContracttype.text lowercaseString],TxtAccountNO.text,id1,TxtMeterNo.text,LblCertificate.text,self.isLindy,self.fullyExcecuted];
    home.StrStatus=@"Active";
    if([LblContracttype.text length]>0)
        home.StrStatus=LblContracttype.text;
    [self.navigationController pushViewController:home animated:YES];

}

- (IBAction)SelectContracttype:(id)sender {
    
    dropDown=[[DropDownView alloc]initWithArrayData:self.arrcontracttype  cellHeight:50 heightTableView:200 paddingTop:-9 paddingLeft:10 paddingRight:20 refView:LblContracttype animation:BOTH openAnimationDuration:0.5 closeAnimationDuration:0.5];
    dropDown.delegate=self;
    [self.view addSubview:dropDown.view];
    [dropDown openAnimation];
    strflag=@"arrcontracttype";

}

- (IBAction)SelectBuildingno:(id)sender {
    
    dropDown=[[DropDownView alloc]initWithArrayData:self.arrbuilding  cellHeight:50 heightTableView:200 paddingTop:-9 paddingLeft:10 paddingRight:20 refView:LblBuildingNo animation:BOTH openAnimationDuration:0.5 closeAnimationDuration:0.5];
    dropDown.delegate=self;
    [self.view addSubview:dropDown.view];
    [dropDown openAnimation];
    strflag=@"Building";

}

- (IBAction)Clear:(id)sender {
    
    
    LblContracttype.text=@"";
    TxtAccountNO.text=@"";
    TxtMeterNo.text=@"";
    LblCertificate.text=@"";
    LblBuildingNo.text=@"";
    LblContracttype.text=@"Active";
    id1=@"";


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
- (IBAction)segisLindyBtnTapped:(id)sender{
    
    if(segisLindy.selectedSegmentIndex==0){
        
        self.isLindy=@"1";

    }
    else
    {
        self.isLindy=@"0";

    }
    
}
- (IBAction)segfullyExcecutedBtnTapped:(id)sender{
    
    
    if(segfullyExcecuted.selectedSegmentIndex==0){
        
        self.fullyExcecuted=@"1";

    }
    else
    {
        self.fullyExcecuted=@"0";

    }
}


@end

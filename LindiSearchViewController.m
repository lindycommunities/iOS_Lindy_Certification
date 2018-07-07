//
//  LindiSearchViewController.m
//  LindiCertification
//
//  Created by Sudip Deshpande on 15/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import "LindiSearchViewController.h"
#import "LindiGridViewViewController.h"
#import "LindiGridViewViewController1.h"

@interface LindiSearchViewController ()

@end

@implementation LindiSearchViewController
@synthesize      arrbuilding,arrtype,arrcontractor,arrtypeid,arrcontractorid;
@synthesize jsonResultObject,arrbuildingid;
@synthesize spinnerlandscape;

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
    
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
    NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
    NSString *RoleID=[defaults_user stringForKey:@"roleAID"];
    NSString *userID=[defaults_user stringForKey:@"userID"];

    
    GlobalJSONParser *json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"buildings&userID=%@&RoldID=%@",userID,RoleID]];
    
    json.delegate=self;

    
    GlobalJSONParser *json1 =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"certType"]];
    
    json1.delegate=self;
    
    GlobalJSONParser *json2 =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"contractors"]];
    
    json2.delegate=self;
    
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
        
        
        
        //NSLog(@"result: %@", self.arrbuilding);
        
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
        
        if([[JsonDictionary valueForKey:@"type"]isEqualToString:@"contractors"])
        {
            
            NSArray* latestLoans=[[NSArray alloc]init];
            self.arrcontractorid=[[NSMutableArray alloc]init];
            self.arrcontractor =[[NSMutableArray alloc]init];
            
            latestLoans = [JsonDictionary objectForKey:@"result"];
            
            //NSDictionary* details = [latestLoans objectAtIndex:0];
            
            for (NSDictionary *tweetValues in latestLoans) {
                
                NSNumber* contractorID = [tweetValues objectForKey:@"contractorID"];
                
                NSString* contractorCompany = [tweetValues objectForKey:@"contractorCompany"];
                NSLog(@"Building ID ------ %@",contractorID);
                
                NSLog(@"Building Name----- %@",contractorCompany);
                
                
                
                [self.arrcontractor addObject:contractorCompany];
                [self.arrcontractorid addObject:contractorID];
                NSLog(@"Count %d",[self.arrbuildingid count]);
            }
            [self stopSpinnerforlandscape];
            
        }
        
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
        [self stopSpinnerforlandscape];

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
//- (void)dealloc {
//    [LblBuilding release];
//    [BtnBuilding release];
//    [LblContractor release];
//    [LblCertificate release];
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
    
    NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
    NSString *RoleID=[defaults_user stringForKey:@"roleAID"];
    NSString *userID=[defaults_user stringForKey:@"userID"];

    if(([id2 length]>0) &&([id1 length]>0))
    {

        LindiGridViewViewController *home = [[LindiGridViewViewController alloc]init];
        home.Cert_Type=[NSString stringWithFormat:@"searchall&cert_id=%@&build_id=%@&contractor_id=%@&RoldID=%@&userID=%@",id2,id1,id3,RoleID,userID];
        [self.navigationController pushViewController:home animated:YES];
    }
    else if([id2 length]>0)

    {
        LindiGridViewViewController1 *home = [[LindiGridViewViewController1 alloc]init];
        home.Cert_Type=[NSString stringWithFormat:@"searchall&cert_id=%@&build_id=%@&contractor_id=%@&RoldID=%@&userID=%@",id2,id1,id3,RoleID,userID];;
        home.Message1=LblCertificate.text;

        [self.navigationController pushViewController:home animated:YES];
   
    }
    else if([id1 length]>0)
        
    {
        LindiGridViewViewController1 *home = [[LindiGridViewViewController1 alloc]init];
        home.Cert_Type=[NSString stringWithFormat:@"searchall&cert_id=%@&build_id=%@&contractor_id=%@&RoldID=%@&userID=%@",id2,id1,id3,RoleID,userID];;
        home.Message=LblBuilding.text;
        [self.navigationController pushViewController:home animated:YES];
   
    }
    else
    {
        LindiGridViewViewController *home = [[LindiGridViewViewController alloc]init];
        home.Cert_Type=[NSString stringWithFormat:@"searchall&cert_id=%@&build_id=%@&contractor_id=%@&RoldID=%@&userID=%@",id2,id1,id3,RoleID,userID];;
        [self.navigationController pushViewController:home animated:YES];

    }
    

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
    
    
    LblBuilding.text=@"";
    
    
    LblCertificate.text=@"";
    
    id1=@"";
    id2=@"";
    id3=@"";

    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBarHidden=NO;
  
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
@end

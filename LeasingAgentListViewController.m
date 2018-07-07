//
//  RankingViewController.m
//  Toofani Jokes
//
//  Created by S S D on 27/04/16.
//  Copyright © 2016 ToofaniJokes. All rights reserved.
//

#import "LeasingAgentListViewController.h"
#import "LeasingAgentTableViewCell.h"
#import "LeasingAgentAddDataViewController.h"
#import "LeasingAgentHeader.h"

@implementation LeasingAgentListViewController
@synthesize spinnerlandscape,TotalData;
@synthesize arrbuilding,arrbuildingid;
@synthesize buildingid;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buildingid=@"";
    [self LoadCommunity];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)LoadAllData{
    
    NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
    NSString *RoleID=[defaults_user stringForKey:@"roleAID"];
    NSString *userID=[defaults_user stringForKey:@"userID"];
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
    json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"leasing_agent_formlist&agentID=%@&communityID=%@",userID,self.buildingid]];
    json.delegate=self;
    json.flag=@"leasing_agent_formlist";
    
    
}
-(void)LoadCommunity{
    
    NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
    NSString *RoleID=[defaults_user stringForKey:@"roleAID"];
    NSString *userID=[defaults_user stringForKey:@"userID"];
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
    json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"buildings&userID=%@&RoldID=%@",userID,RoleID]];
    json.delegate=self;
    json.flag=@"buildings";
    
}

- (IBAction)Back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
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

#pragma - mark UITableView Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return [[self.TotalData valueForKey:@"formID"]count];
    
    
    
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
        return 50;
        
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        
        
    
    
        static NSString *simpleTableIdentifier = @"LeasingAgent";
        
        LeasingAgentTableViewCell *cell1 = (LeasingAgentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell1 == nil) {
            NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"LeasingAgentTableViewCell" owner:self options:nil];
            cell1 = [nibArray objectAtIndex:0];
        }

        cell1.backgroundColor=[UIColor whiteColor];
    cell1.LblLindyComminity.text=[NSString stringWithFormat:@"%@",[[self.TotalData valueForKey:@"propertyName"]objectAtIndex:indexPath.row]];
    cell1.LblApartmentName.text=[NSString stringWithFormat:@"%@",[[self.TotalData valueForKey:@"apartmentName"]objectAtIndex:indexPath.row]];
    cell1.LblApartmentNo.text=[NSString stringWithFormat:@"%@",[[self.TotalData valueForKey:@"aptNo"]objectAtIndex:indexPath.row]];
    cell1.LblAdjustmentCategory.text=[NSString stringWithFormat:@"%@",[[self.TotalData valueForKey:@"dateAdded"]objectAtIndex:indexPath.row]];
    
    cell1.BtnEidt.tag=indexPath.row;
    [cell1.BtnEidt addTarget:self action:@selector(View:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
//    cell1.LblAdjustmentRate.text=[NSString stringWithFormat:@"%@$",[[self.TotalData valueForKey:@"adjustmentRates"]objectAtIndex:indexPath.row]];

    
    
    return  cell1;

        
        
    

    
    
    
    
     
     
    

    
    
    
    
    
    
    // cell.textLabel.text=[self.arrCatname objectAtIndex:indexPath.row];
    
}
-(void)View:(id)sender
{
    
    UIButton *b = (UIButton*)sender;
    LeasingAgentAddDataViewController *agent=[[LeasingAgentAddDataViewController alloc]init];
    agent.isEdit=YES;
    agent.formID=[NSString stringWithFormat:@"%@",[[self.TotalData valueForKey:@"formID"]objectAtIndex:b.tag]];
    [self.navigationController pushViewController:agent animated:YES];

    
    
}
-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return  49.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UIView *containerView = [[[NSBundle mainBundle] loadNibNamed:@"LeasingAgentHeader" owner:self options:nil] lastObject];
    return containerView;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

//    
//    LeasingAgentAddDataViewController *agent=[[LeasingAgentAddDataViewController alloc]init];
//    agent.isEdit=YES;
//    agent.formID=[NSString stringWithFormat:@"%@",[[self.TotalData valueForKey:@"formID"]objectAtIndex:indexPath.row]];
//    [self.navigationController pushViewController:agent animated:YES];



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

#pragma mark- JSON PARSER Delegate

-(void) RequestFinished:(NSDictionary*)JsonDictionary
{
    [self stopSpinnerforlandscape];
    
    bool issuccess = [[JsonDictionary valueForKey:@"success"]boolValue];
    if(issuccess)
    {
        
        if([json.flag isEqualToString:@"leasing_agent_formlist"])
        {
            self.TotalData=nil;
            self.TotalData=[JsonDictionary valueForKey:@"result"];
            [TableView reloadData];
        }
        if([json.flag isEqualToString:@"buildings"])
        {
            if([[JsonDictionary valueForKey:@"type"]isEqualToString:@"buildings"])
            {
                
                NSArray* latestLoans=[[NSArray alloc]init];
                self.arrbuilding=[[NSMutableArray alloc]init];
                self.arrbuildingid =[[NSMutableArray alloc]init];
                [self.arrbuilding addObject:@"All"];
                [self.arrbuildingid addObject:@""];

                latestLoans = [JsonDictionary objectForKey:@"result"];
                
                for (NSDictionary *tweetValues in latestLoans) {
                    
                    NSNumber* buildingID = [tweetValues objectForKey:@"buildingID"];
                    
                    NSString* buildingName = [tweetValues objectForKey:@"building"];
                    NSLog(@"Building ID ------ %@",buildingID);
                    
                    NSLog(@"Building Name----- %@",buildingName);
                    [self.arrbuilding addObject:buildingName];
                    [self.arrbuildingid addObject:buildingID];
                    NSLog(@"Count %d",[self.arrbuildingid count]);
                }
                self.buildingid=[self.arrbuildingid objectAtIndex:0];
                LblCommunity.text=[self.arrbuilding objectAtIndex:0];

            }
            [self LoadAllData];

            

        }

        
    
        
        
    }
    else
    {
        [self stopSpinnerforlandscape];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"No Results Found." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alertView show];
        //[alertView release];
    }
}

-(void) RequestError
{
    [self stopSpinnerforlandscape];
    
}



//- (void)dealloc {
//    [TableView release];
//    [LblCommunity release];
//    [super dealloc];
//}
- (IBAction)FilterData:(id)sender {
    
    
    dropDown=[[DropDownView alloc]initWithArrayData:self.arrbuilding  cellHeight:50 heightTableView:350 paddingTop:-9 paddingLeft:10 paddingRight:20 refView:LblCommunity animation:BOTH openAnimationDuration:0.5 closeAnimationDuration:0.5];
    dropDown.delegate=self;
    [self.view addSubview:dropDown.view];
    [dropDown openAnimation];
    strflag=@"Building";

}
#pragma mark- show DropDowntable controller in modelpopup
-(void) showTableViewController {
    
}

-(void)dropDownCellSelected:(NSInteger)returnIndex
{
    if([strflag isEqualToString:@"Building"])
    {
        LblCommunity.text=[self.arrbuilding objectAtIndex:returnIndex];
        self.buildingid=[self.arrbuildingid objectAtIndex:returnIndex];
        [self LoadAllData];
        
    }
    
    
    
    
    
}

@end

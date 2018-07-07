//
//  LindiGridViewViewController.m
//  LindiCertification
//
//  Created by Sudip Deshpande on 07/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import "LindiStatCertificateGridViewViewController.h"
#import "WebviewDisplayController.h"
#import "MyPieElement.h"
#import "Example2PieView.h"
#import "PieLayer.h"

@interface LindiStatCertificateGridViewViewController ()
@property (retain, nonatomic) IBOutlet Example2PieView *ViewPiechart;

@end

@implementation LindiStatCertificateGridViewViewController
@synthesize jsonResultObject,Cert_Type,StrStatus;
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
    
    
    //    GlobalJSONParser *json1 =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"certType"]];
    //
    //    json1.delegate=self;
    NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
    NSString *RoleID=[defaults_user stringForKey:@"roleAID"];
    NSString *userID=[defaults_user stringForKey:@"userID"];
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];

    
    json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"buildings&userID=%@&RoldID=%@",userID,RoleID]];
    
    json.delegate=self;
    json.flag=@"buildings";
    LblContractType.text=@"";
    LblBuildingName.text=@"";
    id1=@"";
    id2=@"";
    
//    [self.arrtype addObject:@"Custodial"];
//    [self.arrtype addObject:@"Electric"];
//    [self.arrtype addObject:@"Elevator"];
//    [self.arrtype addObject:@"Gas"];
//    [self.arrtype addObject:@"Guards"];
//    [self.arrtype addObject:@"Landscaping"];
//    [self.arrtype addObject:@"Laundry"];
//    [self.arrtype addObject:@"Office Equipment"];
//    [self.arrtype addObject:@"Pet Control"];
//    [self.arrtype addObject:@"Pool"];
//    [self.arrtype addObject:@"Security/Alarms"];
//    [self.arrtype addObject:@"Snow Removal"];
//    [self.arrtype addObject:@"Telecommunications"];
//    [self.arrtype addObject:@"Waste Removal"];
    

    
    
    
    // Do any additional setup after loading the view from its nib.
 //   [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];

//    GlobalJSONParser *json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"%@",self.Cert_Type]];
//    
//    json.delegate=self;
    Scrolview.contentSize=CGSizeMake(2730, 345);
//    LblStatus.text=[NSString stringWithFormat:@"- %@",self.StrStatus];
    

}
-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark- JSON PARSER Delegate

-(void) RequestFinished:(NSDictionary*)JsonDictionary
{
    [self stopSpinnerforlandscape];

    bool issuccess = [[JsonDictionary valueForKey:@"success"]boolValue];
    if(issuccess)
    {
        
        if([json.flag isEqualToString:@"buildings"])
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

                [self GetCert];
            }
            

            
        }
        else if([json.flag isEqualToString:@"certType"])
        {
            self.arrtype=[[NSMutableArray alloc]init];
            NSArray* latestLoans=[[NSArray alloc]init];
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
            [self.arrtype insertObject:@"All Certificates" atIndex:0];
            [self.arrtypeid insertObject:@"" atIndex:0];

            [self GetStats];


        }

        
        else if([json.flag isEqualToString:@"statReport"])
        {
            //[self.ViewPiechart setup];
            if(self.ViewPiechart)
                [self.ViewPiechart removeFromSuperview];
            self.ViewPiechart=[[Example2PieView alloc]initWithFrame:CGRectMake(518, 50, 450, 450)];
            
//            for (PieLayer *layer in self.ViewPiechart.layer) {
//                [layer removeFromSuperlayer];
//            }
            
            
//            int deleteIndex = self.ViewPiechart.layer.values.count;
//            for(int ind = 0; ind < deleteIndex; ind++){
          //  self.ViewPiechart=nil;
//            if(self.ViewPiechart.layer.values.count == 2)
//            {
//                [self.ViewPiechart.layer deleteValues1:@[self.ViewPiechart.layer.values[0],self.ViewPiechart.layer.values[1]] animated:YES];
////               // [self.ViewPiechart.layer deleteValues:@[self.ViewPiechart.layer.values[0]] animated:YES];
////
//            }


         //   }


            
            self.jsonResultObject =nil;
            self.jsonResultObject =[JsonDictionary objectForKey:@"result"];
            

            NSMutableArray *color = [[NSMutableArray alloc]init];
           // [color addObject:[UIColor colorWithHue:0.33 saturation:1.00 brightness:1.00 alpha:1]];
           // [color addObject:[UIColor colorWithHue:1.00 saturation:1.00 brightness:1.00 alpha:1]];
            [color addObject:[UIColor greenColor]];
            [color addObject:[UIColor redColor]];

            valuesContracts = [[NSMutableArray alloc]init];
            
            NSDictionary *DContracts=[self.jsonResultObject valueForKey:@"Certificates"];
            
            [valuesContracts removeAllObjects];
            [valuesContracts addObject:[DContracts valueForKey:@"Active_Certificates"]];
            [valuesContracts addObject:[DContracts valueForKey:@"Expired_Certificates"]];
            ViewGreenColor.backgroundColor=[UIColor greenColor];
            ViewRedColor.backgroundColor=[UIColor redColor];
            
            
            
            
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
                    LblActiveContract.text=[NSString stringWithFormat:@"Active Certificates : %@ (%@)",[DContracts valueForKey:@"Active_Certificates"],elem.title];
                
                else
                    LblExpiredContract.text=[NSString stringWithFormat:@"Expired Certificates : %@ (%@)",[DContracts valueForKey:@"Expired_Certificates"],elem.title];
                [self.ViewPiechart.layer addValues:@[elem] animated:NO];
            }
            
            //mutch easier do this with array outside
          //  showPercent = YES;
            self.ViewPiechart.layer.transformTitleBlock = ^(PieElement* elem, float percent){
                //  [elem setColor:[UIColor blackColor]];
                
                return [(MyPieElement*)elem title];
                
            };
            self.ViewPiechart.layer.showTitles = ShowTitlesAlways;
            self.ViewPiechart.userInteractionEnabled=NO;
            self.ViewPiechart.backgroundColor=[UIColor clearColor];
            [self.view addSubview:self.ViewPiechart];
            [self GetStatsGRID];

        }

        else if([json.flag isEqualToString:@"statReportListing"])
        {
            self.jsonResultObject =nil;
        
        
        self.jsonResultObject =[JsonDictionary objectForKey:@"result"];
        
        if (self.jsonResultObject) {
            

            [Tblview reloadData];
            [self stopSpinnerforlandscape];

        }
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"Total Rows %d",[[self.jsonResultObject valueForKey:@"certificationID"]count]);
    
    return [[self.jsonResultObject valueForKey:@"certificationID"]count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66.00;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    for(UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
    
    // Configure the cell...
    if(indexPath.section==0)
    {
        UILabel*lblStatus=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 95, 60)];
        
        if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=30)
        {
            lblStatus.backgroundColor=[UIColor greenColor];
            
        }
        else if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=15)
        {
            lblStatus.backgroundColor=[UIColor yellowColor];
            
        }else if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=1)
        {
            //lblStatus.backgroundColor=[UIColor orangeColor];
            lblStatus.backgroundColor=[UIColor colorWithRed:(240.00/255.00) green:(171.00/255.00) blue:(11.00/255.00) alpha:1.0];

            
        }
        else
        {
            lblStatus.backgroundColor=[UIColor redColor];
            
        }
        [cell.contentView addSubview:lblStatus];
        
        
        UILabel*lblID=[[UILabel alloc]initWithFrame:CGRectMake(110, 5, 60, 60)];
        lblID.backgroundColor=[UIColor clearColor];
        lblID.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificationID"] objectAtIndex:indexPath.row]];
        lblID.textAlignment=NSTextAlignmentCenter;
        
        [cell.contentView addSubview:lblID];
        
        
        UILabel*lbltype=[[UILabel alloc]initWithFrame:CGRectMake(180, 5, 95, 60)];
        lbltype.backgroundColor=[UIColor clearColor];
        lbltype.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certType"] objectAtIndex:indexPath.row]];
        
        lbltype.textAlignment=NSTextAlignmentCenter;
        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lbltype.numberOfLines=2;
        [cell.contentView addSubview:lbltype];
        
        
        UILabel*lblbuilding=[[UILabel alloc]initWithFrame:CGRectMake(285, 5, 120, 60)];
        lblbuilding.backgroundColor=[UIColor clearColor];
        lblbuilding.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"building"] objectAtIndex:indexPath.row]];
        
        lblbuilding.textAlignment=NSTextAlignmentCenter;
        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lblbuilding.numberOfLines=2;
        [cell.contentView addSubview:lblbuilding];
        
        
        
        
        UILabel*lbldateissued=[[UILabel alloc]initWithFrame:CGRectMake(415, 5, 145, 60)];
        lbldateissued.backgroundColor=[UIColor clearColor];
        lbldateissued.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificateidate"] objectAtIndex:indexPath.row]];
        lbldateissued.textAlignment=NSTextAlignmentCenter;
        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lbldateissued.numberOfLines=2;
        [cell.contentView addSubview:lbldateissued];
        
        UILabel*lbldateexpiry=[[UILabel alloc]initWithFrame:CGRectMake(570, 5, 155, 60)];
        lbldateexpiry.backgroundColor=[UIColor clearColor];
        lbldateexpiry.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificateedate"] objectAtIndex:indexPath.row]];
        lbldateexpiry.textAlignment=NSTextAlignmentCenter;
        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lbldateexpiry.numberOfLines=2;
        [cell.contentView addSubview:lbldateexpiry];
        
        //propEmail
        UILabel*lblcontactemail=[[UILabel alloc]initWithFrame:CGRectMake(735, 5, 260, 60)];
        lblcontactemail.backgroundColor=[UIColor clearColor];
        lblcontactemail.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"propEmail"] objectAtIndex:indexPath.row]];
        lblcontactemail.textAlignment=NSTextAlignmentCenter;
        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lblcontactemail.numberOfLines=2;
        [cell.contentView addSubview:lblcontactemail];
        
        
        
        UILabel*lblmanageremail=[[UILabel alloc]initWithFrame:CGRectMake(1005, 5, 260, 60)];
        lblmanageremail.backgroundColor=[UIColor clearColor];
        lblmanageremail.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"email"] objectAtIndex:indexPath.row]];
        lblmanageremail.textAlignment=NSTextAlignmentCenter;
        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lblmanageremail.numberOfLines=2;
        [cell.contentView addSubview:lblmanageremail];
        
        
        
        UILabel*lbSpecificUnit=[[UILabel alloc]initWithFrame:CGRectMake(1275, 5, 150, 60)];
        lbSpecificUnit.backgroundColor=[UIColor clearColor];
        lbSpecificUnit.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"specificUnit"] objectAtIndex:indexPath.row]];
        
        lbSpecificUnit.textAlignment=NSTextAlignmentCenter;
        //lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lbSpecificUnit.numberOfLines=3;
        [cell.contentView addSubview:lbSpecificUnit];
        
        
        UILabel*lbcontractorcompany=[[UILabel alloc]initWithFrame:CGRectMake(1435, 5, 215, 60)];
        lbcontractorcompany.backgroundColor=[UIColor clearColor];
        lbcontractorcompany.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"contractorCompany"] objectAtIndex:indexPath.row]];
        lbcontractorcompany.textAlignment=NSTextAlignmentCenter;
        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lbcontractorcompany.numberOfLines=2;
        [cell.contentView addSubview:lbcontractorcompany];
        
        
        UILabel*lbluser=[[UILabel alloc]initWithFrame:CGRectMake(1660, 5, 105, 60)];
        lbluser.backgroundColor=[UIColor clearColor];
        lbluser.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"displayName"] objectAtIndex:indexPath.row]];
        
        lbluser.textAlignment=NSTextAlignmentCenter;
        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lbluser.numberOfLines=2;
        [cell.contentView addSubview:lbluser];
        
        
        UILabel*lbldateadded=[[UILabel alloc]initWithFrame:CGRectMake(1780, 5, 145, 60)];
        lbldateadded.backgroundColor=[UIColor clearColor];
        lbldateadded.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"dateAdded"] objectAtIndex:indexPath.row]];
        
        lbldateadded.textAlignment=NSTextAlignmentCenter;
        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lbldateadded.numberOfLines=2;
        [cell.contentView addSubview:lbldateadded];
        
        
        
        UILabel*lblnote1=[[UILabel alloc]initWithFrame:CGRectMake(1935, 5, 100, 60)];
        lblnote1.backgroundColor=[UIColor clearColor];
        lblnote1.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"notes1"] objectAtIndex:indexPath.row]];
        lblnote1.textAlignment=NSTextAlignmentCenter;
        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lblnote1.numberOfLines=3;
        [cell.contentView addSubview:lblnote1];
        
        UILabel*lblnote2=[[UILabel alloc]initWithFrame:CGRectMake(2045, 5, 90, 60)];
        lblnote2.backgroundColor=[UIColor clearColor];
        lblnote2.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"notes2"] objectAtIndex:indexPath.row]];
        
        lblnote2.textAlignment=NSTextAlignmentCenter;
        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lblnote2.numberOfLines=2;
        [cell.contentView addSubview:lblnote2];
        
        
        UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
        b.frame=CGRectMake(2150, 5, 570, 60);
        [b addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        b.tag=indexPath.row;
        
        UILabel*lblUrltoBox=[[UILabel alloc]initWithFrame:CGRectMake(2150, 5, 570, 60)];
        lblUrltoBox.backgroundColor=[UIColor clearColor];
        lblUrltoBox.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificateUrl"] objectAtIndex:indexPath.row]];
        
        lblUrltoBox.textAlignment=NSTextAlignmentCenter;
        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
        lblUrltoBox.numberOfLines=2;
        [cell.contentView addSubview:lblUrltoBox];
        [cell.contentView addSubview:b];
        
        if([self.Cert_Type isEqualToString:@"allexpire"])
        {
            
            UILabel*lblRenewed=[[UILabel alloc]initWithFrame:CGRectMake(2735, 5, 125, 60)];
            
            if([[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificateUpdated"] objectAtIndex:indexPath.row]] isEqualToString:@"0"])
            {
                lblRenewed.text=@"NO";
                
            }
            else
            {
                lblRenewed.text=@"YES";
                
            }
            
            lblRenewed.backgroundColor=[UIColor clearColor];
            
            lblRenewed.textAlignment=NSTextAlignmentCenter;
            // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
            lblRenewed.numberOfLines=2;
            [cell.contentView addSubview:lblRenewed];
            
            
            UIImageView *v = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"renewed-bg.png"]];
            cell.backgroundView=v;
            
            
            
            
        }
        else
        {
            UIImageView *v = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table-bg.png"]];
            cell.backgroundView=v;
            
        }
        
        
        
    }
    return cell;
}
-(void)Click:(id)sender
{
    UIButton *b = (UIButton*)sender;
    WebviewDisplayController *web =[[WebviewDisplayController alloc]initWithURL:[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificateUrl"] objectAtIndex:b.tag]]];
    web.urlAddress_URL=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificateUrl"] objectAtIndex:b.tag]];
    // [self presentViewController:web animated:YES completion:nil];
    
    UINavigationController *nav_obj=[[UINavigationController alloc]initWithRootViewController:web];
    [self.navigationController presentModalViewController:nav_obj animated:YES];
    
    
    
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *v;
    UIImageView *imgrating;
    if([self.Cert_Type isEqualToString:@"allexpire"])
    {
        
        
        imgrating = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"renewed.png"]];
        //  UIImageView *imgrating = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"5-heart.png",[class.Place_Rating intValue]]]];
        imgrating.frame=CGRectMake(0,0,2600,48);
        //2,731
        
        
    }
    else
    {
        
        
        imgrating = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tittle-bar.png"]];
        //  UIImageView *imgrating = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"5-heart.png",[class.Place_Rating intValue]]]];
        imgrating.frame=CGRectMake(0,0,2474,48);
    }
    return imgrating;
    
    /*UIImageView *imgrating = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tittle-bar.png"]];
     //  UIImageView *imgrating = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"5-heart.png",[class.Place_Rating intValue]]]];
     imgrating.frame=CGRectMake(0,0,2474,48);
     return imgrating;*/
    
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return  48.0;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation

{
   // return YES;
       // return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);

}


//- (void)dealloc {
//    [Tblview release];
//    [Scrolview release];
//    [LblStatus release];
//    [LblBuildingName release];
//    [LblContractType release];
//    [ViewGreenColor release];
//    [ViewGreenColor release];
//    [ViewRedColor release];
//    [LblActiveContract release];
//    [LblExpiredContract release];
//    [_ViewPiechart release];
//    [super dealloc];
//}
//- (void)viewDidUnload {
//    [Tblview release];
//    Tblview = nil;
//    [Scrolview release];
//    Scrolview = nil;
//    [LblStatus release];
//    LblStatus = nil;
//    [super viewDidUnload];
//}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
  //  self.navigationController.navigationBarHidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    //self.navigationController.navigationBarHidden=NO;
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
-(void)GetStats
{
    //statReport&buildingID=17Gas334
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];

    NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
    NSString *RoleID=[defaults_user stringForKey:@"roleAID"];
    NSString *userID=[defaults_user stringForKey:@"userID"];
    json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"%@&buildingID=%@&certTypeID=%@&RoleID=%@&userID=%@",@"statReport",id1,id2,RoleID,userID]];
    json.flag=@"statReport";
    json.delegate=self;
}
-(void)GetCert
{
    //statReport&buildingID=17Gas334
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
    
    json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"certType"]];
    
    json.flag=@"certType";
    json.delegate=self;
}



-(void)GetStatsGRID
{
    //statReport&buildingID=17Gas334
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
    
    NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
    NSString *RoleID=[defaults_user stringForKey:@"roleAID"];
    NSString *userID=[defaults_user stringForKey:@"userID"];
    json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"%@&buildingID=%@&certTypeID=%@&RoleID=%@&userID=%@&type=Certificates",@"statReportListing",id1,id2,RoleID,userID]];
    json.flag=@"statReportListing";
    json.delegate=self;
}

- (IBAction)Search:(id)sender {
    [self GetStats];
}

- (IBAction)Clear:(id)sender {
    
    LblContractType.text=@"";
    LblBuildingName.text=@"";
    id1=@"";
    id2=@"";
    [self GetStats];


}

- (IBAction)SelectBuilding:(id)sender {
    
    dropDown=[[DropDownView alloc]initWithArrayData:self.arrbuilding  cellHeight:50 heightTableView:200 paddingTop:-9 paddingLeft:10 paddingRight:20 refView:LblBuildingName animation:BOTH openAnimationDuration:0.5 closeAnimationDuration:0.5];
    dropDown.delegate=self;
    [self.view addSubview:dropDown.view];
    [dropDown openAnimation];
    strflag=@"Building";

}

- (IBAction)SelectContractType:(id)sender {
    
    dropDown=[[DropDownView alloc]initWithArrayData:self.arrtype  cellHeight:50 heightTableView:200 paddingTop:-9 paddingLeft:10 paddingRight:20 refView:LblContractType animation:BOTH openAnimationDuration:0.5 closeAnimationDuration:0.5];
    dropDown.delegate=self;
    [self.view addSubview:dropDown.view];
    [dropDown openAnimation];
    strflag=@"Contractor";

}
/* OLD CODE
 
 
 UILabel*lblStatus=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 124, 60)];
 
 if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=30)
 {
 lblStatus.backgroundColor=[UIColor greenColor];
 
 }
 else if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=15)
 {
 lblStatus.backgroundColor=[UIColor yellowColor];
 
 }else if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=1)
 {
 lblStatus.backgroundColor=[UIColor orangeColor];
 
 }
 else
 {
 lblStatus.backgroundColor=[UIColor redColor];
 
 }
 [cell.contentView addSubview:lblStatus];
 
 
 UILabel*lbltype=[[UILabel alloc]initWithFrame:CGRectMake(140, 5, 114, 60)];
 lbltype.backgroundColor=[UIColor clearColor];
 lbltype.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certType"] objectAtIndex:indexPath.row]];
 
 lbltype.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lbltype.numberOfLines=2;
 [cell.contentView addSubview:lbltype];
 
 
 UILabel*lblbuilding=[[UILabel alloc]initWithFrame:CGRectMake(258, 5, 130, 60)];
 lblbuilding.backgroundColor=[UIColor clearColor];
 lblbuilding.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"building"] objectAtIndex:indexPath.row]];
 
 lblbuilding.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lblbuilding.numberOfLines=2;
 [cell.contentView addSubview:lblbuilding];
 
 //        UILabel*lblID=[[UILabel alloc]initWithFrame:CGRectMake(174, 5, 90, 60)];
 //        lblID.backgroundColor=[UIColor clearColor];
 //        lblID.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificationID"] objectAtIndex:indexPath.row]];
 //        lblID.textAlignment=NSTextAlignmentCenter;
 //
 //        [cell.contentView addSubview:lblID];
 
 
 UILabel*lbldateissued=[[UILabel alloc]initWithFrame:CGRectMake(400, 5, 128, 60)];
 lbldateissued.backgroundColor=[UIColor clearColor];
 lbldateissued.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificateidate"] objectAtIndex:indexPath.row]];
 lbldateissued.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lbldateissued.numberOfLines=2;
 [cell.contentView addSubview:lbldateissued];
 
 UILabel*lbldateexpiry=[[UILabel alloc]initWithFrame:CGRectMake(550, 5, 160, 60)];
 lbldateexpiry.backgroundColor=[UIColor clearColor];
 lbldateexpiry.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificateedate"] objectAtIndex:indexPath.row]];
 lbldateexpiry.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lbldateexpiry.numberOfLines=2;
 [cell.contentView addSubview:lbldateexpiry];
 
 UILabel*lblcontactemail=[[UILabel alloc]initWithFrame:CGRectMake(730, 5, 300, 60)];
 lblcontactemail.backgroundColor=[UIColor clearColor];
 lblcontactemail.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"email"] objectAtIndex:indexPath.row]];
 lblcontactemail.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lblcontactemail.numberOfLines=2;
 [cell.contentView addSubview:lblcontactemail];
 
 
 
 
 UILabel*lbSpecificUnit=[[UILabel alloc]initWithFrame:CGRectMake(1050, 5, 140, 60)];
 lbSpecificUnit.backgroundColor=[UIColor clearColor];
 lbSpecificUnit.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"specificUnit"] objectAtIndex:indexPath.row]];
 
 lbSpecificUnit.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lbSpecificUnit.numberOfLines=2;
 [cell.contentView addSubview:lbSpecificUnit];
 
 
 UILabel*lbcontractorcompany=[[UILabel alloc]initWithFrame:CGRectMake(1200, 5, 320, 60)];
 lbcontractorcompany.backgroundColor=[UIColor clearColor];
 lbcontractorcompany.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"contractorCompany"] objectAtIndex:indexPath.row]];
 lbcontractorcompany.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lbcontractorcompany.numberOfLines=2;
 [cell.contentView addSubview:lbcontractorcompany];
 
 UILabel*lblnote1=[[UILabel alloc]initWithFrame:CGRectMake(1535, 5, 124, 60)];
 lblnote1.backgroundColor=[UIColor clearColor];
 lblnote1.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"notes1"] objectAtIndex:indexPath.row]];
 lblnote1.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lblnote1.numberOfLines=2;
 [cell.contentView addSubview:lblnote1];
 
 UILabel*lblnote2=[[UILabel alloc]initWithFrame:CGRectMake(1665, 5, 130, 60)];
 lblnote2.backgroundColor=[UIColor clearColor];
 lblnote2.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"notes2"] objectAtIndex:indexPath.row]];
 
 lblnote2.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lblnote2.numberOfLines=2;
 [cell.contentView addSubview:lblnote2];
 
 
 UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
 b.frame=CGRectMake(1810, 5, 510, 60);
 [b addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
 b.tag=indexPath.row;
 
 UILabel*lblUrltoBox=[[UILabel alloc]initWithFrame:CGRectMake(1810, 5, 510, 60)];
 lblUrltoBox.backgroundColor=[UIColor clearColor];
 lblUrltoBox.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificateUrl"] objectAtIndex:indexPath.row]];
 
 lblUrltoBox.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lblUrltoBox.numberOfLines=2;
 [cell.contentView addSubview:lblUrltoBox];
 [cell.contentView addSubview:b];
 
 
 UILabel*lblUploaddoc=[[UILabel alloc]initWithFrame:CGRectMake(2340, 5, 180, 60)];
 lblUploaddoc.backgroundColor=[UIColor clearColor];
 lblUploaddoc.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"linkToDoc1"] objectAtIndex:indexPath.row]];
 lblUploaddoc.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lblUploaddoc.numberOfLines=2;
 [cell.contentView addSubview:lblUploaddoc];
 
 UILabel*lbldateadded=[[UILabel alloc]initWithFrame:CGRectMake(2540, 5, 180, 60)];
 lbldateadded.backgroundColor=[UIColor clearColor];
 lbldateadded.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"dateAdded"] objectAtIndex:indexPath.row]];
 
 lbldateadded.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lbldateadded.numberOfLines=2;
 [cell.contentView addSubview:lbldateadded];
 
 
 UIImageView *v = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table-bg.png"]];
 cell.backgroundView=v;

 
 */
#pragma mark- show DropDowntable controller in modelpopup
-(void) showTableViewController {
    
}

-(void)dropDownCellSelected:(NSInteger)returnIndex
{
    if([strflag isEqualToString:@"Building"])
    {
        LblBuildingName.text=[self.arrbuilding objectAtIndex:returnIndex];
        id1=[self.arrbuildingid objectAtIndex:returnIndex];
        
    }
    
    if([strflag isEqualToString:@"Contractor"])
    {
        LblContractType.text=[self.arrtype objectAtIndex:returnIndex];
        id2=[self.arrtypeid objectAtIndex:returnIndex];
        
    }
   
    
    
    
}


@end

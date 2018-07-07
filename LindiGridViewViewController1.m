//
//  LindiGridViewViewController.m
//  LindiCertification
//
//  Created by Sudip Deshpande on 07/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import "LindiGridViewViewController1.h"
#import "WebviewDisplayController.h"
@interface LindiGridViewViewController1 ()

@end

@implementation LindiGridViewViewController1
@synthesize jsonResultObject,Cert_Type,Message,Message1;
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
    // Do any additional setup after loading the view from its nib.
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];

    GlobalJSONParser *json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"%@",self.Cert_Type]];
    
    if(self.Message)
    {
        LblMessage.text=self.Message;

    }
    else
    {
        LblMessage.text=self.Message1;

    }
    
    json.delegate=self;
    Scrollview.contentSize=CGSizeMake(3750, 700);
    
    //3750/700
    

}
-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark- JSON PARSER Delegate

-(void) RequestFinished:(NSDictionary*)JsonDictionary
{
    bool issuccess = [[JsonDictionary valueForKey:@"success"]boolValue];
    if(issuccess)
    {
        self.jsonResultObject =[JsonDictionary objectForKey:@"result"];
        
        if (self.jsonResultObject) {
            

            [Tblview reloadData];
            [self stopSpinnerforlandscape];
            LblTotalRecords.text=[NSString stringWithFormat:@"Total Records: %d",[[self.jsonResultObject valueForKey:@"certificationID"]count]];


        }
    }
    else
    {
        [self stopSpinnerforlandscape];

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
        
        if(self.Message)
        {
            UILabel*lblStatus=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 95, 60)];
            
            if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=60)
            {
                lblStatus.backgroundColor=[UIColor greenColor];
                
            }
            else if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=30)
            {
                lblStatus.backgroundColor=[UIColor yellowColor];
                
            }else if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=0)
            {
//                lblStatus.backgroundColor=[UIColor orangeColor];
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
            
            
            UILabel*lbltype=[[UILabel alloc]initWithFrame:CGRectMake(180, 5, 215, 60)];
            lbltype.backgroundColor=[UIColor clearColor];
            lbltype.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certType"] objectAtIndex:indexPath.row]];
            
            lbltype.textAlignment=NSTextAlignmentCenter;
            // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
            lbltype.numberOfLines=2;
            [cell.contentView addSubview:lbltype];
            
            
            UILabel*lblbuilding=[[UILabel alloc]initWithFrame:CGRectMake(180, 5, 120, 60)];
            lblbuilding.backgroundColor=[UIColor clearColor];
            lblbuilding.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"building"] objectAtIndex:indexPath.row]];
            
            lblbuilding.textAlignment=NSTextAlignmentCenter;
            // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
            lblbuilding.numberOfLines=2;
           // [cell.contentView addSubview:lblbuilding];
            
            
            
            
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
        }
        else
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
//                lblStatus.backgroundColor=[UIColor orangeColor];
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
            
            
            UILabel*lbltype=[[UILabel alloc]initWithFrame:CGRectMake(180, 5, 215, 60)];
            lbltype.backgroundColor=[UIColor clearColor];
            lbltype.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certType"] objectAtIndex:indexPath.row]];
            
            lbltype.textAlignment=NSTextAlignmentCenter;
            // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
            lbltype.numberOfLines=2;
            //[cell.contentView addSubview:lbltype];
            
            
            UILabel*lblbuilding=[[UILabel alloc]initWithFrame:CGRectMake(180, 5, 215, 60)];
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
            
        }
        
        
    UIImageView *v = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_new.png"]];
    cell.backgroundView=v;
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
    UIImageView *imgrating = [[UIImageView alloc]init];
    if(self.Message1)
    {
        [imgrating setImage:[UIImage imageNamed:@"band_building.png"]];
    }
    else
    {
        [imgrating setImage:[UIImage imageNamed:@"band_type.png"]];

    }
    //  UIImageView *imgrating = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"5-heart.png",[class.Place_Rating intValue]]]];
    imgrating.frame=CGRectMake(0,0,2472,49);
    return imgrating;
    
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return  49.0;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation

{
   // return YES;
       // return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);

}


//- (void)dealloc {
//    [Tblview release];
//    [LblMessage release];
//    [Scrollview release];
//    [super dealloc];
//}
//- (void)viewDidUnload {
//    [Tblview release];
//    Tblview = nil;
//    [LblMessage release];
//    LblMessage = nil;
//    [Scrollview release];
//    Scrollview = nil;
//    [super viewDidUnload];
//}
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

/*
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
 
 
 //        UILabel*lblbuilding=[[UILabel alloc]initWithFrame:CGRectMake(258, 5, 130, 60)];
 //        lblbuilding.backgroundColor=[UIColor clearColor];
 //        lblbuilding.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"building"] objectAtIndex:indexPath.row]];
 //
 //        lblbuilding.textAlignment=NSTextAlignmentCenter;
 //        // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 //        lblbuilding.numberOfLines=2;
 //        [cell.contentView addSubview:lblbuilding];
 
 //        UILabel*lblID=[[UILabel alloc]initWithFrame:CGRectMake(174, 5, 90, 60)];
 //        lblID.backgroundColor=[UIColor clearColor];
 //        lblID.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificationID"] objectAtIndex:indexPath.row]];
 //        lblID.textAlignment=NSTextAlignmentCenter;
 //
 //        [cell.contentView addSubview:lblID];
 
 
 UILabel*lbldateissued=[[UILabel alloc]initWithFrame:CGRectMake(300, 5, 128, 60)];
 lbldateissued.backgroundColor=[UIColor clearColor];
 lbldateissued.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificateidate"] objectAtIndex:indexPath.row]];
 lbldateissued.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lbldateissued.numberOfLines=2;
 [cell.contentView addSubview:lbldateissued];
 
 UILabel*lbldateexpiry=[[UILabel alloc]initWithFrame:CGRectMake(450, 5, 160, 60)];
 lbldateexpiry.backgroundColor=[UIColor clearColor];
 lbldateexpiry.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificateedate"] objectAtIndex:indexPath.row]];
 lbldateexpiry.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lbldateexpiry.numberOfLines=2;
 [cell.contentView addSubview:lbldateexpiry];
 
 UILabel*lblcontactemail=[[UILabel alloc]initWithFrame:CGRectMake(630, 5, 300, 60)];
 lblcontactemail.backgroundColor=[UIColor clearColor];
 lblcontactemail.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"email"] objectAtIndex:indexPath.row]];
 lblcontactemail.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lblcontactemail.numberOfLines=2;
 [cell.contentView addSubview:lblcontactemail];
 
 
 
 
 UILabel*lbSpecificUnit=[[UILabel alloc]initWithFrame:CGRectMake(970, 5, 140, 60)];
 lbSpecificUnit.backgroundColor=[UIColor clearColor];
 lbSpecificUnit.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"specificUnit"] objectAtIndex:indexPath.row]];
 
 lbSpecificUnit.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lbSpecificUnit.numberOfLines=2;
 [cell.contentView addSubview:lbSpecificUnit];
 
 
 UILabel*lbcontractorcompany=[[UILabel alloc]initWithFrame:CGRectMake(1150, 5, 320, 60)];
 lbcontractorcompany.backgroundColor=[UIColor clearColor];
 lbcontractorcompany.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"contractorCompany"] objectAtIndex:indexPath.row]];
 lbcontractorcompany.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lbcontractorcompany.numberOfLines=2;
 [cell.contentView addSubview:lbcontractorcompany];
 
 UILabel*lblnote1=[[UILabel alloc]initWithFrame:CGRectMake(1480, 5, 124, 60)];
 lblnote1.backgroundColor=[UIColor clearColor];
 lblnote1.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"notes1"] objectAtIndex:indexPath.row]];
 lblnote1.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lblnote1.numberOfLines=2;
 [cell.contentView addSubview:lblnote1];
 
 UILabel*lblnote2=[[UILabel alloc]initWithFrame:CGRectMake(1580, 5, 130, 60)];
 lblnote2.backgroundColor=[UIColor clearColor];
 lblnote2.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"notes2"] objectAtIndex:indexPath.row]];
 
 lblnote2.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lblnote2.numberOfLines=2;
 [cell.contentView addSubview:lblnote2];
 
 
 UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
 b.frame=CGRectMake(1770, 5, 510, 60);
 [b addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
 b.tag=indexPath.row;
 
 UILabel*lblUrltoBox=[[UILabel alloc]initWithFrame:CGRectMake(1770, 5, 510, 60)];
 lblUrltoBox.backgroundColor=[UIColor clearColor];
 lblUrltoBox.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificateUrl"] objectAtIndex:indexPath.row]];
 
 lblUrltoBox.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lblUrltoBox.numberOfLines=2;
 [cell.contentView addSubview:lblUrltoBox];
 [cell.contentView addSubview:b];
 
 
 UILabel*lblUploaddoc=[[UILabel alloc]initWithFrame:CGRectMake(2330, 5, 180, 60)];
 lblUploaddoc.backgroundColor=[UIColor clearColor];
 lblUploaddoc.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"linkToDoc1"] objectAtIndex:indexPath.row]];
 lblUploaddoc.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lblUploaddoc.numberOfLines=2;
 [cell.contentView addSubview:lblUploaddoc];
 
 UILabel*lbldateadded=[[UILabel alloc]initWithFrame:CGRectMake(2530, 5, 180, 60)];
 lbldateadded.backgroundColor=[UIColor clearColor];
 lbldateadded.text=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"dateAdded"] objectAtIndex:indexPath.row]];
 
 lbldateadded.textAlignment=NSTextAlignmentCenter;
 // lbldateissued.font=[UIFont fontWithName:@"Arial" size:12];
 lbldateadded.numberOfLines=2;
 [cell.contentView addSubview:lbldateadded];
 */

@end

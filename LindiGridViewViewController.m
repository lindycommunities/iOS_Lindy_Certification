//
//  LindiGridViewViewController.m
//  LindiCertification
//
//  Created by Sudip Deshpande on 07/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import "LindiGridViewViewController.h"
#import "WebviewDisplayController.h"
@interface LindiGridViewViewController ()

@end

@implementation LindiGridViewViewController
@synthesize jsonResultObject,Cert_Type,DOBYYMMDD;
@synthesize spinnerlandscape,certificateID,flag;

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
    check=0;
    // Do any additional setup after loading the view from its nib.
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];

    GlobalJSONParser *json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"%@",self.Cert_Type]];
    
    
    json.delegate=self;
    if([self.Cert_Type isEqualToString:@"allexpire"])
    {
        Scrollview.contentSize=CGSizeMake(2870, 700);
        Tblview.frame=CGRectMake(0, 0,2870, 670);
    }
    else
    {
        Scrollview.contentSize=CGSizeMake(2910, 700);

    }
    

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
        
        if([self.flag isEqualToString:@"updateInspectionStatus"])
        {
            self.flag=@"";
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Inspection Updated" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alertView show];
            [self HideInspectionBox:@""];

            
        }
        else
        {
            self.jsonResultObject =[JsonDictionary objectForKey:@"result"];
            
            if (self.jsonResultObject) {
                
                
                [Tblview reloadData];
                [self stopSpinnerforlandscape];
                LblTotalRecords.text=[NSString stringWithFormat:@"Total Records: %d",[[self.jsonResultObject valueForKey:@"certificationID"]count]];
                
            }

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
        UILabel*lblStatus=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 95, 60)];
//        lblStatus.text=[NSString stringWithFormat:@"%d",(indexPath.row+1)];
//        lblStatus.textAlignment=NSTextAlignmentCenter;
//        lblStatus.textColor=[UIColor whiteColor];
//         lblStatus.font=[UIFont fontWithName:@"Arial-Bold" size:15];
//
        
//        if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=30)
        if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=60)

        {
            lblStatus.backgroundColor=[UIColor greenColor];
            
        }
       // else if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=15)
        else if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=30)
            
        {
            lblStatus.backgroundColor=[UIColor yellowColor];
            
        }else if([[[self.jsonResultObject valueForKey:@"remainingDays"] objectAtIndex:indexPath.row] intValue]>=0)//1
        {
            //lblStatus.backgroundColor=[UIColor orangeColor];
            lblStatus.backgroundColor=[UIColor colorWithRed:(240.00/255.00) green:(171.00/255.00) blue:(11.00/255.00) alpha:1.0];
            
        }
        else
        {
            lblStatus.backgroundColor=[UIColor redColor];
            
        }
        
        if([[[self.jsonResultObject valueForKey:@"statusOfInspection"] objectAtIndex:indexPath.row]isEqualToString:@"1"])
        {
            lblStatus.backgroundColor=[UIColor blueColor];
            
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
            UIButton *b =[UIButton buttonWithType:UIButtonTypeCustom];
        b.frame=CGRectMake(2750, 3, 130, 60);
        [b setImage:[UIImage imageNamed:@"update-bt.png"] forState:UIControlStateNormal];
            [b addTarget:self action:@selector(UpdageStatus:) forControlEvents:UIControlEventTouchUpInside];
            b.tag=indexPath.row;

            [cell.contentView addSubview:b];
            UIImageView *v = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table-bg.png"]];
            cell.backgroundView=v;

        }
        


        
    }
    return cell;
}
-(void)UpdageStatus:(id)sender
{
    //certificationID
    UIButton *b = (UIButton*)sender;

    self.certificateID=[NSString stringWithFormat:@"%@",[[self.jsonResultObject valueForKey:@"certificationID"] objectAtIndex:b.tag]];
    ViewUpdateInspection.layer.borderColor = [UIColor blackColor].CGColor;
    ViewUpdateInspection.layer.borderWidth = 2.0f;
    ViewUpdateInspection.hidden=NO;
    ViewUpdateInspection.transform = CGAffineTransformMakeScale(0.05, 0.05);
    
    // Store original centre point of the destination view
    CGPoint originalCenter = self.view.center;
    // Set center to start point of the button
    ViewUpdateInspection.center = originalCenter;
    
    [UIView animateWithDuration:0.7
                          delay:0.1
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // Grow!
                         ViewUpdateInspection.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         ViewUpdateInspection.center = originalCenter;
                     }
                     completion:^(BOOL finished){
                       //  ViewAddMSG.frame=CGRectMake(0, 0, 320, 518);
                     }];
    

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
        //imgrating.frame=CGRectMake(0,0,2474,48);
        imgrating.frame=CGRectMake(0,0,2650,48);
        
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
//    [Scrollview release];
//    [ViewUpdateInspection release];
//    [TxtInspectionDate release];
//    [BtnCheck release];
//    [LblTotalRecords release];
//    [super dealloc];
//}
//- (void)viewDidUnload {
//    [Tblview release];
//    Tblview = nil;
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

-(void)stopSpinnerforlandscape

{
    
    [self.spinnerlandscape.view removeFromSuperview];
    self.spinnerlandscape= nil;
}

- (IBAction)HideInspectionBox:(id)sender {
    
    
    [UIView animateWithDuration:0.7
                          delay:0.1
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // Shrink!
                         ViewUpdateInspection.transform = CGAffineTransformMakeScale(0.05, 0.05);
                         ViewUpdateInspection.center = self.view.center;
                     }
                     completion:^(BOOL finished){
                         ViewUpdateInspection.hidden=YES;
                         // remove from temp super view
                         [TxtInspectionDate resignFirstResponder];
                         TxtInspectionDate.text=@"";
                         [BtnCheck setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
                     }];

}

- (IBAction)UpdateInspection:(id)sender {
    
    if([TxtInspectionDate.text length]<=0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Please select Date" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alertView show];
    }
    else if(check==0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Please check for the inspection Confirmation" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
        
        NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
        NSString *userID=[defaults_user stringForKey:@"userID"];

        
        self.flag=@"updateInspectionStatus";
        GlobalJSONParser *json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"updateInspectionStatus&certificateID=%@&statusOfInspection=1&dateOfInspection=%@&userID=%@",self.certificateID,self.DOBYYMMDD,userID]];
        json.delegate=self;
    }
    
}

- (IBAction)ToggleCheck:(id)sender {
    
    if(check==0)
    {
        check=1;
        [BtnCheck setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];

    }
    else
    {
        check=0;
        [BtnCheck setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];

    }
}
#pragma mark will handle dismissal for datepicker

- (void)DatePickerViewControllerDidFinish:(DatePickerViewController *)controller
{
    //fetch datepicker value from controller object
    dateofbirthformat = [[NSDateFormatter alloc] init];
    [dateofbirthformat setTimeStyle:NSDateFormatterNoStyle];
    [dateofbirthformat setDateFormat:@"MM-dd-yyyy"];
    TxtInspectionDate.text = [dateofbirthformat stringFromDate:[controller.datePicker date]];
    
    
    dateofbirthformat1 = [[NSDateFormatter alloc] init];
    [dateofbirthformat1 setTimeStyle:NSDateFormatterNoStyle];
    [dateofbirthformat1 setDateFormat:@"yyyy-MM-dd"];
    self.DOBYYMMDD = [dateofbirthformat1 stringFromDate:[controller.datePicker date]];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark will handel dismmiss of datepicker if user press cancel btn
- (void)DatePickerViewControllerDidCancel:(DatePickerViewController *)controller
{
    //do nothing just dissmiss datepicker modelview
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (IBAction)ShowDatePicker:(id)sender {
    
    DatePickerViewController *dpvc = [[DatePickerViewController alloc] init];
    [dpvc setDelegate:self];
    [dpvc setTitle:@"Select Date"];
    UINavigationController *navDpvc = [[UINavigationController alloc] initWithRootViewController:dpvc];
    [navDpvc.navigationBar setTintColor:[UIColor blackColor]];
    [navDpvc setModalPresentationStyle:UIModalPresentationFormSheet];
    [navDpvc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:navDpvc animated:YES completion:nil];

}
@end

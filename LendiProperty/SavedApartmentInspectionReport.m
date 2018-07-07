//
//  SavedApartmentInspectionReport.m
//  LendiProperty
//
//  Created by Vinay Devdikar on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SavedApartmentInspectionReport.h"

@implementation SavedApartmentInspectionReport

@synthesize Desptext;

@synthesize spinnerView;

@synthesize roomtypelbl;

@synthesize lblBuilding;

@synthesize residentnametext,unitnotext;

@synthesize DamageDescriptionTable;

@synthesize lblTotal;

- (id)initWithReportID:(int)_Rid WithUserName:(NSString *)_Username
{
    self = [super init];
    if (self)
    
    {
        
        Reportid=_Rid;
      
    }
    
    return self;
}



#pragma mark - Apps Methods

-(void)setData{
    
        lblBuilding.text        = Obj_parser.Building;
        Desptext.text           = Obj_parser.strAIDesc;
        residentnametext.text   = Obj_parser.resident_name;
        unitnotext.text         = Obj_parser.unit_no;
        roomtypelbl.text        = Obj_parser.room_type;

        [self performSelector:@selector(SetTheDamageInsepaction) withObject:self afterDelay:2.0];
}

-(IBAction)ViewPhoto{
    
    InclementWeatherReportPhotoViewController *obj_photo=[[InclementWeatherReportPhotoViewController alloc]initWithParserObj:Obj_parser WithReportId:Reportid WithRporttype:@"inspection_form "];
    [self.navigationController pushViewController:obj_photo animated:YES];
    
}


- (void)SetTheDamageInsepaction{
    
    NSString *strURL=[NSString stringWithFormat:@"%@getInspectionDamageDetails&report_id=%@",SecondUrl,Reportidstr];
    NSLog(@"%@",[strURL stringByAddingPercentEscapesUsingEncoding:
                 NSASCIIStringEncoding]);
   getthedamagedetails=YES;
    NSURL *url = [[NSURL alloc]initWithString:[strURL stringByAddingPercentEscapesUsingEncoding:
                                               NSASCIIStringEncoding]];
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:url];
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(theConnection) {
        webData = [[NSMutableData data] retain];
    }

}

#pragma mark- UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [DamageTypeSelectedArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    tableView.separatorColor = [UIColor blackColor];
    
    
    for (UIView *view in cell.contentView.subviews){
        [view removeFromSuperview];
        
    }
    
    
    cell.contentView.backgroundColor = [UIColor colorWithRed:(float)(187.00/255) green:(float)(224.00/255) blue:(float)(227.00/255) alpha:1];
    
    UIView* myBackgroundView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    
    myBackgroundView.backgroundColor =  [UIColor colorWithRed:(float)(187.00/255) green:(float)(224.00/255) blue:(float)(227.00/255) alpha:1];
    
    cell.backgroundView = myBackgroundView;
    
    
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 150, 50)];
    lbl.font=[UIFont boldSystemFontOfSize:12.0];
    lbl.numberOfLines=2;
    lbl.backgroundColor=[UIColor clearColor];
    lbl.textAlignment=UITextAlignmentLeft;
    lbl.text=[DamageTypeSelectedArray objectAtIndex:indexPath.row];
    [cell.contentView addSubview:lbl];
    
    
    NSString* damageCost=[DamageCostSelectedArray objectAtIndex:indexPath.row];
    damageCost=[damageCost stringByReplacingOccurrencesOfString:@"," withString:@": $"];
    
    UILabel *lbl1=[[UILabel alloc]initWithFrame:CGRectMake(180, 0, 300, 50)];
    lbl1.font=[UIFont boldSystemFontOfSize:12.0];
    lbl1.numberOfLines=2;
    lbl1.backgroundColor=[UIColor clearColor];
    lbl1.textAlignment=UITextAlignmentLeft;
    lbl1.text=damageCost;
    [cell.contentView addSubview:lbl1];
      
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 50;
        
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        return 50;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
        UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,0,768,50)];
        tempView.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
            UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 150, 50)];
            lbl.font=[UIFont boldSystemFontOfSize:12.0];
            lbl.backgroundColor=[UIColor clearColor];
            lbl.textAlignment=UITextAlignmentLeft;
            lbl.text=@"Damage Type";
            [tempView addSubview:lbl];
            
            UILabel *lbl1=[[UILabel alloc]initWithFrame:CGRectMake(180, 0, 300, 50)];
            lbl1.font=[UIFont boldSystemFontOfSize:12.0];
            lbl1.backgroundColor=[UIColor clearColor];
            lbl1.textAlignment=UITextAlignmentLeft;
            lbl1.text=@"Damage Cost";
            [tempView addSubview:lbl1];
        
        return tempView;
    
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
    //[self stopSpinner];
    
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
        
        
        if(getthealldetails){
        
            NSDictionary *dic =[jsondic valueForKey:@"result"];
            Reportidstr=[dic valueForKey:@"report_id"];
            [Reportidstr retain];
            Obj_parser.Building=[dic valueForKey:@"property_name"];
            Obj_parser.strAIDesc=[dic valueForKey:@"issue_description"];
            Obj_parser.CreationDate=[dic valueForKey:@"creation_date"];
            Obj_parser.resident_name=[dic valueForKey:@"resident_name"];
            Obj_parser.unit_no=[dic valueForKey:@"unit_no"];
            Obj_parser.room_type=[dic valueForKey:@"room_type"];
            getthealldetails=NO;
            [self setData];
            [connection release];
            
        }

        if(getthedamagedetails){
            
            NSDictionary *dic =[jsondic valueForKey:@"result"];
            DamageTypeSelectedArray=[[NSMutableArray alloc]initWithArray:[dic valueForKey:@"damage_type"]];
            DamageCostSelectedArray=[[NSMutableArray alloc]initWithArray:[dic valueForKey:@"damage_cost"]];
            
            int lastTotal;
            lastTotal=0;
            for (int i=0; i<[DamageCostSelectedArray count]; i++){
                
                NSString *SelectedDamageCost = [DamageCostSelectedArray objectAtIndex:i];
                NSArray *arr = [SelectedDamageCost componentsSeparatedByString:@","];
                NSString *coststr = [arr objectAtIndex:1];
                int newValue=[coststr integerValue];
                lastTotal=lastTotal+newValue;
                             
            }
            
            lblTotal.text=[NSString stringWithFormat:@"$ %d",lastTotal];
            
            
            
            
            
            
            
            
            
            [DamageDescriptionTable reloadData];
            [self stopSpinner];
            getthedamagedetails=NO;
            
        }
        
        
        
        
    }
    
    
    
    
    
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



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
  
    
    self.title=@"Saved Leasing Agent Report";
    
    [self startSpinner:@"spinner" andDisplay:@"Loading.."];
    
    DamageDescriptionTable.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
    
    Obj_parser=[[ParserClass alloc]init];
    
    NSString *temp_url=[NSString stringWithFormat:@"%@getInspectionDetails&report_id=%d",SecondUrl,Reportid];
    
    getthealldetails=YES;
    
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

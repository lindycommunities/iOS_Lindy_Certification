//
//  ReportSelectionViewController.m
//  LendiProperty
//
//  Created by Vinay D on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReportSelectionViewController.h"


@implementation ReportSelectionViewController

@synthesize Selection_tab;

@synthesize  HeaderLab;

@synthesize spinnerView;

- (id)initWithTag:(int)_tag;
{
    self = [super init];
    if (self)
    {
        
        tag=_tag;
        
       self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
        val=0;
        
        
        
    }
    return self;
}



#pragma mark - Tableview Delegates



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
     return [nameArr count];
     
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [nameArr objectAtIndex:section];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
     [self GetRowesWithUserCount:section];
         
     return [parserarray count];
    
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
  
    
    static NSString *CellIdentifier = @"Cell";
    
    [self GetRowesWithUserCount:indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
       
    ParserClass *objParse;
    objParse = (ParserClass *)[parserarray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ Report",objParse.selectedProperty];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Created By: %@ Date: %@", objParse.User_ID,objParse.CreationDate];
    
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    tableView.separatorColor = [UIColor blackColor];
    
    
    
    
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    
    
    
    
    
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section 
{
    return 30;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    [self GetRowesWithUserCount:indexPath.section];
    ParserClass *objParse;
    objParse = (ParserClass *)[parserarray objectAtIndex:indexPath.row];
     
    
    
    if (tag == 1)
    {
      SavedPMViewController *objSavedPMVC = [[SavedPMViewController alloc]initWithReportID:[objParse.Report_ID intValue]WithUserName:objParse.User_ID];
       [self.navigationController pushViewController:objSavedPMVC animated:YES];
       [objSavedPMVC release];
        
       
    }
    if (tag == 2)
        
    {
        SavedIRViewController *objSavedIRVC= [[SavedIRViewController alloc]initWithReportID:[objParse.Report_ID intValue] WithUserName:objParse.User_ID];
        [self.navigationController pushViewController:objSavedIRVC animated:YES];
        [objSavedIRVC release];

        
    }
    
    else if(tag==3)
            
    {
        
        InclemnetWeatherViewReportController *objSavedIWRC=[[InclemnetWeatherViewReportController alloc]initWithReportID:[objParse.Report_ID intValue] WithUserName:objParse.User_ID];
        [self.navigationController pushViewController:objSavedIWRC animated:YES];
        [objSavedIWRC release];
        
        
    }
    
    else if(tag==4)
        
    {
        
        DailyActivityCheklistReportViewController *objSavedDACLC=[[DailyActivityCheklistReportViewController alloc]initWithReportID:[objParse.Report_ID intValue] WithUserName:objParse.User_ID];
        [self.navigationController pushViewController:objSavedDACLC animated:YES];
        [objSavedDACLC release];
        
    }
    
    
    else if(tag==5)
        
    {
    
    LeasingAgentReportViewController *objSavedLAVC=[[LeasingAgentReportViewController alloc]initWithReportID:[objParse.Report_ID intValue] WithUserName:objParse.User_ID];
        [self.navigationController pushViewController:objSavedLAVC animated:YES];
        [objSavedLAVC release];
        
        
        
    }
    else if(tag==6)
    
    {
        
        WeeklyManagerReportController *objSavedWMRVC=[[WeeklyManagerReportController alloc]initWithReportID:[objParse.Report_ID intValue] WithUserName:objParse.User_ID];
        [self.navigationController pushViewController:objSavedWMRVC animated:YES];
        [objSavedWMRVC release];
        
        
        
        
    }
    else if(tag==7)
        
    {
        
        SavedApartmentInspectionReport *objSavedAIVC=[[SavedApartmentInspectionReport alloc]initWithReportID:[objParse.Report_ID intValue] WithUserName:objParse.User_ID];
        [self.navigationController pushViewController:objSavedAIVC animated:YES];
        [objSavedAIVC release];
        
        
        
        
    }

    
    
}

#pragma mark - Apps Methods

-(void)backButtonClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)GetRowesWithUserCount:(int)_count
{
  
    if([arrResult count]>0)
        
    {
        parserarray=[[NSMutableArray alloc]init];
        // [parserarray removeAllObjects];
        
        NSDictionary *dict=[arrResult objectAtIndex:_count];
        NSArray *arr=[[NSMutableArray alloc]initWithArray:[dict valueForKey:[nameArr objectAtIndex:_count]]];
        
        NSMutableArray *ReportID=[[NSMutableArray alloc]init];
        NSMutableArray *Creationdate=[[NSMutableArray alloc]init];
        NSMutableArray *UserName=[[NSMutableArray alloc]init];
         NSMutableArray *property_name=[[NSMutableArray alloc]init];
             
        ReportID=[arr valueForKey:@"report_id"];
        UserName=[arr valueForKey:@"user_name"];
        Creationdate=[arr valueForKey:@"creation_date"];
        property_name=[arr valueForKey:@"property_name"];
                
        
            
        
        for (int i=0; i<[ReportID count]; i++)
        {
            
            ParserClass *parse=[[ParserClass alloc]init];
            parse.Report_ID=[ReportID objectAtIndex:i];
            parse.User_ID=[UserName objectAtIndex:i];
            parse.CreationDate=[Creationdate objectAtIndex:i];
            parse.selectedProperty=[property_name objectAtIndex:i];
            [parserarray addObject:parse];
            [parse release];
            
        }
       
       
     /*   [ReportID release];
        [Creationdate release];
        [UserName release];*/
         
        

    }

}

-(IBAction)NextbtnClick
{
  NSLog(@"Max %d Min %d ",maxval,minval);
    [self startSpinner:@"spinner" andDisplay:@"Loading"];
    
        minval=maxval;
        maxval=maxval+20;
          
    [self GetDataWithMinval:minval WithMaxval:maxval];
   
    
 
    
}

-(IBAction)BackbtnClick
{
    
   [self startSpinner:@"spinner" andDisplay:@"Loading"];
      
    NSLog(@"Max %d Min %d ",maxval,minval);
    
    
    
    if(maxval==19 && minval==0)
    {
        [self stopSpinner];
        maxval=19;
        minval=0;
        
        UIAlertView *alt_Show = [[UIAlertView alloc]initWithTitle:@"Lindi Property" message:@"Sorry No Reports To Display...." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alt_Show show];
        [alt_Show release];
    }
    else
    {
        maxval=minval;
        if (minval==19)
            
        {
            
            minval=minval-19;
        }
        else
            
        {
        
         minval=minval-20;
            
        }
       
        
         NSLog(@"Max %d Min %d ",maxval,minval);
      
        [self GetDataWithMinval:minval WithMaxval:maxval];
        
                       
    }


}


-(void)GetDataWithMinval:(int)_mval WithMaxval:(int)_maxval
{
    
    
    minval=_mval;
    maxval=_maxval;
    
    [self startSpinner:@"spinner" andDisplay:@"Loading..."];
    
    if(tag==1)
        
    {
        
        
        HeaderLab.text=@"Saved Property Manager Reports";
        
        self.title=@"Property Manager Reports";
        
                  
        NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@getProperty&skip=%d&limit=%d",SecondUrl,minval,maxval]];
        
        NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
        
        NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
        
        if (theConnection) 
        {
            webData = [[NSMutableData alloc]init];
        }
        else
        {
            
        }
        
       
        
    }
    
    else if (tag == 2)
        
    {
        self.HeaderLab.text = @"Saved Incident Reports";
        
        self.title=@"Incident Reports";
        
        NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@getReport&skip=%d&limit=%d&report_type=incident_report",SecondUrl,minval,maxval]];
        
        NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
        
        NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
        
        if (theConnection) 
        {
            webData = [[NSMutableData alloc]init];
        }
        else
        {
            
        }

        
        
    }
    
       
    else if(tag==3)
        
    {
        self.HeaderLab.text = @"Saved Inclement Weather Report";
        
         self.title=@"Inclement Weather Report";
        
        NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@getReport&skip=%d&limit=%d&report_type=inclement_weather_report",SecondUrl,minval,maxval]];
        
        NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
        
        NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
        
        if (theConnection) 
        {
            webData = [[NSMutableData alloc]init];
        }
        else
        {
            
        }

        
    }
    
    else if(tag==4)
        
    {
        
        
        self.HeaderLab.text = @"Saved Daily Activity CheckList Report";
        
        self.title=@"Daily Activity CheckList Report";
        
        
        NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@getReport&skip=%d&limit=%d&report_type=daily_activity",SecondUrl,minval,maxval]];
        
        NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
        
        NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
        
        if (theConnection) 
        {
            webData = [[NSMutableData alloc]init];
        }
        else
        {
            
        }

    }
    
    else if(tag==5)
        
    {
        
        self.HeaderLab.text = @"Saved Leasing Agent Report";
        
         self.title=@"Leasing Agent Report";
        
        NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@getReport&skip=%d&limit=%d&report_type=leasing_agent",SecondUrl,minval,maxval]];
        
        NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
        
        NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
        
        if (theConnection) 
        {
            webData = [[NSMutableData alloc]init];
        }
        else
        {
            
        }

        
    }
    
    else if(tag==6)
        
    {
        self.HeaderLab.text = @"Saved Weekly Manger Report";
        
        self.title=@"Weekly Manger Report";
        
        NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@getReport&skip=%d&limit=%d&report_type=weekly_manager_report",SecondUrl,minval,maxval]];
        
        NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
        
        NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
        
        if (theConnection) 
        {
            webData = [[NSMutableData alloc]init];
        }
        else
        {
            
        }

        
        
    }
    
    else if(tag==7)
        
    {
        self.HeaderLab.text = @"Saved Inspection Report";
        
        self.title=@"Inspection Report";
        
        //http://50.57.50.220/lindiproperty/api/api.php?cmd=getReport&skip=0&limit=18&report_type=inspection_form
        
        NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"%@getReport&skip=%d&limit=%d&report_type=inspection_form",SecondUrl,minval,maxval]];
        
        NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
        
        NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
        
        if (theConnection) 
        {
            webData = [[NSMutableData alloc]init];
        }
        else
        {
            
        }
        
        
        
    }

    
    
    
    else
        
    {
        
        [self stopSpinner];           
        UIAlertView *alt55 = [[UIAlertView alloc]initWithTitle:@"Lindi Property" message:@"Sorry No Reports Are Avilabel" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alt55 show];
        [alt55 release];
        
        
    }

}




#pragma mark - NSURLConnectionDelegate Methods...

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
    [self stopSpinner];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Internet connection is down,please try again after some time." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];             
    [alertView show];
    [alertView release];
    [self.navigationController dismissModalViewControllerAnimated:YES];
    
    [webData release];
    [connection release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
    NSString *jsonStr = [[NSString alloc] 
                         initWithData:webData                         
                         encoding:NSASCIIStringEncoding];
   
    
    
    
    if(jsonStr)
    {        
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        
        NSDictionary *jsondic = [parser objectWithString:jsonStr];    
        
        NSString *str = [NSString stringWithFormat:@"%@",[jsondic valueForKey:@"success"]];
        
      
        
        if ([str isEqualToString:@"1"])
        {
                   
            arrResult=[[NSMutableArray alloc]initWithArray:[jsondic valueForKey:@"result"]];
            
           
                     
            
            if([arrResult count] == 0)
            {
                 [self stopSpinner];
                UIAlertView *alt_Show = [[UIAlertView alloc]initWithTitle:@"Lindi Property" message:@"Sorry No Reports To Display...." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alt_Show show];
                [alt_Show release];
                
                if (minval!=0 && maxval > 20) 
                {
                   
                     maxval=minval;
                    if (minval==19)
                        
                    {
                        
                        minval=minval-19;
                    }
                    else
                        
                    {
                        
                        minval=minval-20;
                        
                    }

                  
                     NSLog(@"Max %d Min %d ",maxval,minval);
                }
                
                
                
                
            }
            else
            {
                     
                nameArr=[[NSMutableArray alloc]init];
                for(int x=0;x<[arrResult count];x++) 
                {
                    NSDictionary *dict=[arrResult objectAtIndex:x];
                    NSString *userNameStr=[[NSString alloc]initWithString:[dict valueForKey:@"user_name"]];
                    [nameArr addObject:userNameStr];
                    
                    
                    
                }

                
                
                
                
                for (int k=0; k<[nameArr count]; k++)
                {
                    [self GetRowesWithUserCount:k];
                   /* if([parserarray count]==0)
                    {
                        [nameArr removeObjectAtIndex:k];
                    }*/
                    
                }
                
                [self.Selection_tab reloadData];
                [self stopSpinner];
                
            }
            
           
                       
                      
            
        }
        
        else
        {
            [self stopSpinner];           
            UIAlertView *alt55 = [[UIAlertView alloc]initWithTitle:@"Lindi Property" message:@"Sorry Internet Connection Is Slow...." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            alt55.tag=1;
            [alt55 show];
            [alt55 release];
        }
        
       
        
    }
    [webData release];
    [connection release];
   
 
    

}

#pragma mark - AlertView Methods

-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==1)
    {
        
        [self dismissModalViewControllerAnimated:YES];
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

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
      
    if(tag==1)
        
    {
        
        
        HeaderLab.text=@"Saved Property Manager Reports";
        
        self.title=@"Property Manager Reports";
        
    }
        
    else if (tag == 2)
            
    {
            self.HeaderLab.text = @"Saved Incident Reports";
            
            self.title=@"Incident Reports";
        
    }
        
    else if(tag==3)
                
    {
           self.HeaderLab.text = @"Saved Inclement Weather Report";
                
           self.title=@"Inclement Weather Report";
                
    }
        
    else if(tag==4)
                    
    {
                    
           self.HeaderLab.text = @"Saved Daily Activity CheckList Report";
                    
           self.title=@"Daily Activity CheckList Report";
        
    }
    
    else if(tag==5)
                        
    {
                        
            self.HeaderLab.text = @"Saved Leasing Agent Report";
                        
            self.title=@"Leasing Agent Report";
           
    }
 
    else if(tag==6)
                            
    {
        
          self.HeaderLab.text = @"Saved Weekly Manger Report";
                            
          self.title=@"Weekly Manger Report";
    
    }
    else if(tag==7)
        
    {
        
        self.HeaderLab.text = @"Saved Inspection Report";
        
        self.title=@"Inspection Report";
        
    }
    
    
    maxval=19;
    minval=0;
    
    [self GetDataWithMinval:minval WithMaxval:maxval];
    
    self.Selection_tab.contentSize=CGSizeMake(728, 1024);
   
     UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    
    [barButton setTitle:@"Back"];
    
    [self.navigationItem setLeftBarButtonItem:barButton];
    
      
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    [self.view release];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
	return (interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


@end

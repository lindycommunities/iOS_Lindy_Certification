//
//  InclementWeatherReportPhotoViewController.m
//  LendiProperty
//
//  Created by Vinay D on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InclementWeatherReportPhotoViewController.h"
#import "LendiPropertyAppDelegate.h"
#import "ImageView.h"

@implementation InclementWeatherReportPhotoViewController

@synthesize PhotoView_tab;

@synthesize spinnerView;

- (id)initWithParserObj:(ParserClass *)_objParser WithReportId:(int)R_id WithRporttype:(NSString *)_Rtype
{
    self = [super init];
    if (self) 
    {
        
       
                       
        
        classObj = (ParserClass *)_objParser;
        ImageDisplay=[[NSMutableArray alloc]init];
        ImageName_array=[[NSMutableArray alloc]init];
        Reportid=R_id;
        ReportType=_Rtype;
        
        
    
    
              
        
        
        
        
        
    }
    return self;
}




#pragma mark- UITableView Delegate



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ImageDisplay count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    else {
        ImageView* oldImage = (ImageView *)
        [cell.contentView viewWithTag:999];
        [oldImage removeFromSuperview];
    }
    
      
    for(UIView *view in cell.contentView.subviews)
	{
		[view removeFromSuperview];
	}
    
    UIImageView *BGImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 768, 273)];
    BGImage.image=[UIImage imageNamed:@"Cellbg.png"];
    [cell.contentView addSubview:BGImage];
    
    
    ImageView* asyncImage = [[[ImageView alloc]initWithFrame:CGRectMake(420, 50, 320, 180)] autorelease];
    asyncImage.tag = 999;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[ImageDisplay objectAtIndex:indexPath.row],2]];
    [asyncImage loadImageFromURL:url];
    [cell.contentView addSubview:asyncImage];
    
    
    UILabel *Date_label = [[[UILabel alloc] init] autorelease];
    Date_label.frame = CGRectMake(80,75, 250, 30);
    Date_label.textColor = [UIColor blackColor];
    Date_label.font = [UIFont boldSystemFontOfSize:15];
    Date_label.text = classObj.CreationDate;
    Date_label.backgroundColor =[UIColor clearColor];
    Date_label.numberOfLines =0;
    [cell.contentView addSubview:Date_label];
    
    
    
     /* UIImageView *Img_view=[[[UIImageView alloc]initWithFrame:CGRectMake(420, 50, 320, 180)] autorelease];
    Img_view.image=[ImageDisplay objectAtIndex:indexPath.row];
     [cell.contentView addSubview:Img_view];*/

   
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    LendiPropertyAppDelegate *app=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
//    app.temp_img=[ImageDisplay objectAtIndex:indexPath.row];
//    NSString *temp =[[ImageName_array objectAtIndex:indexPath.row] stringByReplacingOccurrencesOfString:@".PNG" withString:@""];
 
   
    
    
    ImageScrrenViewController *Img_obj=[[ImageScrrenViewController alloc]initWithImageName:[ImageDisplay objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:Img_obj animated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  
    [self startSpinner:@"spinner" andDisplay:@"Getting Images.."];
    
    NSString *temp_url=[NSString stringWithFormat:@"%@getImageDetails&report_id=%d&report_type=%@",SecondUrl,Reportid,ReportType];
    
     
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
        NSLog(@"theConnection is NULL");
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
    
      
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // [self stopSpinner];
    
    
    NSString *jsonStr = [[NSString alloc] 
                         initWithData:webData                         
                         encoding:NSASCIIStringEncoding];
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    
    NSDictionary *jsondic = [parser objectWithString:jsonStr];    
    
    NSDictionary *ImageDic=[jsondic valueForKey:@"result"];
    
    if([ImageDic count]>0)
    {
    
  
        NSMutableArray *arrResult =[[NSMutableArray alloc]initWithArray:[ImageDic valueForKey:@"image_url"]];
    
        NSLog(@"arrResult %@",[arrResult objectAtIndex:0]);
    
    
        if([arrResult count]>0)
        {
    
            for (int i=0; i<[arrResult count]; i++)
            {
        
                [ImageDisplay addObject:[arrResult objectAtIndex:i]];
            
            }
        
            [self stopSpinner];
            [PhotoView_tab reloadData];
        
        }
    }
    else
    {
        [self stopSpinner];
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"No images are attached with this reports.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Alert show];
        [Alert release];

        
    }
     
           
}

#pragma mark - Spinner Methods

//all spinners are modal on the app delegate to facilitate easy removal and blockage of all other view's buttons
-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display
{
    //remove any existing spinners at this point
    if(self.spinnerView){
        [self.spinnerView.view removeFromSuperview];
        self.spinnerView = nil;    
    }
    self.spinnerView =[[[SpinnerModal_iPad alloc]initWithType:type andDisplay:display]autorelease];
    //add this to the root view of the app
    //ViewManager *viewMgr = [ViewManager getManager];
    [self.view addSubview:self.spinnerView.view];
}

-(void) stopSpinner
{
    
    [self.spinnerView.view removeFromSuperview];
    self.spinnerView = nil;    
}





#pragma mark - Alert View Delegates

-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    
    
        [self.navigationController popViewControllerAnimated:YES];
        
   
        
        
}
@end

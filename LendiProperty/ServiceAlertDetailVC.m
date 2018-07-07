//
//  ServiceAlertDetailVC.m
//  LendiProperty
//
//  Created by ss pl on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ServiceAlertDetailVC.h"
#import "JSON.h"
//#import "LendiPropertyAppDelegate.h"

@interface ServiceAlertDetailVC ()


@end

@implementation ServiceAlertDetailVC

@synthesize tblalertsdetails;

@synthesize Obj_string,LoginState,messagestr;

@synthesize idArray,useridArray,messageArray,DateArray;

@synthesize spinnerView,spinnerlandscape;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
       
        
        // Custom initialization
    }
    return self;
}
-(void)backButtonClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark- UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1)
    {
//        return [arrName count];
        
    }
    return [idArray count];

    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    tableView.separatorColor = [UIColor blackColor];
   
      cell.textLabel.text=[NSString stringWithFormat:@" %@     %@",[self.DateArray objectAtIndex:indexPath.row],[self.messageArray objectAtIndex:indexPath.row]];
    
    /*cell.textLabel.text=[NSString stringWithFormat:@"%@ ",[self.DateArray objectAtIndex:indexPath.row]];
    
     cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",[self.messageArray objectAtIndex:indexPath.row]];*/
    
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
      
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *version = [[UIDevice currentDevice] systemVersion];
    int ver_val = [version intValue];
    
    
    if(ver_val >=6.0 ){
        [[UIDevice currentDevice] setOrientation:UIDeviceOrientationPortrait];
    }

    
    
    self.view.backgroundColor=[UIColor colorWithRed:(float)(187.00/255) green:(float)(224.00/255) blue:(float)(227.00/255) alpha:1];
    
    self.title=@"Send Alert";
     
    
    idArray=[[NSMutableArray alloc]init];
    useridArray=[[NSMutableArray alloc]init];
    messageArray=[[NSMutableArray alloc]init];
    DateArray=[[NSMutableArray alloc]init];
    objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    [self startSpinner:@"spinner" andDisplay:@"Loading.."];
   
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(LoadSrvicedeatils) userInfo:nil repeats:NO];
    
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    [barButton setTitle:@"Back"];
    [self.navigationItem setLeftBarButtonItem:barButton];
    [barButton release];

    
    // Do any additional setup after loading the view from its nib.
}
-(void)LoadSrvicedeatils
{
    
      NSString *str=[NSString stringWithFormat:@"%@/getAllAlert_service/xml",MainUrl];
        
	NSURL *url1 = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
	NSData *data1=[[NSData alloc]initWithContentsOfURL:url1];
	
	NSXMLParser *parser1=[[NSXMLParser alloc]initWithData:data1];
    
	[parser1 setDelegate:self];
    
	[parser1 parse]; 
    
    [self.tblalertsdetails reloadData];
    
     [self stopSpinner];
    

}
- (void)viewDidUnload
{
    [super viewDidUnload];
   
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
   return (interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown);    
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
   
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Internet connection is down,please try again after some time." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];             
    [alertView show];
    [alertView release];
    
    [webData release];
    [connection release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   
    NSString *jsonStr = [[NSString alloc] 
                         initWithData:webData                         
                         encoding:NSASCIIStringEncoding];
    //---shows the XML---
    
    
    if(jsonStr)
    {        
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        
        NSDictionary *jsondic = [parser objectWithString:jsonStr];    
        
        NSString *str = [NSString stringWithFormat:@"%@",[jsondic valueForKey:@"success"]];
        
        NSLog(@"%@",str);
      
        
    }
}
#pragma mark - XML parser


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
	if([elementName isEqualToString:@"root"])
	{
		Obj_string=[[NSMutableString alloc]init];
	}
	
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if([elementName isEqualToString:@"id"])
	{
		[idArray addObject:self.Obj_string];
	}
	if([elementName isEqualToString:@"User_id"])
	{
        [useridArray addObject:self.Obj_string];

	}
	if([elementName isEqualToString:@"Message"])
	{
        [messageArray addObject:self.Obj_string];
        
	}
    if([elementName isEqualToString:@"Date"])
    {
        
        NSArray *Date= [Obj_string componentsSeparatedByString:@"."];
        
        self.Obj_string=[NSString stringWithFormat:@"%@/%@/%@",[Date objectAtIndex:0],[Date objectAtIndex:1],[Date objectAtIndex:2]];
      
        [DateArray addObject:self.Obj_string];
    }
	
	[Obj_string release];
	Obj_string = nil;
	Obj_string = [[NSMutableString alloc]init];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	[Obj_string appendString:[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
		
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
-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display
{
    //remove any existing spinners at this point
    if(self.spinnerlandscape){
        [self.spinnerlandscape.view removeFromSuperview];
        self.spinnerlandscape = nil;    
    }
    self.spinnerlandscape =[[[Spinner_iPad_Landscape  alloc]initWithType:type andDisplay:display]autorelease];
    //add this to the root view of the app
    //ViewManager *viewMgr = [ViewManager getManager];
    [self.view addSubview:self.spinnerlandscape.view];
}

-(void) stopSpinnerforlandscape

{
    
    [self.spinnerlandscape.view removeFromSuperview];
    self.spinnerlandscape= nil;    
}

@end

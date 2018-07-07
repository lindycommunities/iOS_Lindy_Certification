//
//  PhotoLibraryViewController.m
//  LendiProperty
//
//  Created by Dipti Yerawar on 9/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotoLibraryViewController.h"
#import "ImageView.h"

@implementation PhotoLibraryViewController

@synthesize photo_tab;

@synthesize spinnerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        
       
        
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableview
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
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
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
    
    
    
    UILabel *Name_label = [[[UILabel alloc] init] autorelease];
    Name_label.frame = CGRectMake(32,30, 250, 50);
    Name_label.textColor = [UIColor blackColor];
    Name_label.font = [UIFont boldSystemFontOfSize:15];
    Name_label.text = [FileNamearr objectAtIndex:indexPath.row];
    Name_label.backgroundColor =[UIColor clearColor];
    Name_label.numberOfLines =0;
    [cell.contentView addSubview:Name_label];
    
    
    
    /*
    
    UILabel *Notes_label = [[[UILabel alloc] init] autorelease];
    Notes_label.frame = CGRectMake(32,70, 500, 100);
    Notes_label.textColor = [UIColor blackColor];
    Notes_label.font = [UIFont boldSystemFontOfSize:15];
    Notes_label.text = [Notesarr objectAtIndex:indexPath.row];
    Notes_label.backgroundColor =[UIColor clearColor];
    Notes_label.numberOfLines =8;
    [cell.contentView addSubview:Notes_label];
    */
    
        
    
    UILabel *Date_label = [[[UILabel alloc] init] autorelease];
    Date_label.frame = CGRectMake(80,75, 250, 30);
    Date_label.textColor = [UIColor blackColor];
    Date_label.font = [UIFont boldSystemFontOfSize:15];
    Date_label.text = [Datearr objectAtIndex:indexPath.row];
    Date_label.backgroundColor =[UIColor clearColor];
    Date_label.numberOfLines =0;
    [cell.contentView addSubview:Date_label];


    
return cell;

}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    ImageScrrenViewController *Img_obj=[[ImageScrrenViewController alloc]initWithImageName:[ImageDisplay objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:Img_obj animated:YES];

    
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
        
        
        NSMutableArray *ImageUrlarr =[[NSMutableArray alloc]initWithArray:[ImageDic valueForKey:@"image_url"]];
        
        
       Datearr=[[NSMutableArray alloc]initWithArray:[ImageDic valueForKey:@"date"]];
        
       FileNamearr=[[NSMutableArray alloc]initWithArray:[ImageDic valueForKey:@"report_type"]];
        
      // Notesarr=[[NSMutableArray alloc]initWithArray:[ImageDic valueForKey:@"notes"]];
        
            
        
        if([ImageUrlarr count]>0)
        {
             ImageDisplay=[[NSMutableArray alloc]init];
            
            for (int i=0; i<[ImageUrlarr count]; i++)
            {
                
                [ImageDisplay addObject:[ImageUrlarr objectAtIndex:i]];
                
            }
            
            [self stopSpinner];
            [photo_tab reloadData];
            
        }
    }
    else
    {
        [self stopSpinner];
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"No more images are available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Alert show];
        [Alert release];
        
        if (minval!=0 && maxval>10)
            
        {
            
            minval=minval-10;
            maxval=maxval-10;
            
            
        }
        
        
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

#pragma mark - Apps Methods


-(void)backButtonClicked:(id)sender

{
    [self dismissModalViewControllerAnimated:YES];
    [self.view release];
    
}

-(void)GetImagesWithMaxValue:(int)_mval WithMinValue:(int)_miVal

{
    int max =_mval;
    int min =_miVal;
    
   // NSString *temp_url=[NSString stringWithFormat:@"%@getPhotoAlbum&skip=%d&limit=%d",SecondUrl,min,max];
    
    NSString *temp_url=[NSString stringWithFormat:@"%@getImages&skip=%d&limit=%d",SecondUrl,min,max];
   
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
-(IBAction)NextBtnClick:(id)sender

{
    [self startSpinner:@"spinner" andDisplay:@"Loading Images.."];
    minval=maxval;
    maxval=maxval+10;
    [self GetImagesWithMaxValue:maxval WithMinValue:minval];
    
    
    
}

-(IBAction)PreviousBtnClick:(id)sender

{
    
    if(minval!=0 && maxval!=10)
    {
        [self startSpinner:@"spinner" andDisplay:@"Loading Images.."];
        minval=minval-10;
        maxval=maxval-10;
        [self GetImagesWithMaxValue:maxval WithMinValue:minval];
    }
    else
    {
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"No more images are available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Alert show];
        [Alert release];
    }
    
}



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
   
       UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    [barButton setTitle:@"Back"];
    [self.navigationItem setLeftBarButtonItem:barButton];
    [barButton release];

     self.title=@"Photo Album";   
    
    minval=0;
    maxval=10;
    
    
    [self startSpinner:@"spinner" andDisplay:@"Getting Images.."];
    
    [self GetImagesWithMaxValue:maxval WithMinValue:minval];
   


}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown);
}

@end

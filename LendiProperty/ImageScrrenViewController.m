//
//  ImageScrrenViewController.m
//  LendiProperty
//
//  Created by Vinay D on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageScrrenViewController.h"
#import "ImageView.h"


@implementation ImageScrrenViewController

- (id)initWithImageName:(NSString *)_str
{
    self = [super init];
    if (self)
    {
      //  self.title=_str;  
        imageurl=_str; 
      
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
   
    
 /*   NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",imageurl,2]];
    [Show_Image loadImageFromURL:url];*/
    
    
    ImageView* asyncImage = [[[ImageView alloc]initWithFrame:CGRectMake(0, 0, 768, 1024)] autorelease];
    asyncImage.tag = 999;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",imageurl,2]];
    [asyncImage loadImageFromURL:url];
    [self.view addSubview:asyncImage];
   // [cell.contentView addSubview:asyncImage];
    
   
    
    //Show_Image.image=app.temp_img;
     self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    //Show_Image.image=app.
    
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


@end

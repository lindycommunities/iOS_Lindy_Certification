//
//  WeeklyReportViewPart2Controller.m
//  LendiProperty
//
//  Created by Vinay D on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WeeklyReportViewPart2Controller.h"
#import "LendiPropertyAppDelegate.h"
@implementation WeeklyReportViewPart2Controller

@synthesize Scroll_view;

@synthesize A_txt,B_txt,C_txt,D_txt,E_txt,F_txt,G_txt,H_txt,I_txt,J_txt,K_txt;


- (id)initWithParserObj:(ParserClass *)_objParser;
{
    self = [super init];
    if (self) 
    {
       objParser = (ParserClass *)_objParser;
    }
    return self;
}

#pragma mark - TextField Delegates

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
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

    
    self.Scroll_view.contentSize=CGSizeMake(768, 2000);
    
     self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    
   
    self.title=@"Reponse/ Note Sheet";
    
    
    if([objParser.A  length]>0)
    {
        
        A_txt.text=[NSString stringWithFormat:@"%@",objParser.A];
    }
    
	if([objParser.B length]>0)
    {
        B_txt.text=[NSString stringWithFormat:@"%@",objParser.B];
    }
    
    if([objParser.C length]>0)
    {
        C_txt.text=[NSString stringWithFormat:@"%@",objParser.C];
    }
    
    if([objParser.D length]>0)
    {
        D_txt.text=[NSString stringWithFormat:@"%@",objParser.D];
    }
    
    if([objParser.E length]>0)
    {
        E_txt.text=[NSString stringWithFormat:@"%@",objParser.E];
    }
    
    if([objParser.F length]>0)
    {
        F_txt.text=[NSString stringWithFormat:@"%@",objParser.F];
    }
    
    if([objParser.G length]>0)
    {
        G_txt.text=[NSString stringWithFormat:@"%@",objParser.G];
    }
    
    if([objParser.H length]>0)
    {
        H_txt.text=[NSString stringWithFormat:@"%@",objParser.H];
    }
    
    if([objParser.I length]>0)
    {
        I_txt.text=[NSString stringWithFormat:@"%@",objParser.I];
    }
    
    if([objParser.J length]>0)
    {
        J_txt.text=[NSString stringWithFormat:@"%@",objParser.J];
    }
    
    if([objParser.K length]>0)
    {
        K_txt.text=[NSString stringWithFormat:@"%@",objParser.K];
    }
    

}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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

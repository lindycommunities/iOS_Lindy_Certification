//
//  LindiMainViewController.m
//  LindiCertification
//
//  Created by Sudip Deshpande on 15/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import "LindiMainViewController.h"
#import "LindiGridViewViewController.h"
#import "LindiSearchViewController.h"

@interface LindiMainViewController ()

@end

@implementation LindiMainViewController

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
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)click:(id)sender
{
    UIButton *b = (UIButton*)sender;
    if(b.tag==1)
    {
        NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
        NSString *RoleID=[defaults_user stringForKey:@"roleAID"];
        NSString *userID=[defaults_user stringForKey:@"userID"];

        LindiGridViewViewController *home = [[LindiGridViewViewController alloc]init];
      //  home.Cert_Type=@"all";
        home.Cert_Type=[NSString stringWithFormat:@"all&RoldID=%@&userID=%@",RoleID,userID];;

        [self.navigationController pushViewController:home animated:YES];

    }
    else if(b.tag==2)
    {
        
//        UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:@"Lindy Certificates" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"View All Expired Certificates" otherButtonTitles:@"Expired Certificates Upto 180 Days Old", @"Expired Certificates Upto 360 Days Old",@"Expired Certificates Upto 540 Days Old", nil];
//        popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
//        [popupQuery showInView:self.view];
        
        NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
        NSString *RoleID=[defaults_user stringForKey:@"roleAID"];
        NSString *userID=[defaults_user stringForKey:@"userID"];
        

        LindiGridViewViewController *home = [[LindiGridViewViewController alloc]init];

        home.Cert_Type=[NSString stringWithFormat:@"allexpire&RoldID=%@&userID=%@",RoleID,userID];;
        
        [self.navigationController pushViewController:home animated:YES];

        
        
        

    }
    else if(b.tag==3)
    {        LindiSearchViewController *home = [[LindiSearchViewController alloc]init];
        [self.navigationController pushViewController:home animated:YES];

        
    }
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
    NSString *RoleID=[defaults_user stringForKey:@"roleAID"];
    NSString *userID=[defaults_user stringForKey:@"userID"];

    
    if(buttonIndex !=[actionSheet cancelButtonIndex])
    {
        
            NSString *S = [actionSheet buttonTitleAtIndex:buttonIndex];
    if([S  isEqualToString:@"View All Expired Certificates"])
    {
        LindiGridViewViewController *home = [[LindiGridViewViewController alloc]init];
//        home.Cert_Type=@"allexpire";
        home.Cert_Type=[NSString stringWithFormat:@"allexpire&RoldID=%@&userID=%@",RoleID,userID];;

        [self.navigationController pushViewController:home animated:YES];

    }
    else if([S  isEqualToString:@"Expired Certificates Upto 180 Days Old"])
    {
        LindiGridViewViewController *home = [[LindiGridViewViewController alloc]init];
        home.Cert_Type=[NSString stringWithFormat:@"allexpire&RoldID=%@&Days=180&userID=%@",RoleID,userID];;
        [self.navigationController pushViewController:home animated:YES];

    }
    else if([S  isEqualToString:@"Expired Certificates Upto 360 Days Old"])
    {
        LindiGridViewViewController *home = [[LindiGridViewViewController alloc]init];
        home.Cert_Type=[NSString stringWithFormat:@"allexpire&RoldID=%@&Days=360&userID=%@",RoleID,userID];;
        [self.navigationController pushViewController:home animated:YES];

    }
    else if([S  isEqualToString:@"Expired Certificates Upto 540 Days Old"])
    {
        LindiGridViewViewController *home = [[LindiGridViewViewController alloc]init];
        home.Cert_Type=[NSString stringWithFormat:@"allexpire&RoldID=%@&Days=540&userID=%@",RoleID,userID];;
        [self.navigationController pushViewController:home animated:YES];

    }
    }
//    if (buttonIndex == 0) {
//        self.label.text = @"Destructive Button Clicked";
//    } else if (buttonIndex == 1) {
//        self.label.text = @"Other Button 1 Clicked";
//    } else if (buttonIndex == 2) {
//        self.label.text = @"Other Button 2 Clicked";
//    } else if (buttonIndex == 3) {
//        self.label.text = @"Cancel Button Clicked";
//    }
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation

{
    // return YES;
    //return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);

}

@end

//
//  LindiMainViewController.m
//  LindiCertification
//
//  Created by Sudip Deshpande on 15/04/13.
//  Copyright (c) 2013 Lindi. All rights reserved.
//

#import "LindiContractMainViewController.h"
#import "LindiContractGridViewViewController.h"
#import "LindiContractSearchViewController.h"


@interface LindiContractMainViewController ()

@end

@implementation LindiContractMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
-(IBAction)click:(id)sender
{
    UIButton *b = (UIButton*)sender;
    if(b.tag==1)
    {
        LindiContractGridViewViewController *home = [[LindiContractGridViewViewController alloc]init];
        home.Cert_Type=@"allcontracts";
        home.StrStatus=@"Active";

        [self.navigationController pushViewController:home animated:YES];

    }
    else if(b.tag==2)
    {
        LindiContractGridViewViewController *home = [[LindiContractGridViewViewController alloc]init];
        home.Cert_Type=@"allcontractsexpire";
        home.StrStatus=@"Expired";

        [self.navigationController pushViewController:home animated:YES];

    }
    else if(b.tag==3)
    {        LindiContractSearchViewController *home = [[LindiContractSearchViewController alloc]init];
        [self.navigationController pushViewController:home animated:YES];

        
    }
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation

{
    // return YES;
    //return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);

}

@end

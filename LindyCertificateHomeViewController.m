//
//  LindyCertificateHomeViewController.m
//  LendiProperty
//
//  Created by Sudip Deshpande on 15/11/13.
//
//

#import "LindyCertificateHomeViewController.h"
#import "LindiMainViewController.h"
#import "LindiContractMainViewController.h"
#import "LindiStatisticsMainViewController.h"

@interface LindyCertificateHomeViewController ()

@end

@implementation LindyCertificateHomeViewController

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
-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    //self.navigationController.navigationBarHidden=YES;
}


- (IBAction)Certificates:(id)sender {
    LindiMainViewController  * main = [[LindiMainViewController alloc]init];
    [self.navigationController pushViewController:main animated:YES];


}

- (IBAction)Contracts:(id)sender {
    
    LindiContractMainViewController  * main = [[LindiContractMainViewController alloc]init];
    [self.navigationController pushViewController:main animated:YES];
}

- (IBAction)Statistics:(id)sender {
    
    LindiStatisticsMainViewController  * main = [[LindiStatisticsMainViewController alloc]init];
    [self.navigationController pushViewController:main animated:YES];


}
@end

//
//  LindyCertificateHomeViewController.m
//  LendiProperty
//
//  Created by Sudip Deshpande on 15/11/13.
//
//

#import "LeasingAgentHomeViewController.h"
#import "LeasingAgentAddDataViewController.h"
#import "LeasingAgentListViewController.h"

@interface LeasingAgentHomeViewController ()

@end

@implementation LeasingAgentHomeViewController

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
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBarHidden=NO;
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



- (IBAction)Certificates:(id)sender {
    
    LeasingAgentAddDataViewController *agent=[[LeasingAgentAddDataViewController alloc]init];
    [self.navigationController pushViewController:agent animated:YES];


}

- (IBAction)Contracts:(id)sender {
    
    LeasingAgentListViewController *agent=[[LeasingAgentListViewController alloc]init];
    [self.navigationController pushViewController:agent animated:YES];

    

    
}

- (IBAction)Statistics:(id)sender {
    


}
@end

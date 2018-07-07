//
//  LindyCertificateHomeViewController.m
//  LendiProperty
//
//  Created by Sudip Deshpande on 15/11/13.
//
//

#import "LeasingAgentAddDataViewController.h"
#import "NSData+Base64.h"

@interface LeasingAgentAddDataViewController ()

@end

@implementation LeasingAgentAddDataViewController
@synthesize spinnerlandscape;
@synthesize arrbuilding,arrbuildingid;
@synthesize arrcategory,arrcategoryid;
@synthesize arrrates,arrratesid;
@synthesize buildingid,rateid,categoryid,arrimages;
@synthesize formID,isEdit,TotalData,isEditing,arrremoteimages,arrdeleteimages;
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
    
    [[TxtComment layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[TxtComment layer] setBorderWidth:2.3];
    [[TxtComment layer] setCornerRadius:15];
    self.isEditing=NO;
    
    if(self.isEdit){
        self.arrremoteimages=[[NSMutableArray alloc]init];
        self.arrdeleteimages=[[NSMutableArray alloc]init];
        [self LoadDetails];
        [BtnSubmit setTitle:@"Edit" forState:UIControlStateNormal];
        [self DisbleAll];


    }
    else{
        
        [self LoadCommunity];

        
    }
    
    
    self.arrimages=[[NSMutableArray alloc]init];
    counter=0;
    
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)LoadDetails{
    
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
    json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"leasing_form_details&formID=%@",self.formID]];
    json.delegate=self;
    json.flag=@"leasing_form_details";

}
-(void)LoadCommunity{
    
    NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
    NSString *RoleID=[defaults_user stringForKey:@"roleAID"];
    NSString *userID=[defaults_user stringForKey:@"userID"];
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
    json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"buildings&userID=%@&RoldID=%@",userID,RoleID]];
    json.delegate=self;
    json.flag=@"buildings";
    
}
-(void)LoadCategory{
    
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
    json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"adjustment_categories&buildingID=%@",self.buildingid]];
    json.delegate=self;
    json.flag=@"Category";
}
-(void)LoadRates{
    
    
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Loading"];
    json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"adjustment_rates"]];
    json.delegate=self;
    json.flag=@"Rates";
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden=YES;
     [self registerForKeyboardNotifications];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBarHidden=NO;
    [self deregisterFromKeyboardNotifications];

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



- (IBAction)SelectCommunity:(id)sender {
    
    dropDown=[[DropDownView alloc]initWithArrayData:self.arrbuilding  cellHeight:50 heightTableView:350 paddingTop:-9 paddingLeft:10 paddingRight:20 refView:LblLindyCommunity animation:BOTH openAnimationDuration:0.5 closeAnimationDuration:0.5];
    dropDown.delegate=self;
    [ScrollViewContainer addSubview:dropDown.view];
    [dropDown openAnimation];
    strflag=@"Building";
}

- (IBAction)SelectCategory:(id)sender {
    
    dropDown=[[DropDownView alloc]initWithArrayData:self.arrcategory  cellHeight:50 heightTableView:200 paddingTop:-9 paddingLeft:10 paddingRight:20 refView:LblCategory animation:BOTH openAnimationDuration:0.5 closeAnimationDuration:0.5];
    dropDown.delegate=self;
    [ScrollViewContainer addSubview:dropDown.view];
    [dropDown openAnimation];
    strflag=@"Category";
}

- (IBAction)SelectRates:(id)sender {
    
    dropDown=[[DropDownView alloc]initWithArrayData:self.arrrates  cellHeight:50 heightTableView:200 paddingTop:-9 paddingLeft:10 paddingRight:20 refView:LblRates animation:BOTH openAnimationDuration:0.5 closeAnimationDuration:0.5];
    dropDown.delegate=self;
    [ScrollViewContainer addSubview:dropDown.view];
    [dropDown openAnimation];
    strflag=@"Rates";

}
- (IBAction)showme:(id)sender {
    
    UIButton *B=(UIButton*)sender;
    
    ViewImage.hidden=NO;
    UIImage *myLargeImage=[UIImage imageWithData:[self.arrimages objectAtIndex:B.tag-1]];
    UIImage *myResizedImage = [self imageWithImage:myLargeImage
                                            scaledToMaxWidth:1024
                                                   maxHeight:678];
    
    
    ImgBigImage.image=myResizedImage;
    
    

    
}

- (IBAction)showme1:(id)sender {
    
    
    UIButton *B=(UIButton*)sender;
    
    ViewImage.hidden=NO;
    
    ImgBigImage.image = [UIImage imageNamed:@"loading.png"];
    NSDictionary *dd = [self.arrremoteimages objectAtIndex:B.tag-1];
    NSURL *url = [NSURL URLWithString:[dd valueForKey:@"imageUrl"]];
        [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            // change the image in the cell
            UIImage *myResizedImage = [self imageWithImage:image
                                          scaledToMaxWidth:1024
                                                 maxHeight:678];
            ImgBigImage.image = myResizedImage;
        }
    }];
}

- (IBAction)close:(id)sender {
    
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Are you sure you want to delete this image?"
                                  message:@"It will get delete permanently"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Yes"
                         style:UIAlertActionStyleDestructive
                         handler:^(UIAlertAction * action)
                         {
                             UIButton *B=(UIButton*)sender;
                             [self.arrimages removeObjectAtIndex:B.tag-1];
                             if(self.isEditing){
                                 [self ShowRemoteimages];
                                 
                             }
                             else {
                                 [self Showimages];
                             }
                             
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"No"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
    

    
    
    
    
    
    
}
- (IBAction)close1:(id)sender {
    
    
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Are you sure you want to delete this image?"
                                  message:@"It will get delete permanently"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Yes"
                         style:UIAlertActionStyleDestructive
                         handler:^(UIAlertAction * action)
                         {
                             UIButton *B=(UIButton*)sender;
                             NSDictionary *dd = [self.arrremoteimages objectAtIndex:B.tag-1];
                             
                             [self.arrdeleteimages addObject:[dd valueForKey:@"imageID"]];
                             //[self DeleteImage:[dd valueForKey:@"imageID"]];
                             [self.arrremoteimages removeObjectAtIndex:B.tag-1];
                             [self ShowRemoteimages];

                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"No"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
    
    
}
-(void)DeleteImage:(NSString*)_imgid{
    
    NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
    NSString *userID=[defaults_user stringForKey:@"userID"];
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Deleting..."];
    json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"delete_leasing_images&agentID=%@&formID=%@&imageID=%@",userID,self.formID,_imgid]];
    json.delegate=self;
    json.flag=@"delete_leasing_images";
    
    
   
    
}


-(void)EnableAll{
    
    BtnCategory.userInteractionEnabled=YES;
    BtnLindyCommunity.userInteractionEnabled=YES;
    BtnRates.userInteractionEnabled=YES;
    TxtComment.editable=YES;
    TxtApartmentNo.enabled=YES;
    TxtApartmentName.enabled=YES;
    BtnImages.hidden=NO;
    BtnSubmit.hidden=NO;


    
}
-(void)DisbleAll{
    
    BtnCategory.userInteractionEnabled=NO;
    BtnLindyCommunity.userInteractionEnabled=NO;
    BtnRates.userInteractionEnabled=NO;
    TxtComment.editable=NO;
    TxtApartmentNo.enabled=NO;
    TxtApartmentName.enabled=NO;
    BtnImages.hidden=YES;
    BtnSubmit.hidden=YES;

    
}

- (IBAction)SubmitData:(id)sender {
    
    if(self.isEdit){
        
        if(self.isEditing){
            
            NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
            NSString *userID=[defaults_user stringForKey:@"userID"];
            
            
            
            [self startSpinnerforlandscape:@"spinner" andDisplay:@"Saving..."];
            
            self.rateid = [self.rateid stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
            
            json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"add_edit_leasing_form&type=edit&leasingAgentID=%@&buildingID=%@&adjustmentCategoryID=%@&adjustmentRates=%@&comments=%@&apartmentName=%@&aptNo=%@&formID=%@",userID,self.buildingid,self.categoryid,self.rateid,TxtComment.text,TxtApartmentName.text,TxtApartmentNo.text,self.formID]];
            json.delegate=self;
            json.flag=@"SubmitData";
            
        }
        else
        {
            self.isEditing=YES;
            [self EnableAll];
            [BtnSubmit setTitle:@"Update" forState:UIControlStateNormal];
            [self ShowRemoteimages];
            [self LoadCommunity];

            
        }
        
        
    }
    else
    {
        
        NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
        NSString *userID=[defaults_user stringForKey:@"userID"];
        
        
        
        [self startSpinnerforlandscape:@"spinner" andDisplay:@"Saving..."];
        
        self.rateid = [self.rateid stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
        
        json =[[GlobalJSONParser alloc]initWithJSONString:[NSString stringWithFormat:@"add_edit_leasing_form&type=add&leasingAgentID=%@&buildingID=%@&adjustmentCategoryID=%@&adjustmentRates=%@&comments=%@&apartmentName=%@&aptNo=%@",userID,self.buildingid,self.categoryid,self.rateid,TxtComment.text,TxtApartmentName.text,TxtApartmentNo.text]];
        json.delegate=self;
        json.flag=@"SubmitData";
        
    }
    
    
    
    
   
    
}
- (void)SubmitFormData{
    
    
    
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Saving..."];
    
    
    json =[[GlobalJSONParser alloc]initWithJSONStringPDF:@"" ANDPOSTData:[NSString stringWithFormat:@"formID=%@",self.formID]];
    json.delegate=self;
    json.flag=@"SubmitFormData";

    
    
}

- (IBAction)SelectImages:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Camera", @"Album", nil];
    
    [actionSheet showInView:self.view];
    
}

- (IBAction)CloseImage:(id)sender {
    ViewImage.hidden=YES;
    ImgBigImage.image=nil;
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex!=[actionSheet cancelButtonIndex]){
        
        
        imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.allowsEditing = NO;
        imagePickerController.delegate = self;
        if([[NSString stringWithFormat:@"%@",[actionSheet buttonTitleAtIndex:buttonIndex]]isEqualToString:@"Camera"]){
            
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        else
        {
            imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            
        }
        popover = [[UIPopoverController alloc] initWithContentViewController:imagePickerController];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(),
                       ^{[popover presentPopoverFromRect:BtnImages.frame
                                                  inView:self.view
                                permittedArrowDirections:UIPopoverArrowDirectionAny
                                                animated:YES];});

        
    }
   
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.arrimages addObject:[self compraseImage:img]];
    
    
    
   // NSData *imageData     = UIImagePNGRepresentation(img);
    //[self.arrimages addObject:imageData];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(),
//                   ^{
    
    if(self.isEditing){
        
        [self ShowRemoteimages];
    }
    else
    {
        [self Showimages];

    }

    

    
//});

    
    
}
-(void)UploadImages{
    
    
    if(counter<[self.arrimages count]){
    NSUserDefaults *defaults_user = [NSUserDefaults standardUserDefaults];
    NSString *userID=[defaults_user stringForKey:@"userID"];
    [self startSpinnerforlandscape:@"spinner" andDisplay:@"Saving..."];

        
        NSString *bb = [[self.arrimages objectAtIndex:counter]base64EncodedString];

//    NSString *bb = [[self.arrimages objectAtIndex:counter]base64EncodedStringWithOptions:0];
     //   base64Encoded = [base64Encoded stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
//    json =[[GlobalJSONParser alloc]initWithJSONStringIMAGE:[NSString stringWithFormat:@"imageName=%@&leasingAgentID=%@&leasingFormID=%@",base64Encoded,userID,self.formID]];
    
        json =[[GlobalJSONParser alloc]initWithJSONString:@"" ANDPOSTData:[NSString stringWithFormat:@"imageName=%@&leasingAgentID=%@&leasingFormID=%@",bb,userID,self.formID]];
        json.delegate=self;
    json.flag=@"UploadImages";
    }

    
    
}
-(void)Showimages{
    
    int counterlocal = 1;
    for (id vv in ScrollImages.subviews) {
        [vv removeFromSuperview];
        
    }
    
    int startx=45;
    int starty=10;
    for(NSData *dd in self.arrimages){
        
        UIImageView *v = [[UIImageView alloc]initWithFrame:CGRectMake(startx, starty, 200, 200)];
        v.image=[UIImage imageWithData:dd];
        
        [ScrollImages addSubview:v];
        
        
        UIButton *showme = [UIButton buttonWithType:UIButtonTypeCustom];
        showme.tag=counterlocal;
        showme.frame=CGRectMake(startx, starty, 200, 200);
        [showme addTarget:self action:@selector(showme:) forControlEvents:UIControlEventTouchUpInside];
        [ScrollImages addSubview:showme];

        
        
        UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
        close.tag=counterlocal;
        close.frame=CGRectMake(((v.frame.origin.x + v.frame.size.width)-30),v.frame.origin.y, 30, 30);
        [close addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
        [close setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
        [ScrollImages addSubview:close];
        
        

        
        
        
        counterlocal++;
        
        startx= startx+245;
        if(startx >600){
            starty=starty+220;
            startx=45;
        }
        
        
        
    }
    
   int  minutes = ((int)[self.arrimages count]) % 3;
    
        starty=starty+(220*minutes);
    
    
    ScrollImages.frame= CGRectMake(ScrollImages.frame.origin.x, ScrollImages.frame.origin.y, ScrollImages.frame.size.width, starty);
    CGRect contentRect = CGRectZero;
    for (UIView *view in ScrollViewContainer.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    ScrollViewContainer.contentSize = contentRect.size;
    
}
-(void)ShowRemoteimages{
    
    int counterlocal = 1;
    for (id vv in ScrollImages.subviews) {
        [vv removeFromSuperview];
        
    }
    
    int startx=45;
    int starty=10;
    for(NSDictionary *dd in self.arrremoteimages){
        
        UIImageView *v = [[UIImageView alloc]initWithFrame:CGRectMake(startx, starty, 200, 200)];
        v.image = [UIImage imageNamed:@"loading.png"];
        NSURL *url = [NSURL URLWithString:[dd valueForKey:@"imageUrl"]];
        
        [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
            if (succeeded) {
                // change the image in the cell
                v.image = image;
            }
        }];
        
        
        [ScrollImages addSubview:v];
        
        UIButton *showme = [UIButton buttonWithType:UIButtonTypeCustom];
        showme.tag=counterlocal;
        showme.frame=CGRectMake(startx, starty, 200, 200);
        [showme addTarget:self action:@selector(showme1:) forControlEvents:UIControlEventTouchUpInside];
        [ScrollImages addSubview:showme];
        
        
        if(self.isEditing){
        UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
            close.tag=counterlocal;//[[dd valueForKey:@"imageID"]integerValue];
        close.frame=CGRectMake(((v.frame.origin.x + v.frame.size.width)-30),v.frame.origin.y, 30, 30);
        [close addTarget:self action:@selector(close1:) forControlEvents:UIControlEventTouchUpInside];
        [close setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
        [ScrollImages addSubview:close];
        }
        counterlocal++;
        
        startx= startx+245;
        if(startx >600){
            starty=starty+220;
            startx=45;
        }
        
        
        
    }
    counterlocal = 1;
    for(NSData *dd in self.arrimages){
        
        UIImageView *v = [[UIImageView alloc]initWithFrame:CGRectMake(startx, starty, 200, 200)];
        v.image=[UIImage imageWithData:dd];
        
        [ScrollImages addSubview:v];
        UIButton *showme = [UIButton buttonWithType:UIButtonTypeCustom];
        showme.tag=counterlocal;
        showme.frame=CGRectMake(startx, starty, 200, 200);
        [showme addTarget:self action:@selector(showme:) forControlEvents:UIControlEventTouchUpInside];
        [ScrollImages addSubview:showme];
        if(self.isEditing){

        UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
        close.tag=counterlocal;
        close.frame=CGRectMake(((v.frame.origin.x + v.frame.size.width)-30),v.frame.origin.y, 30, 30);
        [close addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
        [close setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
        [ScrollImages addSubview:close];
        }
        
        
        
        
        counterlocal++;
        
        startx= startx+245;
        if(startx >600){
            starty=starty+220;
            startx=45;
        }
        
        
        
    }
    
    int  minutes = ((int)([self.arrimages count]+[self.arrremoteimages count])) % 3;
    
    starty=starty+(220*minutes);
    
    
    ScrollImages.frame= CGRectMake(ScrollImages.frame.origin.x, ScrollImages.frame.origin.y, ScrollImages.frame.size.width, starty);
    CGRect contentRect = CGRectZero;
    for (UIView *view in ScrollViewContainer.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    ScrollViewContainer.contentSize = contentRect.size;
    
}
- (IBAction)Certificates:(id)sender {


}

- (IBAction)Contracts:(id)sender {
    
}

- (IBAction)Statistics:(id)sender {
    


}
//- (void)dealloc {
//    [TxtComment release];
//    [LblLindyCommunity release];
//    [LblCategory release];
//    [LblRates release];
//    [TxtApartmentName release];
//    [TxtApartmentNo release];
//    [ScrollViewContainer release];
//    [BtnImages release];
//    [ScrollImages release];
//    [BtnSubmit release];
//    [BtnLindyCommunity release];
//    [BtnCategory release];
//    [BtnRates release];
//    [ViewImage release];
//    [ImgBigImage release];
//    [super dealloc];
//}
-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display
{
    //remove any existing spinners at this point
    if(self.spinnerlandscape){
        [self.spinnerlandscape.view removeFromSuperview];
        self.spinnerlandscape = nil;
    }
    self.spinnerlandscape =[[Spinner_iPad_Landscape  alloc]initWithType:type andDisplay:display];
    //add this to the root view of the app
    //ViewManager *viewMgr = [ViewManager getManager];
    [self.view addSubview:self.spinnerlandscape.view];
    [self.view bringSubviewToFront:self.spinnerlandscape.view];
}

-(void) stopSpinnerforlandscape

{
    
    [self.spinnerlandscape.view removeFromSuperview];
    self.spinnerlandscape= nil;
}
#pragma mark- JSON PARSER Delegate

-(void) RequestFinished:(NSDictionary*)JsonDictionary
{
    [self stopSpinnerforlandscape];
    
    bool issuccess = [[JsonDictionary valueForKey:@"success"]boolValue];
    if(issuccess)
    {
        
        if([json.flag isEqualToString:@"buildings"])
        {
            if([[JsonDictionary valueForKey:@"type"]isEqualToString:@"buildings"])
            {
                
                NSArray* latestLoans=[[NSArray alloc]init];
                self.arrbuilding=[[NSMutableArray alloc]init];
                self.arrbuildingid =[[NSMutableArray alloc]init];
                
                latestLoans = [JsonDictionary objectForKey:@"result"];
                
                for (NSDictionary *tweetValues in latestLoans) {
                    
                    NSNumber* buildingID = [tweetValues objectForKey:@"buildingID"];
                    
                    NSString* buildingName = [tweetValues objectForKey:@"building"];
                    NSLog(@"Building ID ------ %@",buildingID);
                    
                    NSLog(@"Building Name----- %@",buildingName);
                    [self.arrbuilding addObject:buildingName];
                    [self.arrbuildingid addObject:buildingID];
                    NSLog(@"Count %d",[self.arrbuildingid count]);
                }
            }
            [self LoadRates];

        }
        else if([json.flag isEqualToString:@"leasing_form_details"])
        {
         
            self.TotalData=[JsonDictionary valueForKey:@"result"];
            
            
            LblLindyCommunity.text=[NSString stringWithFormat:@"%@",[self.TotalData valueForKey:@"propertyName"]];
            TxtApartmentName.text=[NSString stringWithFormat:@"%@",[self.TotalData valueForKey:@"apartmentName"]];
            TxtApartmentNo.text=[NSString stringWithFormat:@"%@",[self.TotalData valueForKey:@"aptNo"]];
            LblCategory.text=[NSString stringWithFormat:@"%@",[self.TotalData valueForKey:@"adjustmentCategory"]];
            LblRates.text=[NSString stringWithFormat:@"%@$",[self.TotalData valueForKey:@"adjustmentRates"]];
            TxtComment.text=[NSString stringWithFormat:@"%@",[self.TotalData valueForKey:@"comments"]];

            self.arrremoteimages=[self.TotalData valueForKey:@"images_arr"];
            
            self.buildingid=[NSString stringWithFormat:@"%@",[self.TotalData valueForKey:@"propertyID"]];
            self.categoryid=[NSString stringWithFormat:@"%@",[self.TotalData valueForKey:@"adjustmentCategoryID"]];
            self.rateid=[NSString stringWithFormat:@"%@",[self.TotalData valueForKey:@"adjustmentRates"]];
            
            
            [self ShowRemoteimages];
            
        }

        
        else if([json.flag isEqualToString:@"Category"])
        {
            if([[JsonDictionary valueForKey:@"type"]isEqualToString:@"categories"])
            {
                
                NSArray* latestLoans=[[NSArray alloc]init];
                self.arrcategory=[[NSMutableArray alloc]init];
                self.arrcategoryid =[[NSMutableArray alloc]init];
                
                latestLoans = [JsonDictionary objectForKey:@"result"];
                
                for (NSDictionary *tweetValues in latestLoans) {
                    
                    NSNumber* buildingID = [tweetValues objectForKey:@"categoryID"];
                    
                    NSString* buildingName = [tweetValues objectForKey:@"categoryName"];
                    NSLog(@"Building ID ------ %@",buildingID);
                    
                    NSLog(@"Building Name----- %@",buildingName);
                    [self.arrcategory addObject:buildingName];
                    [self.arrcategoryid addObject:buildingID];
                    NSLog(@"Count %d",[self.arrcategoryid count]);
                }
            }
        }
        
        else if([json.flag isEqualToString:@"Rates"])
        {
            if([[JsonDictionary valueForKey:@"type"]isEqualToString:@"rates"])
            {
                
                NSArray* latestLoans=[[NSArray alloc]init];
                self.arrrates=[[NSMutableArray alloc]init];
                self.arrratesid =[[NSMutableArray alloc]init];
                
                latestLoans = [JsonDictionary objectForKey:@"result"];
//                self.arrrates=[[[JsonDictionary objectForKey:@"result"]allValues]mutableCopy];
//                self.arrratesid=[[[JsonDictionary objectForKey:@"result"]allKeys] mutableCopy];
                for (NSDictionary *tweetValues in latestLoans) {
                    
                    NSNumber* buildingID = [tweetValues objectForKey:@"rate_name"];
                    
                    NSString* buildingName = [tweetValues objectForKey:@"rate_value"];
                    NSLog(@"Building ID ------ %@",buildingID);
                    
                    NSLog(@"Building Name----- %@",buildingName);
                    [self.arrrates addObject:buildingName];
                    [self.arrratesid addObject:buildingID];
                    NSLog(@"Count %d",[self.arrratesid count]);
                }
                if(self.isEdit){
                    
                    [self LoadCategory];

                }
            }
        }
        else if([json.flag isEqualToString:@"SubmitFormData"]){
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:[JsonDictionary objectForKey:@"result"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alertView show];
    //[alertView release];
            [self.navigationController popViewControllerAnimated:YES];
            
        }

        else if([json.flag isEqualToString:@"SubmitData"]){
            
            
            
            self.formID=[JsonDictionary objectForKey:@"formID"];
            if(counter<[self.arrimages count]){
                
//                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:[JsonDictionary objectForKey:@"result"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
//                [alertView show];
//                [alertView release];

                [self UploadImages];
            }
            else if(counter<[self.arrdeleteimages count]){
                
                [self DeleteImage:[self.arrdeleteimages objectAtIndex:counter]];

            }
            else
            {
               
                if(self.isEditing){
                    
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:[JsonDictionary objectForKey:@"result"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                    [alertView show];
                   // [alertView release];
                    [self.navigationController popViewControllerAnimated:YES];

                    
                }
                else
                {
                [self SubmitFormData];
                }


            }

            
//            NSString *base64Encoded = [nsdata base64EncodedStringWithOptions:0];
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:[JsonDictionary objectForKey:@"result"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
//            [alertView show];
//            [alertView release];
//            [self.navigationController popViewControllerAnimated:YES];

        }
        else if([json.flag isEqualToString:@"UploadImages"]){
            counter++;
            if(counter<[self.arrimages count]){
                
                [self UploadImages];

                
            }
            else
            {
                if([self.arrdeleteimages count]>0){
                    counter=0;
                    [self DeleteImage:[self.arrdeleteimages objectAtIndex:counter]];
                    
                }
                else{

                    
                    if(self.isEditing){
                        
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:[JsonDictionary objectForKey:@"result"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                        [alertView show];
                       // [alertView release];
                        [self.navigationController popViewControllerAnimated:YES];
                        
                        
                    }
                    else
                    {
                        [self SubmitFormData];
                    }


                    
                    
//                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Saved Successfully" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
//                [alertView show];
//                [alertView release];
//                [self.navigationController popViewControllerAnimated:YES];
                   // [self SubmitFormData];
                }
            }

            
            
        }
        else if([json.flag isEqualToString:@"delete_leasing_images"]){
            
            counter++;
            if(counter<[self.arrdeleteimages count]){
                
                [self DeleteImage:[self.arrdeleteimages objectAtIndex:counter]];
                
                
            }
            else
            {
                
                    
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Saved Successfully" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                    [alertView show];
                   // [alertView release];
                    [self.navigationController popViewControllerAnimated:YES];
                
            }

            
            
        }


        
    }
    else
    {
        [self stopSpinnerforlandscape];
        
        
        if([json.flag isEqualToString:@"UploadImages"]){
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Error in image upload,please try again..." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alertView show];
           // [alertView release];

            
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"No Results Found." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alertView show];
          //  [alertView release];

        }

        
    }
}

-(void) RequestError
{
    [self stopSpinnerforlandscape];
    
}
#pragma mark- show DropDowntable controller in modelpopup
-(void) showTableViewController {
    
}

-(void)dropDownCellSelected:(NSInteger)returnIndex
{
    if([strflag isEqualToString:@"Building"])
    {
        LblLindyCommunity.text=[self.arrbuilding objectAtIndex:returnIndex];
        self.buildingid=[self.arrbuildingid objectAtIndex:returnIndex];
        [self LoadCategory];
        
    }
    
    else if([strflag isEqualToString:@"Category"])
    {
        LblCategory.text=[self.arrcategory objectAtIndex:returnIndex];
        self.categoryid=[self.arrcategoryid objectAtIndex:returnIndex];
            
        
        
    }
    else if([strflag isEqualToString:@"Rates"])
    {
        LblRates.text=[self.arrrates objectAtIndex:returnIndex];
        self.rateid=[NSString stringWithFormat:@"%@",[self.arrratesid objectAtIndex:returnIndex]];
        
        
        
    }
    
    
    
    
}
- (void)registerForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

- (void)deregisterFromKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}
- (void)keyboardWasShown:(NSNotification *)notification {
    
    for (UIView *view in ScrollViewContainer.subviews) {
        if (view.isFirstResponder) {
            
            
            if([view isKindOfClass:[UITextView class]]){
                
                CGPoint scrollPoint = CGPointMake(0.0, view.frame.origin.y - view.frame.size.height);

                [ScrollViewContainer setContentOffset:scrollPoint animated:YES];

            }
            break;

            }
//            NSDictionary* info = [notification userInfo];
//            
//            CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//            
////            CGPoint buttonOrigin = TxtComment.frame.origin;
////            
////            CGFloat buttonHeight = TxtComment.frame.size.height+250;
////            
////            CGRect visibleRect = ScrollViewContainer.frame;
////            
////            visibleRect.size.height -= keyboardSize.height;
//            
//            if (!CGRectContainsPoint(visibleRect, buttonOrigin)){
//                
//                CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight);
//                
//                [ScrollViewContainer setContentOffset:scrollPoint animated:YES];
//                
//            }
        
        }
    }
    
    
//    NSDictionary* info = [notification userInfo];
//    
//    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    
//    CGPoint buttonOrigin = TxtComment.frame.origin;
//    
//    CGFloat buttonHeight = TxtComment.frame.size.height+250;
//    
//    CGRect visibleRect = ScrollViewContainer.frame;
//    
//    visibleRect.size.height -= keyboardSize.height;
//    
//    if (!CGRectContainsPoint(visibleRect, buttonOrigin)){
//        
//        CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight);
//        
//        [ScrollViewContainer setContentOffset:scrollPoint animated:YES];
//        
//    }

    
//}

- (void)keyboardWillBeHidden:(NSNotification *)notification {
    
    [ScrollViewContainer setContentOffset:CGPointZero animated:YES];
    
}
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}
-(NSData *)compraseImage:(UIImage*)largeImage
{
    
    double compressionRatio = 1;
    int resizeAttempts = 5;
    
    NSData * imgData = UIImageJPEGRepresentation(largeImage,compressionRatio);
    
    NSLog(@"Starting Size: %i", [imgData length]);
    
    //Trying to push it below around about 0.4 meg
    while ([imgData length] > 400000 && resizeAttempts > 0) {
        resizeAttempts -= 1;
        
        NSLog(@"Image was bigger than 400000 Bytes. Resizing.");
        NSLog(@"%i Attempts Remaining",resizeAttempts);
        
        //Increase the compression amount
        compressionRatio = compressionRatio*0.5;
        NSLog(@"compressionRatio %f",compressionRatio);
        //Test size before compression
        NSLog(@"Current Size: %i",[imgData length]);
        imgData = UIImageJPEGRepresentation(largeImage,compressionRatio);
        
        //Test size after compression
        NSLog(@"New Size: %i",[imgData length]);
    }
    
    return imgData;
//    //Check how big the image is now its been compressed and put into the UIImageView
//    
//    // *** I made Change here, you were again storing it with Highest Resolution ***
//    NSData *endData = UIImageJPEGRepresentation(largeImage,compressionRatio);
//    NSLog(@"Ending Size: %i", [endData length]);
//    return  endData;
    
}
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)size {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToMaxWidth:(CGFloat)width maxHeight:(CGFloat)height {
    CGFloat oldWidth = image.size.width;
    CGFloat oldHeight = image.size.height;
    
    CGFloat scaleFactor = (oldWidth > oldHeight) ? width / oldWidth : height / oldHeight;
    
    CGFloat newHeight = oldHeight * scaleFactor;
    CGFloat newWidth = oldWidth * scaleFactor;
    CGSize newSize = CGSizeMake(newWidth, newHeight);
    
    return [self imageWithImage:image scaledToSize:newSize];
}

@end

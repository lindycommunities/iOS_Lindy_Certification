//
//  LindyCertificateHomeViewController.h
//  LendiProperty
//
//  Created by Sudip Deshpande on 15/11/13.
//
//

#import <UIKit/UIKit.h>
#import "Spinner_iPad_Landscape.h"
#import "DropDownView.h"

@interface LeasingAgentAddDataViewController : UIViewController<WsCompleteDelegate,DropDownViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    IBOutlet UITextView *TxtComment;
    Spinner_iPad_Landscape *spinnerlandscape;
    DropDownView *dropDown;
    GlobalJSONParser *json;
    IBOutlet UILabel *LblLindyCommunity;
    IBOutlet UILabel *LblCategory;
    IBOutlet UILabel *LblRates;
    IBOutlet UITextField *TxtApartmentName;
    IBOutlet UITextField *TxtApartmentNo;
    NSString *strflag;
    IBOutlet UIScrollView *ScrollViewContainer;
    UIImagePickerController *imagePickerController;
    UIPopoverController *popover;
    IBOutlet UIButton *BtnImages;
    IBOutlet UIScrollView *ScrollImages;
    int counter;
    IBOutlet UIButton *BtnSubmit;
    IBOutlet UIButton *BtnLindyCommunity;
    IBOutlet UIButton *BtnCategory;
    IBOutlet UIButton *BtnRates;
    IBOutlet UIView *ViewImage;
    IBOutlet UIImageView *ImgBigImage;
    
}
- (IBAction)SelectCommunity:(id)sender;
- (IBAction)SelectCategory:(id)sender;
- (IBAction)SelectRates:(id)sender;
- (IBAction)SubmitData:(id)sender;
- (IBAction)SelectImages:(id)sender;
- (IBAction)CloseImage:(id)sender;


- (IBAction)Certificates:(id)sender;
- (IBAction)Contracts:(id)sender;
- (IBAction)Statistics:(id)sender;
@property (nonatomic, retain) Spinner_iPad_Landscape *spinnerlandscape;
-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display;
-(void) stopSpinnerforlandscape;
@property(nonatomic,retain)NSMutableArray *arrbuilding,*arrbuildingid,*arrcategory,*arrcategoryid,*arrrates,*arrratesid,*arrimages,*arrremoteimages,*arrdeleteimages;
@property(nonatomic,retain)NSString *buildingid,*rateid,*categoryid,*formID;
@property(nonatomic,assign)BOOL isEdit,isEditing;
@property (nonatomic, retain) NSDictionary *TotalData;
-(NSData *)compraseImage:(UIImage*)largeImage;


//*arrtype,*arrtypeid,*arrcontractorid,*arrcontractor,,*arrcontracttype;

@end
//Button 1: "Add Lease Adjustment"
//Button 2: "View Existing Adjustments".
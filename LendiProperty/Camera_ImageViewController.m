//
//  Camera_ImageViewController.m
//  LendiProperty
//
//  Created by Vinay D on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Camera_ImageViewController.h"


@implementation Camera_ImageViewController

@synthesize Camera_ImageView;

@synthesize FileName_txt;

@synthesize Notes_txt;

@synthesize Done_btn;

@synthesize Scroll_Imag;

@synthesize spinnerView;

- (id)initWithMutableArray:(NSMutableArray *)_arr
{
    self = [super init];
    if (self) 
    {
     
         ImageArray_temp=[[NSMutableArray alloc]init];
         ImageArray_temp = _arr;

    }
    return self;
}

#pragma mark - App Method

-(void)Donebtn_click
{
  
   
    if([FileName_txt.text length]>0 && [Notes_txt.text length]>0)
    {
    
        [FileName_txt resignFirstResponder];
        [Notes_txt resignFirstResponder];
    
    [self startSpinner:@"spinner" andDisplay:@"Saving Image.."]; 
    
        NSString *strURL = [[NSString stringWithFormat:@"%@photo_album&user_id=%@&save_as=%@&notes=%@",SecondUrl,app.strUserId,FileName_txt.text,Notes_txt.text] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding ];
       
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:strURL]];
        [request setDelegate:self];
    
        [request addData:[ImageArray_temp objectAtIndex:0] withFileName:@"image.jpg" andContentType:@"image/jpeg" forKey:[NSString stringWithFormat:@"image"]];
        [request startAsynchronous];
    }
    else
    {
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Please Fill The All Data.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];    
        [alt show];
        [alt release];

    }
    
    
    

}

-(void)Getimage
{
    
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;;
    [self presentViewController:imagePicker animated:YES completion:Nil];     
    
    
    
}



//BLUEFIRE READER



#pragma mark - Image Upload Delegates


- (void)requestFinished:(ASIHTTPRequest *)request

{
   
        
        [self stopSpinner];
    UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Do Want To Take Another Picture" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
    [Alert show];
    Alert.delegate=self;
    Alert.tag=1;
    [Alert release];

       
          
    
	
}


- (void)requestFailed:(ASIHTTPRequest *)request 

{
	
	[self stopSpinner];
    UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Report is Saved Without Image" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [Alert show];
    [Alert release];
    [self.navigationController dismissModalViewControllerAnimated:YES];
    
    
}



#pragma mark - Alert View Delegates

-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==1)
    {
        
        if(buttonIndex==0)
        {
         
            [self Getimage];
                 
        }
        else
        {
            [self.navigationController dismissModalViewControllerAnimated:YES];
        }
        
    }
    
}




#pragma mark - Image Picker Delegates


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [imagePicker dismissModalViewControllerAnimated:YES];
   
}
- (void)imagePickerController:(UIImagePickerController *)picker 
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    [picker dismissModalViewControllerAnimated:YES];
  
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    /*imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([info objectForKey:@"UIImagePickerControllerOriginalImage"], 2)];
    [ImageArray_temp addObject:imageData];
   
    */
    
  //  photo1=[[UIImageView alloc]init];
    
    
    Cameradic=[[NSMutableDictionary alloc]initWithDictionary:info];
    
    temp_img=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [self dismissModalViewControllerAnimated:YES];

    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"You can reduce the size of scalling image to one of the size below." delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Small" otherButtonTitles:@"Medium",@"Actual Size",nil];
    action.delegate=self;
    action.tag=1;
    action.actionSheetStyle = UIActionSheetStyleAutomatic;
    [action showInView:self.view];

    
    
    
    
   // app.Camera_img=[self  fixOrientation];
    
       

 }


#pragma mark - TextField Delegates

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [Scroll_Imag scrollRectToVisible:CGRectMake(0,0, 768, 0) animated:YES];
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [Scroll_Imag scrollRectToVisible:CGRectMake(0,300,768,1024) animated:YES];
    return YES;
}

#pragma mark - Spinner Methods

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




#pragma mark - Image Orientation Delegates


- (UIImage *)fixOrientation {
    
    // No-op if the orientation is already correct
    if (temp_img.imageOrientation == UIImageOrientationUp) return temp_img;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (temp_img.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, temp_img.size.width, temp_img.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, temp_img.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, temp_img.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (temp_img.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, temp_img.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, temp_img.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, temp_img.size.width, temp_img.size.height,
                                             CGImageGetBitsPerComponent(temp_img.CGImage), 0,
                                             CGImageGetColorSpace(temp_img.CGImage),
                                             CGImageGetBitmapInfo(temp_img.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (temp_img.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,temp_img.size.height,temp_img.size.width), temp_img.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,temp_img.size.width,temp_img.size.height), temp_img.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}


#pragma mark - ActionSheet Delegates


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex

{
     NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
	
     if([title isEqualToString:@"Small"])
        
    {
        
        
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        Camera_ImageView.image=[self fixOrientation];
        
        app=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
        
        app.Camera_img=[self  fixOrientation];
        
        ImageArray_temp=[[NSMutableArray alloc]init];
        
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self  fixOrientation], 0.5)];
        [ImageArray_temp addObject:imageData];
        
         FileName_txt.text=@"";
        
         Notes_txt.text=@"";

        
               
        
    }
    
    
    else if([title isEqualToString:@"Medium"])
        
    {
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        Camera_ImageView.image=[self fixOrientation];
        
        app=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
        
        app.Camera_img=[self  fixOrientation];
        
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self  fixOrientation], 1)];
        [ImageArray_temp addObject:imageData];
        
        FileName_txt.text=@"";
        
        Notes_txt.text=@"";

        
        
       
    }
    
    
    
    else if([title isEqualToString:@"Actual Size"])
        
    {
        temp_img=[Cameradic objectForKey:@"UIImagePickerControllerOriginalImage"]; 
        
        
        Camera_ImageView.image=[self fixOrientation];
        
        app=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
        
        app.Camera_img=[self  fixOrientation];
        
        imageData=[[NSData alloc]initWithData:UIImageJPEGRepresentation([self  fixOrientation], 2)];
        
        [ImageArray_temp addObject:imageData];
        
        FileName_txt.text=@"";
        
        Notes_txt.text=@"";

        
                
    }
    
    else if([title isEqualToString:@"Cancle"])
        
    {
        
        [actionSheet dismissWithClickedButtonIndex:[title intValue] animated:YES];
        
    }
}

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    app=(LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    Camera_ImageView.image=app.Camera_img;
    Scroll_Imag.contentSize = CGSizeMake(768, 1500);
     self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    self.title=@"Save Photo";
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    
    //Camera_ImageView.image=
    // Do any additional setup after loading the view from its nib.
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

#pragma mark - keyboard Delegates

- (void)keyboardDidShow: (NSNotification *) notif
{
    
}

- (void)keyboardDidHide: (NSNotification *) notif
{
    
   [Scroll_Imag scrollRectToVisible:CGRectMake(0,0, 768, 0) animated:YES];
    
}
@end

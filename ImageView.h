//
//  ImageView.h
//  ConferencelyNew
//
//  Created by Vinay Devdikar on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ImageView : UIView {

	NSURLConnection* connection; //keep a reference to the connection so we can cancel download in dealloc
	NSMutableData* data; //keep reference to the data so we can collect it as it downloads
	//but where is the UIImage reference? We keep it in self.subviews - no need to re-code what we have in the parent class
    
    UIActivityIndicatorView *objAct;
	
}
- (void)loadImageFromURL:(NSURL*)url;
- (UIImage*) image;

@end

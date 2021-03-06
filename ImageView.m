    //
//  ImageView.m
//  ConferencelyNew
//
//  Created by Vinay Devdikar on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageView.h"


@implementation ImageView

- (void)dealloc {
	[connection cancel]; //in case the URL is still downloading
	[connection release];
	[data release]; 
    [super dealloc];
}


- (void)loadImageFromURL:(NSURL*)url{
	if (connection!=nil) { [connection release]; } //in case we are downloading a 2nd image
	if (data!=nil) { [data release]; }
    
    objAct = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    objAct.backgroundColor = [UIColor lightGrayColor];
    objAct.frame = self.bounds;//CGRectMake(0, 0, 148, 86);
//    objAct.center = self.center;
    [self addSubview:objAct];
    [objAct startAnimating];

	NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self]; //notice how delegate set to self object
	//TODO error handling, what if connection is nil?
}


//the URL connection calls this repeatedly as data arrives
- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
	if (data==nil) { data = [[NSMutableData alloc] initWithCapacity:2048]; } 
	[data appendData:incrementalData];
}

//the URL connection calls this once all the data has downloaded
- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
	//so self data now has the complete image 
    
	[connection release];
	connection=nil;
	if ([[self subviews] count]>0) {
		//then this must be another image, the old one is still in subviews
		[[[self subviews] objectAtIndex:0] removeFromSuperview]; //so remove it (releases it also)
	}
	
	//make an image view for the image
	UIImageView* imageView = [[[UIImageView alloc] initWithImage:[UIImage imageWithData:data]] autorelease];
	//make sizing choices based on your needs, experiment with these. maybe not all the calls below are needed.
	//imageView.frame = CGRectMake(2,2,50,90); 
//	imageView.contentMode = UIViewContentModeScaleAspectFit;
//	imageView.autoresizingMask = (UIViewAutoresizingFlexibleWidth || UIViewAutoresizingFlexibleHeight);
	[self addSubview:imageView];
	imageView.frame = self.bounds;
	[imageView setNeedsLayout];
	[self setNeedsLayout];
	
	[data release]; //don't need this any more, its in the UIImageView now
	data=nil;
    [objAct stopAnimating];
}

//just in case you want to get the image directly, here it is in subviews
- (UIImage*) image {
	UIImageView* iv = [[self subviews] objectAtIndex:0];
	return [iv image];
}






@end

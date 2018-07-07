//
//  GlobalJSONParser.m
//  PatientIntake
//
//  Created by Sudip Deshpande on 21/02/13.
//
//

#import "GlobalJSONParser.h"
#import "SBJSON.h"

@implementation GlobalJSONParser
@synthesize delegate,dic;
@synthesize flag,PostData,PostCommand;
-(id)initWithJSONString:(NSString *)JSON
{
    //[super init];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

    JSON=[NSString stringWithFormat:@"%@%@",MainURL,JSON];
    NSLog(@"URL =%@",JSON);

    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURL *url = [[NSURL alloc]initWithString:[JSON stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    return self;
}

-(id)initWithJSONStringPDF:(NSString *)JSON{
    
  //  [super init];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    JSON=[NSString stringWithFormat:@"%@%@",MainURLPDF,JSON];
    NSLog(@"URL =%@",JSON);
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURL *url = [[NSURL alloc]initWithString:[JSON stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    return self;
    
}

-(id)initWithJSONString:(NSString *)JSON Image:(NSData *)imgview
{
	//NSData *imgData = UIImageJPEGRepresentation(imgview.image, 90);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

	NSData *imgData=imgview;

    NSURL *url = [[NSURL alloc]initWithString:[JSON stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
	
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:url];
	[request setHTTPMethod:@"POST"];
    
    
    NSString *boundary = @"0xKhTmLbOuNdArY";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary, nil];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"iphonefile.png\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imgData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    
    [[NSURLConnection alloc]initWithRequest:request delegate:self];
    return self;
}
-(id)initWithJSONStringIMAGE:(NSString *)JSONIMAGE
{
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    [urlRequest setHTTPMethod:@"POST"];
    urlRequest.timeoutInterval=5000;
    NSString *JSONURL=[NSString stringWithFormat:@"%@",MainURLIMAGE];
        NSLog(@"POST URL => %@",JSONIMAGE);
    [urlRequest setHTTPBody:[JSONIMAGE dataUsingEncoding:NSUTF8StringEncoding]];
    [urlRequest setURL:[NSURL URLWithString:JSONURL]];
    [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    return self;
}
-(id)initWithJSONString:(NSString *)JSON ANDPOSTData:(NSString *)_postData
{
    self=[super init];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self performSelector:@selector(ProcessPayment) withObject:nil afterDelay:1.0];
    
    self.PostData=  [_postData stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    
//    self.PostData= [NSString stringWithString:_postData];
   // self.PostCommand= [NSString stringWithString:JSON];

    return self;
}
-(id)initWithJSONStringPDF:(NSString *)JSON ANDPOSTData:(NSString *)_postData{
    
    
    self=[super init];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self performSelector:@selector(ProcessPDF) withObject:nil afterDelay:1.0];
    
    self.PostData=  [_postData stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    
    //    self.PostData= [NSString stringWithString:_postData];
    // self.PostCommand= [NSString stringWithString:JSON];
    
    return self;

}

-(void)ProcessPDF
{
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    [urlRequest setHTTPMethod:@"POST"];
    urlRequest.timeoutInterval=5000;
    
    NSString *JSONURL=[NSString stringWithFormat:@"%@",MainURLPDF];
    
    NSLog(@"POST URL => %@",JSONURL);
    //NSLog(@"POST Data => %@",self.PostData);
    [urlRequest setHTTPBody:[self.PostData dataUsingEncoding:NSUTF8StringEncoding]];
    
    [urlRequest setURL:[NSURL URLWithString:JSONURL]];
    [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
}

//- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
//{
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [NSURLConnection sendAsynchronousRequest:request
//                                       queue:[NSOperationQueue mainQueue]
//                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//                               if ( !error )
//                               {
//                                   UIImage *image = [[UIImage alloc] initWithData:data];
//                                   completionBlock(YES,image);
//                               } else{
//                                   completionBlock(NO,nil);
//                               }
//                           }];
//}
-(void)ProcessPayment
{
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    [urlRequest setHTTPMethod:@"POST"];
    urlRequest.timeoutInterval=5000;
    
    NSString *JSONURL=[NSString stringWithFormat:@"%@",MainURLIMAGE];
    
    NSLog(@"POST URL => %@",JSONURL);
    //NSLog(@"POST Data => %@",self.PostData);
    [urlRequest setHTTPBody:[self.PostData dataUsingEncoding:NSUTF8StringEncoding]];
    
    [urlRequest setURL:[NSURL URLWithString:JSONURL]];
    [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    jsonData = [[NSMutableData alloc]init];
    [jsonData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData
{
    [jsonData appendData:theData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSString *receivedString = [[NSString alloc] initWithData:jsonData
                                                     encoding:NSASCIIStringEncoding];
    NSLog( @"From connectionDidFinishLoading: %@", receivedString );
    dic = [[NSDictionary alloc] init];
    
    SBJSON *parser = [[SBJSON alloc] init];
    // 1. get the top level value as a dictionary
   dic = [parser objectWithString:receivedString error:NULL];

    NSLog(@"Dic desc: %@",[dic description]);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    [delegate RequestFinished:dic];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    [delegate RequestError];
    NSLog(@"error desc: %@",[error description]);

    
  //  [jsonData release];
    //[connection release];
}
@end

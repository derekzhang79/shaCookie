//
//  WebJsonDataGetter.m
//  miniGame
//
//  Created by 趴特萬 on 13/3/28.
//
//

#import "WebJsonDataGetter.h"
#import "JSON.h"
//#import "JSONKit.h"
@implementation WebJsonDataGetter
-(id)init{
    self=[super init];
    if (self) {
        
    }
    return self;
}
-(id)initWithURLString:(NSString*)url{
    self=[super init];
    if (self) {
        webRequest=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
        [webRequest setDelegate:self];
        [webRequest startAsynchronous];
    }
    return self;
}

-(void)requestFinished:(ASIHTTPRequest *)request{
    NSString *jsonStr=[[NSString alloc]initWithData:request.responseData encoding:NSUTF8StringEncoding];
    
    SBJsonParser *jsonStrParser=[[SBJsonParser alloc]init];
    //self.dictionary_nmlData=[jsonStrParser objectWithString:jsonStr error:nil];
    //    NSLog(@"%@",[jsonStrParser objectWithString:jsonStr error:nil]);
    self.webData=[jsonStrParser objectWithString:jsonStr error:nil];
    [self.delegate  doThingAfterWebJsonIsOKFromDelegate];
}

-(void)requestFailed:(ASIHTTPRequest *)request{
    NSLog(@"Faile");
    //要教他們
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Error" message:@"BeSure" delegate:nil cancelButtonTitle:@"canel" otherButtonTitles:@"one",@"two", nil];
    [alert setDelegate:self];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            NSLog(@"cancel");
            break;
        case 1:
            NSLog(@"one");
            break;
        default:
            break;
    }
}
@end

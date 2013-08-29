//
//  Person.m
//  miniGame
//
//  Created by 趴特萬 on 13/3/28.
//
//

#import "Person.h"
#import "WebList.h"
@implementation Person
-(id)init{
    self=[super init];
    if (self) {
        dataGetter=[[WebJsonDataGetter alloc] initWithURLString:WebList_String_GetPersonCoordinate];
        [dataGetter setDelegate:self];
    }
    return self;
}
-(void)doThingAfterWebJsonIsOKFromDelegate{
    NSArray *array=(NSArray*)dataGetter.webData;
    self.coord=CLLocationCoordinate2DMake([[[array objectAtIndex:0] objectForKey:@"latitude"] doubleValue], [[[array objectAtIndex:0] objectForKey:@"longtitude"] doubleValue]);
    //NSLog(@"do %f %f",self.coord.latitude,self.coord.longitude);
    [self.delegate doThingAfterWebPersonLoadLocationIsOKFromDelegate];
}
@end

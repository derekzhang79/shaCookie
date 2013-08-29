//
//  Person.h
//  miniGame
//
//  Created by 趴特萬 on 13/3/28.
//
//

@protocol WebPersonLoadLocationFinishDelegater <NSObject>
@optional
-(void)doThingAfterWebPersonLoadLocationIsOKFromDelegate;
@end
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "WebJsonDataGetter.h"
@interface Person : NSObject<WebJsonDataGetFinishDelegater>{
    WebJsonDataGetter *dataGetter;
}
@property(assign)CLLocationCoordinate2D coord;
@property(nonatomic,weak)id<WebPersonLoadLocationFinishDelegater>delegate;
@end

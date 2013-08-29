//
//  PlsitRead.h
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//

#import <Foundation/Foundation.h>

@interface PlsitRead : NSObject{
    NSString *fileName;
}
-(NSArray*)readFromFile;
-(id)initWithFileName:(NSString*)filename;
@end

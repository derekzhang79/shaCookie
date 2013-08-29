//
//  PlsitRead.m
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//


#import "PlsitRead.h"

@implementation PlsitRead
-(id)initWithFileName:(NSString*)filename{
    self=[super init];
    if(self){
        fileName=filename;
    }
    
    return self;
}


-(NSArray*)readFromFile{
    NSArray *fArr = [fileName componentsSeparatedByString:@"."];
    NSString *path = [[NSBundle mainBundle] pathForResource:[fArr objectAtIndex:0] ofType:[fArr objectAtIndex:1]];
    NSData *plistData = [NSData dataWithContentsOfFile:path];
    NSString *error; NSPropertyListFormat format;
    
    return [NSPropertyListSerialization propertyListFromData:plistData
                                            mutabilityOption:kCFPropertyListMutableContainersAndLeaves
                                                      format:&format
                                            errorDescription:&error];
}

@end

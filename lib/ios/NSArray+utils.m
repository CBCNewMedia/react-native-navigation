#import "NSArray+utils.h"

@implementation NSArray (utils)

- (NSArray*)intersect:(NSArray *)array withPropertyName:(NSString *)propertyName {
    NSMutableArray* intersection = [NSMutableArray new];
    for (NSObject* object in array) {
        NSArray* filteredArray = [self filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"%@ == %@", propertyName, object]];
        [intersection addObjectsFromArray:filteredArray];
    }
    
    return [NSArray arrayWithArray:intersection];
}

- (NSArray*)difference:(NSArray *)array withPropertyName:(NSString *)propertyName {
    NSMutableArray* diff = [NSMutableArray arrayWithArray:self];
    NSArray* intersection = [self intersect:array withPropertyName:propertyName];
    [diff removeObjectsInArray:intersection];
    
    return [NSArray arrayWithArray:diff];
}

@end

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IngredientsChecker : NSObject

- (BOOL) checkFirstIngredientWithName:(NSString *)name;
- (BOOL) checkSecondIngredientWithName:(NSString *)name;
- (BOOL) checkThirdIngredientWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

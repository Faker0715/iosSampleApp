//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by faker on 2022/7/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView
-(void)showDeleteView;
-(void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
@end



NS_ASSUME_NONNULL_END

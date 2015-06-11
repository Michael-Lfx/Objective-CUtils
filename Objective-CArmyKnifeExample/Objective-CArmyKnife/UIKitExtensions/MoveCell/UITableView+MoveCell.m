#import "UITableView+MoveCell.h"
#import <objc/runtime.h>

@implementation UITableView (MoveCell)

- (instancetype)enableDragCellWithDataSourceUpdateBlock:(MoveCellDataSourceUpdateBlock)block {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveCell_longPressGestureRecognizer:)];
    [self addGestureRecognizer:longPress];
    objc_setAssociatedObject(self, @selector(longPressGestureRecognizer), longPress, OBJC_ASSOCIATION_RETAIN);
    [self setMoveCellDataSourceUpdateBlock:block];
    
    return self;
}

- (UILongPressGestureRecognizer *)longPressGestureRecognizer {
    return objc_getAssociatedObject(self, @selector(longPressGestureRecognizer));
}

- (MoveCellDataSourceUpdateBlock)moveCellDataSourceUpdateBlock {
    return objc_getAssociatedObject(self, @selector(moveCellDataSourceUpdateBlock));
}

- (void)setMoveCellDataSourceUpdateBlock:(MoveCellDataSourceUpdateBlock)moveCellDataSourceUpdateBlock {
    objc_setAssociatedObject(self, @selector(moveCellDataSourceUpdateBlock), moveCellDataSourceUpdateBlock, OBJC_ASSOCIATION_COPY);
}

- (void)moveCell_longPressGestureRecognizer:(id)sender {
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    if (longPress != self.longPressGestureRecognizer) {
        return;
    }
    UIGestureRecognizerState state = longPress.state;
    
    CGPoint location = [longPress locationInView:self];
    NSIndexPath *indexPath = [self indexPathForRowAtPoint:location];
    
    static UIView       *snapshot = nil;        ///< A snapshot of the row user is moving.
    static NSIndexPath  *sourceIndexPath = nil; ///< Initial index path, where gesture begins.
    
    switch (state) {
        case UIGestureRecognizerStateBegan: {
            if (indexPath) {
                sourceIndexPath = indexPath;
                
                UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
                
                // Take a snapshot of the selected row using helper method.
                snapshot = [self snapshotFromView:cell];
                
                // Add the snapshot as subview, centered at cell's center...
                __block CGPoint center = cell.center;
                snapshot.center = center;
                snapshot.alpha = 0.0;
                [self addSubview:snapshot];
                [UIView animateWithDuration:0.25 animations:^{
                    
                    // Offset for gesture location.
                    center.y = location.y;
                    snapshot.center = center;
                    snapshot.transform = CGAffineTransformMakeScale(1.05, 1.05);
                    snapshot.alpha = 0.98;
                    cell.alpha = 0.0;
                    
                } completion:^(BOOL finished) {
                    
                    cell.hidden = YES;
                    
                }];
            }
            break;
        }
            
        case UIGestureRecognizerStateChanged: {
            CGPoint center = snapshot.center;
            center.y = location.y;
            snapshot.center = center;
            
            // Is destination valid and is it different from source?
            if (indexPath && ![indexPath isEqual:sourceIndexPath]) {
                
                @autoreleasepool {
                    // ... update data source.
                    if ([self moveCellDataSourceUpdateBlock]) {
                        [self moveCellDataSourceUpdateBlock](indexPath, sourceIndexPath);
                    }
                }
                
                // ... move the rows.
                [self moveRowAtIndexPath:sourceIndexPath toIndexPath:indexPath];
                
                // ... and update source so it is in sync with UI changes.
                sourceIndexPath = indexPath;
            }
            break;
        }
            
        default: {
            // Clean up.
            UITableViewCell *cell = [self cellForRowAtIndexPath:sourceIndexPath];
            cell.hidden = NO;
            cell.alpha = 0.0;
            
            [UIView animateWithDuration:0.25 animations:^{
                
                snapshot.center = cell.center;
                snapshot.transform = CGAffineTransformIdentity;
                snapshot.alpha = 0.0;
                cell.alpha = 1.0;
                
            } completion:^(BOOL finished) {
                
                sourceIndexPath = nil;
                [snapshot removeFromSuperview];
                snapshot = nil;
                
            }];
            
            break;
        }
    }
    [self reloadData];
}

#pragma mark - Helper methods

/** @brief Returns a customized snapshot of a given view. */
- (UIView *)snapshotFromView:(UIView *)inputView {
    
    // Make an image from the input view.
    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, NO, 0);
    [inputView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Create an image view.
    UIView *snapshot = [[UIImageView alloc] initWithImage:image];

    snapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
    snapshot.layer.shadowRadius = 5.0;
    snapshot.layer.shadowOpacity = 0.4;
    
    return snapshot;
}

@end

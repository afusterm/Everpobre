//
//  AFMNotebookCellView.m
//  Everpobre
//
//  Created by Alejandro on 16/2/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AFMNotebookCellView.h"

@implementation AFMNotebookCellView

#pragma mark - Class methods

+(NSString *) cellId {
    return NSStringFromClass(self);
}

+(CGFloat) cellHeight {
    return 60.0f;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

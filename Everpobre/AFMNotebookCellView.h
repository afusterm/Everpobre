//
//  AFMNotebookCellView.h
//  Everpobre
//
//  Created by Alejandro on 16/2/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFMNotebookCellView : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *nameView;
@property (nonatomic, strong) IBOutlet UILabel *numberOfNotesView;

+(NSString *) cellId;
+(CGFloat) cellHeight;

@end

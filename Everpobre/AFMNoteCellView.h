//
//  AFMNoteCellView.h
//  Everpobre
//
//  Created by Alejandro on 18/08/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AFMNote;

@interface AFMNoteCellView : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *modificationDateView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UIImageView *locationView;

-(void) observeNote:(AFMNote *) note;

@end

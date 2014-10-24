//
//  NoteTableViewCell.h
//  NotesForGoatsRedux
//
//  Created by Loan Wolf on 10/19/14.
//  Copyright (c) 2014 Mandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *smallCellImageView;
@property (weak, nonatomic) IBOutlet UILabel *smallCellNoteTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *smallCellNoteTextLabel;

@end

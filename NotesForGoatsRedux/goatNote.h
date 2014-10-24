//
//  goatNote.h
//  NotesForGoatsRedux
//
//  Created by Loan Wolf on 10/20/14.
//  Copyright (c) 2014 Mandy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface goatNote : NSObject

//nonatomic - keeps two threads from accessing objects at the same time
//prevents read write errors
@property (strong, nonatomic) UIImage *notePicture;
@property (strong, nonatomic) NSString *noteTitle;
@property (strong, nonatomic) NSString *noteBody;

-(instancetype) initWithTitle:(NSString *) title withBody:(NSString *) body withPicture: (UIImage *) picture;

//-(instancetype) initWithTitleWithBodyWithPicture (NSString *title, NSString *body, UIImage *picture);

@end

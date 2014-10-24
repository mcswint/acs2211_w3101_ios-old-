//
//  goatNote.m
//  NotesForGoatsRedux
//
//  Created by Loan Wolf on 10/20/14.
//  Copyright (c) 2014 Mandy. All rights reserved.
//

#import "goatNote.h"

@implementation goatNote

- (instancetype)init
{
    return [self initWithTitle:@"" withBody:@"" withPicture:NULL];
}

-(instancetype)initWithTitle:(NSString *)title withBody:(NSString *)body withPicture:(UIImage *)picture {
    self = [super init];
    if (self) {
        _noteTitle = title;
        _noteBody = body;
        _notePicture = picture;
    }
    return self;
}
@end

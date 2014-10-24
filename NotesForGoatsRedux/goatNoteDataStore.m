//
//  goatNoteDataStore.m
//  NotesForGoatsRedux
//
//  Created by Loan Wolf on 10/20/14.
//  Copyright (c) 2014 Mandy. All rights reserved.
//

#import "goatNoteDataStore.h"
#import "goatNote.h"

@implementation goatNoteDataStore

//singleton to initalize global waya
+ (instancetype) sharedGoatNotesDataStore {
    static goatNoteDataStore *_sharedGoatNotesDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedGoatNotesDataStore = [[goatNoteDataStore alloc] init];
    });
    
    return _sharedGoatNotesDataStore;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _goatNoteArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) createGoatNoteWithTitle:(NSString *)title withBody:(NSString *)body withPciture:(UIImage *)picture{
    
    goatNote *newNote = [[goatNote alloc] initWithTitle:title withBody:body withPicture:picture];
    
    [self.goatNoteArray addObject:newNote];
    
}

@end

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
        _archive = [[NSData alloc] init];
    }
    return self;
}

- (void) createGoatNoteWithTitle:(NSString *)title withBody:(NSString *)body withPciture:(UIImage *)picture{
    
    goatNote *newNote = [[goatNote alloc] initWithTitle:title withBody:body withPicture:picture];
    
    [self.goatNoteArray addObject:newNote];
    
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.goatNoteArray = [decoder decodeObjectForKey:@"goatNoteArray"];

    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.goatNoteArray forKey:@"goatNoteArray"];
    
    
}



@end

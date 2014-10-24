//
//  goatNoteDataStore.h
//  NotesForGoatsRedux
//
//  Created by Loan Wolf on 10/20/14.
//  Copyright (c) 2014 Mandy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface goatNoteDataStore : NSObject

@property (strong, nonatomic) NSMutableArray *goatNoteArray;

+ (instancetype) sharedGoatNotesDataStore;

- (void) createGoatNoteWithTitle:(NSString *)title withBody:(NSString *) body withPciture: (UIImage *) picture;

@end

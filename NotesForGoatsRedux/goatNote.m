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

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.noteTitle = [decoder decodeObjectForKey:@"title"];
    self.noteBody = [decoder decodeObjectForKey:@"body"];
    
    NSData* data = [decoder decodeObjectForKey:@"picture"];
   // NSLog(@"Data length: %d", data.length);
    self.notePicture =[UIImage imageWithData:data];
    

    //self.notePicture = [decoder decodeObjectForKey:@"picture"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.noteTitle forKey:@"title"];
    [encoder encodeObject:self.noteBody forKey:@"body"];
    
    NSData* data = UIImagePNGRepresentation(self.notePicture);
  //  NSLog(@"Data length: %d", data.length);
    [encoder encodeObject:data forKey:@"picture"];
    
  //  [encoder encodeObject:self.notePicture forKey:@"picture"];

}


@end

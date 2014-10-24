//
//  AddNewNoteViewController.m
//  NotesForGoatsRedux
//
//  Created by Loan Wolf on 10/20/14.
//  Copyright (c) 2014 Mandy. All rights reserved.
//

#import "AddNewNoteViewController.h"
#import "goatNoteDataStore.h"

@interface AddNewNoteViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *noteImageView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;
@property (strong, nonatomic) goatNoteDataStore *dataStore;

- (IBAction)saveNote:(id)sender;

- (IBAction)addPicture:(UIBarButtonItem *)sender;
@end

@implementation AddNewNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.noteImageView.image = [UIImage imageNamed:@"sassyGoat.jpg"];
    
    self.dataStore = [goatNoteDataStore sharedGoatNotesDataStore];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveNote:(id)sender {
    
    UIImage *goatPicture = self.noteImageView.image;
    
    NSString *title = self.titleTextField.text;
    NSString *body = self.bodyTextView.text;
    
    [self.dataStore createGoatNoteWithTitle:title withBody:body withPciture:goatPicture];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addPicture:(UIBarButtonItem *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self.navigationController presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.noteImageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    UIImage *goatPicture = [UIImage imageNamed:@"sassyGoat.jpg"];
    self.noteImageView.image = goatPicture;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

@end

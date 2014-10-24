//
//  AddNewNoteViewController.m
//  NotesForGoatsRedux
//
//  Created by Loan Wolf on 10/20/14.
//  Copyright (c) 2014 Mandy. All rights reserved.
//

#import "AddNewNoteViewController.h"
#import "goatNoteDataStore.h"
#import "goatNote.h"

#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface AddNewNoteViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *noteImageView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;
@property (strong, nonatomic) goatNoteDataStore *dataStore;
@property (strong, nonatomic) NSData *archive;



- (IBAction)saveNote:(id)sender;

- (IBAction)addPicture:(UIBarButtonItem *)sender;
@end

@implementation AddNewNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_selectedNote != nil ){
        self.noteImageView.image = _selectedNote.notePicture;
        self.titleTextField.text = _selectedNote.noteTitle;
        self.bodyTextView.text = _selectedNote.noteBody;
        
    } else {
    
        self.noteImageView.image = [UIImage imageNamed:@"sassyGoat.jpg"];
    }
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
    
    
    
    if (_selectedNote != nil){
        _selectedNote.notePicture = self.noteImageView.image;
        _selectedNote.noteTitle = self.titleTextField.text;
        _selectedNote.noteBody = self.bodyTextView.text;
        
    } else {
        [self.dataStore createGoatNoteWithTitle:title withBody:body withPciture:goatPicture];
        
         //[NSKeyedArchiver archiveRootObject:_dataStore toFile:@"archive"];
       // _archive = [NSKeyedArchiver archivedDataWithRootObject:_dataStore];
    }
    
/**    for (goatNote *g in _dataStore.goatNoteArray){
        NSLog(@"%@", g.noteTitle);
       NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:g.noteTitle];
        [[NSUserDefaults standardUserDefaults] setObject:archivedData forKey:@"title"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
 */
    
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:_dataStore.goatNoteArray];
    [[NSUserDefaults standardUserDefaults] setObject:archivedData forKey:@"goatNoteArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
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




- (IBAction)sendEmail:(id)sender {
    NSLog(@"%@", sender);
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        
        NSString *messageSubject = self.titleTextField.text;
        NSString *messageBody = self.bodyTextView.text;
        
        NSData *imageData = UIImageJPEGRepresentation(self.noteImageView.image, 1);
        [mailViewController addAttachmentData:imageData mimeType:@"image/jpeg" fileName:@"NoteAttachment.jpg"];
        
        [mailViewController setSubject:messageSubject];
        [mailViewController setMessageBody:messageBody isHTML:NO];
        
        [self.navigationController presentViewController:mailViewController animated:YES completion:nil];
        
    }
    else {
        
        NSLog(@"Device is unable to send email in its current state.");
        
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end

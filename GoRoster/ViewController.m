//
//  ViewController.m
//  GoRoster
//
//  Created by Jun Hoang on 21/11/21.
//

#import "ViewController.h"




@interface ViewController (){
    NSArray *avaiTime;
}
@property (weak, nonatomic) IBOutlet UITextField *texBox1;
@property (weak, nonatomic) IBOutlet UITextField *texBox2;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _db = [FIRFirestore firestore];
    
    avaiTime =@[@"Not Available",@"07:00-12:00",@"12:00-17:00",@"07:00-17:00"];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return avaiTime.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //NSString *mon = avaiTime[row];
    return avaiTime[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.lblTime.text = avaiTime[row];
}






- (IBAction)GgSignIn:(id)sender {
    
}






// test firebase
- (IBAction)btnSave:(id)sender {
    printf("check check");
    
    NSString *texName = _texBox1.text;
    NSString *texAge = _texBox2.text;
    
    // Add a new document with a generated ID
    __block FIRDocumentReference *ref =
        [[self.db collectionWithPath:@"Employee"] addDocumentWithData:@{
          @"empName": texName,
          @"empBirth": texAge
          
        } completion:^(NSError * _Nullable error) {
          if (error != nil) {
            NSLog(@"Error adding document: %@", error);
          } else {
            NSLog(@"Document added with ID: %@", ref.documentID);
          }
        }];
}



@end

//
//  ViewController.h
//  GoRoster
//
//  Created by Jun Hoang on 21/11/21.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import GoogleSignIn;

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property FIRFirestore *db;


@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;


@end


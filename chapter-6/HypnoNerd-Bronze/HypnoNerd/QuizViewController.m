//
//  QuizViewController.m
//  Quiz
//
//  Created by Naresh Rawat on 14/02/2026.
//

#import "QuizViewController.h"

@interface QuizViewController ()
@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;
@property (nonatomic) int currentQuestionIndex;
@end

@implementation QuizViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.questions = @[@"From what is cognac made?",
                           @"What is 7 + 7?",
                           @"What is the capital of Nepal?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Kathmandu"];
        
        UITabBarItem *item = [[UITabBarItem alloc] init];
        
        item.title = @"Quiz";
        item.image = [UIImage imageNamed:@"quiz"];
        self.tabBarItem = item;
    }
    return self;
    
}

- (IBAction) showQuestion:(id)sender
{
    self.currentQuestionIndex++;
    
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    
    self.answerLabel.text = @"???";
}

- (IBAction) showAnswer:(id)sender
{
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

@end

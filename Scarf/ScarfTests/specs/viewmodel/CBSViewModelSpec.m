#import "Kiwi.h"
#import "CBSViewModel.h"

SPEC_BEGIN(CBSViewModelSpec)

describe(@"A CBSViewModel", ^{
    
    context(@"is created", ^{
        
        it(@"should not be nil.", ^{
            CBSViewModel *viewModel = [[CBSViewModel alloc] init];
            [[viewModel shouldNot] beNil];
        });
        
    });
    
});

SPEC_END
// MARK: - Mocks generated from file: Sources/HelloConsole.swift at 2023-12-12 14:06:31 +0000


import Cuckoo
@testable import Hello






 class MockHelloConsole: HelloConsole, Cuckoo.ClassMock {
    
     typealias MocksType = HelloConsole
    
     typealias Stubbing = __StubbingProxy_HelloConsole
     typealias Verification = __VerificationProxy_HelloConsole

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: HelloConsole?

     func enableDefaultImplementation(_ stub: HelloConsole) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     override func print(👋: String)  {
        
    return cuckoo_manager.call(
    """
    print(👋: String)
    """,
            parameters: (👋),
            escapingParameters: (👋),
            superclassCall:
                
                super.print(👋: 👋)
                ,
            defaultCall: __defaultImplStub!.print(👋: 👋))
        
    }
    
    

     struct __StubbingProxy_HelloConsole: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func print<M1: Cuckoo.Matchable>(👋: M1) -> Cuckoo.ClassStubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: 👋) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockHelloConsole.self, method:
    """
    print(👋: String)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_HelloConsole: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func print<M1: Cuckoo.Matchable>(👋: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: 👋) { $0 }]
            return cuckoo_manager.verify(
    """
    print(👋: String)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class HelloConsoleStub: HelloConsole {
    

    

    
    
    
    
     override func print(👋: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: Sources/HelloMessage.swift at 2023-12-12 14:06:31 +0000


import Cuckoo
@testable import Hello






 class MockHelloMessage: HelloMessage, Cuckoo.ClassMock {
    
     typealias MocksType = HelloMessage
    
     typealias Stubbing = __StubbingProxy_HelloMessage
     typealias Verification = __VerificationProxy_HelloMessage

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: HelloMessage?

     func enableDefaultImplementation(_ stub: HelloMessage) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    

     struct __StubbingProxy_HelloMessage: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }

     struct __VerificationProxy_HelloMessage: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
    }
}


 class HelloMessageStub: HelloMessage {
    

    

    
}





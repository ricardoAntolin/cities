platform :ios, '11.0'
inhibit_all_warnings!

def reactive
    pod 'RxSwift',    '~> 4.0'
    pod 'RxOptional'
end

def reactive_cocoa
    pod 'RxCocoa',    '~> 4.0'
    pod 'RxDataSources'
    pod 'RxViewController'
end

def realm
    pod 'RxRealm'
    pod 'RealmSwift'
    pod 'Realm'
end

def network
    pod 'Alamofire'
    pod 'RxAlamofire'
    pod 'RxCodable'
end


def test_pods
    pod 'RxTest',    '~> 4.0'
    pod 'RxBlocking',    '~> 4.0'
    pod 'Nimble'
    pod 'RxNimble'
    pod 'OHHTTPStubs/Swift'
end

target 'Data' do
    project 'square1.xcodeproj'
    use_frameworks!
    reactive
    
    target 'DataTests' do
        inherit! :search_paths
        
        test_pods
    end
    
end

target 'Domain' do
    project 'square1.xcodeproj'
    use_frameworks!
    reactive
    
    target 'DomainTests' do
        inherit! :search_paths
        
        test_pods
    end
    
end

target 'NetworkDataProvider' do
    project 'square1.xcodeproj'
    use_frameworks!
    reactive
    network
    
    target 'NetworkDataProviderTests' do
        inherit! :search_paths
        
        test_pods
    end
    
end

target 'RealmDataProvider' do
    project 'square1.xcodeproj'
    use_frameworks!
    reactive
    realm
    
    target 'RealmDataProviderTests' do
        inherit! :search_paths
        
        test_pods
    end
    
end

target 'square1' do
    project 'square1.xcodeproj'
    use_frameworks!
    reactive
    reactive_cocoa
    
    target 'square1Tests' do
        inherit! :search_paths
        
        test_pods
    end
    
    target 'square1UITests' do
        inherit! :search_paths
        
        test_pods
    end
    
end

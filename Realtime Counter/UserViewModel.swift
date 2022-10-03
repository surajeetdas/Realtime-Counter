import Foundation


class UserViewModel{
    
    var userData = [[String : Any]]()
    var didGetLiveCounterData : ([[String:Any]])->Void
    
    init(_ liveDataClosure : @escaping ([[String:Any]])->Void){
        self.didGetLiveCounterData = liveDataClosure
    }
    
    func getUserName(index : Int) -> String{
        return (self.userData[index]["Name"] as? String)!
    }
    
    func getUserPoints(index : Int) -> Int{
        return (self.userData[index]["Points"] as? Int)!
    }
}

import Foundation
import FirebaseFirestore

struct FirestoreDB{
    
    private static let dBInstance = Firestore.firestore()
    private let counterRefDocument = dBInstance.collection("counters").document(Strings.documentId)
    private let queryInstance = dBInstance.collection("counters").order(by: "Points", descending: true)
    
    
    func incrementCounter(){
        self.counterRefDocument.updateData([
            "Points" : FieldValue.increment(Int64(1))
        ])
    }
    
    func getLiveCounterData(userViewModel : UserViewModel){
        self.queryInstance.addSnapshotListener{ document,error in
            guard let document = document else {
                print("Error")
                return
            }
            userViewModel.userData.removeAll()
            for documentItem in document.documents{
                var userLiveData = [String:Any]()
                userLiveData["Name"] = documentItem.data()["Name"] as? String
                userLiveData["Points"] = documentItem.data()["Points"]
                userViewModel.userData.append(userLiveData)
            }
            userViewModel.didGetLiveCounterData(userViewModel.userData)
        }
    }
}

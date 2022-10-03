//
//  HomeViewController.swift
//  Realtime Counter
//
//  Created by Vantage Circle on 03/10/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var countTableView : UITableView!
    
    private var userLiveCounterData = [[String:Any]](){
        didSet{
            self.countTableView.reloadData()
        }
    }
    private let firestoreDb = FirestoreDB()
    private var userViewModel : UserViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.countTableView.dataSource = self
        self.countTableView.delegate = self
        self.registerCells()
        userViewModel = UserViewModel(){ userLiveData in
            self.userLiveCounterData = userLiveData
        }
        self.firestoreDb.getLiveCounterData(userViewModel: self.userViewModel!)
    }
    
    @IBAction func updatePoints(){
        self.firestoreDb.incrementCounter()
    }
    
    private func registerCells(){
        self.countTableView.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellReuseIdentifier: "HomeViewCell")
    }
    
}

extension HomeViewController : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userLiveCounterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell", for: indexPath) as? HomeViewCell
        homeViewCell?.setData(self.userViewModel!,indexPath.row)
        return homeViewCell ?? UITableViewCell()
    }
    
    
}

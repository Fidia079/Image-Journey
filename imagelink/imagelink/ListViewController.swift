//
//  ListViewController.swift
//  imagelink
//
//  Created by 望月　偉央利 on 2021/07/03.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ideaList = [String]()
    let userDefaults = UserDefaults.standard
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ideaList.count
    }
    @IBAction func addbutton(_ sender: Any) {
        if(firstWord != "" && nowWord != "" && firstWord != nowWord){
            let alertController = UIAlertController(title: "アイデア追加", message: "結びつきを追加しますか？", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "追加", style: UIAlertAction.Style.default) { (acrion: UIAlertAction) in
                        let ideaname = firstWord + "+" + nowWord
                        self.ideaList.insert(ideaname, at: 0)
                        self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right)
                
                    self.userDefaults.set(self.ideaList, forKey: "ideaList")
                    }
                alertController.addAction(okAction)
                let cancelButton = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: nil)
                alertController.addAction(cancelButton)
                present(alertController, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdeaCell", for: indexPath)
                let ideaTitle = ideaList[indexPath.row]
                cell.textLabel?.text = ideaTitle
                return cell
    }
    
    //セルの削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                ideaList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
                userDefaults.set(ideaList, forKey: "ideaList")
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let saveIdeaList = userDefaults.array(forKey: "ideaList") as? [String] {
                ideaList.append(contentsOf: saveIdeaList)
        }
    }
    
    

}

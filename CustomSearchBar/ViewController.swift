//
//  ViewController.swift
//  CustomSearchBar
//
//  Created by Oscar David Myerston Vega on 15/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {
  
  @IBOutlet weak var textSearchBar: UITextField!
  @IBOutlet weak var tablewView: UITableView!
  
  var fruitsArray: [String] = Array()
  var searchedArray: [String] = Array()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fruitsArray.append("Apple")
    fruitsArray.append("Orange")
    fruitsArray.append("Litchi")
    fruitsArray.append("PineApple")
    
    self.mapFruit()
    textSearchBar.delegate = self
  }
  
  // MARK: UITableViewDataSource
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchedArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    if cell == nil {
      cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    }
    cell?.textLabel?.text = searchedArray[indexPath.row]
    return cell!
  }
  
  //MARK: - UITextFieldDelegates
  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    textSearchBar.resignFirstResponder()
    textSearchBar.text = ""
    self.searchedArray.removeAll()
    self.mapFruit()
    self.tablewView.reloadData()
    return false
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if (textSearchBar.text?.count)! != 0 {
      self.searchedArray.removeAll()
      _ = fruitsArray.map({ str in
        let range = str.lowercased().range(of: textField.text!, options: .caseInsensitive, range: nil, locale: nil)
        if range != nil {
          self.searchedArray.append(str)
        }
        
      })
    }
    self.tablewView.reloadData()
    return true
  }
  
  private func mapFruit() {
    _ = fruitsArray.map({ str in
      searchedArray.append(str)
    })
  }
  
}


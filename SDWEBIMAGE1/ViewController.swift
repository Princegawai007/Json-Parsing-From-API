//
//  ViewController.swift
//  SDWEBIMAGE1
//
//  Created by Prince's Mac on 30/07/22.
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var urlTableView: UITableView!
    var dataToFetch = [FetchedData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlTableView.dataSource = self
        urlTableView.delegate = self
        downloadData()
    }
    func downloadData() {
        let urlString = "https://fakestoreapi.com/products"
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if (error == nil) {
                do {
                    self.dataToFetch = try JSONDecoder().decode([FetchedData].self, from: data!)
                    DispatchQueue.main.async {
                        self.urlTableView.reloadData()
                    }
                }catch let err {
                    print("error:\(err.localizedDescription)")
                }
            }
        }.resume()
    }
}
    extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToFetch.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.urlTableView.dequeueReusableCell(withIdentifier: "Cell")
        let fetchedId = dataToFetch[indexPath.row].id
        let fetchedTitle = dataToFetch[indexPath.row].title
        
        cell?.textLabel?.text = String(fetchedId)
        cell?.detailTextLabel?.text = fetchedTitle
        cell?.textLabel?.textColor = UIColor.red
        cell?.detailTextLabel?.textColor = UIColor.systemRed
        return cell!
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            let dataToPass = dataToFetch[indexPath.row]
            secondViewController.dataFromFirstViewController = dataToPass
            
            self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
    extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

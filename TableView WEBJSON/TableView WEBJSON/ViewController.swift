//
//  ЗщыеViewController.swift
//  TableView+Network
//
//  Created by Artem on 25/10/2018.
//  Copyright © 2018 Artem Zakirov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tapme: UIBarButtonItem!
    
    @IBAction func tapped(_ sender: Any) {
        self.rlddata()
    }
    var posts = [Post]()
    let names : [String] = ["ak74m", "akm", "pm_glushitel_1", "m4a1", "mp5silencer", "m1a", "rsass"]
    private let segueName = "toFull"
    private let cellName = "AnimeCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        getPosts()
       
    }
    
  
    
    func getPosts() {
        
        for items in names{
           
        let urlString = "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/"+items+".json"

        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
        
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                self.parsePosts(from: json)
                      self.rlddata()
            } catch {
                print(error.localizedDescription)
            }
            }.resume()
        }
    }
    
    func parsePosts(from json: Any) {
            guard let postDict = json as? NSDictionary,
                let post = Post(dict: postDict) else { return }
        self.posts.append(post)
    }
  
    func rlddata(){
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         //DispatchQueue.main.async {
            guard let cell1 = tableView.dequeueReusableCell(withIdentifier: self.cellName, for: indexPath) as? AnimeCell else { return UITableViewCell()}
            let name1 = self.names[indexPath.row]
       
        let imageURL: URL = URL(string: " https://github.com/ahtubcex/mail_ios_course/raw/master/TableView%20WEBJSON/img/"+name1+".jpg")!
        let data = try? Data(contentsOf: imageURL)
            cell1.configureView(anime: self.posts[indexPath.row], image: UIImage(data: data!)!)
        
        return cell1
        

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let anime = posts[indexPath.row]
        performSegue(withIdentifier: segueName, sender: anime)
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(posts.count)
        return posts.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueName
            {
                guard
                    let vc = segue.destination as? InformationViewController,
                    let selectedPost = sender as? Post
                    else { return }
    
            vc.anime = selectedPost
            let selectedIndexPath = tableView.indexPathForSelectedRow?.item as! Int
//            print(selectedIndexPath)
            let name1 = names[selectedIndexPath]
            let imageURL: URL = URL(string: "https://github.com/techparkios/ios-lectures-fall-2018/raw/master/06/"+name1+".jpg")!
            let data = try? Data(contentsOf: imageURL)
            vc.myspecialImage = UIImage(data: data!)!
        }
    }
}

//
//  MainViewController.swift
//  WBooks
//
//  Created by Nacho 2 on 20/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let _view: MainView = MainView.loadFromNib()!
    
    var booksArray : Array = [["image": "img_book2", "title": "The best book in the world", "subtitle": "Peter Sjermstrom"], ["image": "img_book3", "title": "A little bird told me", "subtitle": "Timpthy Cross"], ["image": "img_book4", "title": "When the doves desappeared", "subtitle": "Sofi Oksanen"]]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        booksArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomBookCell", for: indexPath) as! CustomBookCell
        
        let rowData = booksArray[indexPath.row]
        
        cell.imageSource.image = UIImage(named: rowData["image"]!) 
        cell.titleLabel.text = rowData["title"]
        cell.subtitleLabel.text = rowData["subtitle"]
        
        return cell
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    init() {
        super.init(nibName: .none, bundle: .none)
    }
    
    override public func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._view.booksTable.delegate = self
        self._view.booksTable.dataSource = self
        let nib = UINib.init(nibName: "CustomBookCell", bundle: nil)
        self._view.booksTable.register(nib, forCellReuseIdentifier: "CustomBookCell")
    }
}

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
    
    var booksArray : Array = [["image": "michael", "title": "The best book in the world", "subtitle": "Peter Sjermstrom"], ["image": "michael", "title": "A little bird told me", "subtitle": "Timpthy Cross"], ["image": "michael", "title": "When the doves desappeared", "subtitle": "Sofi Oksanen"]]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        booksArray.count
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
        let nib = UINib.init(nibName: "CustomBookCell", bundle: nil)
        self._view.booksTable.register(nib, forCellReuseIdentifier: "CustomBookCell")
    }
}

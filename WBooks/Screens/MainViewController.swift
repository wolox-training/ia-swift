//
//  MainViewController.swift
//  WBooks
//
//  Created by Nacho 2 on 20/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class MainViewController: BaseViewController {
    private static let cellReuseIdentifier = "CustomBookCell"
    
    private let _view: MainView = MainView.loadFromNib()!
    private let booksArray : Array = [["image": "img_book2", "title": "The best book in the world", "subtitle": "Peter Sjermstrom"], ["image": "img_book3", "title": "A little bird told me", "subtitle": "Timpthy Cross"], ["image": "img_book4", "title": "When the doves desappeared", "subtitle": "Sofi Oksanen"]]
    
    // MARK: - UIViewController

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    // MARK: - MainViewController

    init() {
        super.init(nibName: .none, bundle: .none)
    }

    override public func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.creamBlue?.cgColor
        setTitle(headerTitle: "MAIN_VIEW_HEADER_TITLE".localized())
        setLeftButtonImage(customImage: UIImage.notificationsIcon)
        setRightButtonImage(customImage: UIImage.searchIcon)
        _view.booksTable.delegate = self
        _view.booksTable.dataSource = self
        _view.booksTable.register(cell: CustomBookCell.self)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeue(cell: CustomBookCell.self) else { return UITableViewCell() }
        let rowData = booksArray[indexPath.row]
        cell.setBookAttributes(data: rowData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        booksArray.count
    }
}

//
//  DashboardViewModel.swift
//  Roomguru
//
//  Created by Patryk Kaczmarek on 16/03/15.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//

import Foundation

class DashboardViewModel: NSObject {
    
    private var items: [CellItem]
    
    init(items: [CellItem]) {
        self.items = items
        super.init()
    }
    
    subscript(index: Int) -> CellItem {
        return items[index]
    }
    
}


// MARK: 

extension DashboardViewModel {
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    // MARK: Actions
    
    func revokeBookedRoom() {
        println(__FUNCTION__)
    }
    
    func bookRoom() {
        let bookingManager = BookingManager()
        
        bookingManager.bookTheClosestAvailableRoom({ (response) -> () in
            println(response)
        }, failure: { (error) -> () in
            println(error)
        })
    }

}


// MARK: CellItem

class CellItem {
    
    enum CellItemAction { case Book, Revoke }
    
    let title: String
    let action : CellItemAction
    var color: UIColor { get { return _color } }
    
    init(title: String, action: CellItemAction) {
        self.title = title
        self.action = action
        _color = (action == .Book) ? UIColor.redColor() : UIColor.blueColor()
    }
    
    // MARK: Private
    
    private let _color: UIColor
}

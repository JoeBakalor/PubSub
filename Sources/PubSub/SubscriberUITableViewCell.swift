//
//  SubscriberUITableViewCell.swift
//  onceBLE
//
//  Created by Joe Bakalor on 8/6/19.
//

import Foundation
import UIKit

open class SubscriberUITableViewCell: UITableViewCell, Subscriber{
    
    public var unsubscribers: [(() -> Void)] = []
    
    public func onNewSubscription(_ newUnsubscriber: @escaping ()-> Void){
        self.unsubscribers.append(newUnsubscriber)
    }
    
    public func removeSubscriptions(){
        for unsubscribe in unsubscribers{
            unsubscribe()
        }
    }
    deinit {
        for unsubscribe in unsubscribers{
            unsubscribe()
        }
    }
}

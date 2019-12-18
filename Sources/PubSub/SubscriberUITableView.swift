//
//  File.swift
//  
//
//  Created by Joe Bakalor on 10/8/19.
//

import Foundation
import UIKit

open class SubscriberUITableView: UITableView, Subscriber{
    
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

//
//  SubscriberUIViewController.swift
//  onceBLE
//
//  Created by Joe Bakalor on 5/22/19.
//

import Foundation
import UIKit

open class SubscriberUIViewController: UIViewController, Subscriber{
    
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

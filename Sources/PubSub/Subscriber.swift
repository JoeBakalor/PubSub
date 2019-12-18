//
//  Subscriber.swift
//  onceBLE
//
//  Created by Joe Bakalor on 5/22/19.
//

import Foundation

public protocol Subscriber: Hashable {
    var unsubscribers: [(() -> Void)] { get set }
    func removeSubscriptions()
    func onNewSubscription(_ newUnsubscriber: @escaping ()-> Void)
}

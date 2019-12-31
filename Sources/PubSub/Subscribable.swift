//
//  Subscribable.swift
//  onceBLE
//
//  Created by Joe Bakalor on 5/22/19.
//

import Foundation

open class Subscribable<T>: NSObject{
    
    public typealias Subscription = (T) -> Void
    private var subscriptions: [Int: Subscription] = [:]
    
    
    public var value: T { didSet{ publish() } }
    
    public init(_ value: T ){
        self.value = value
    }
    
    public func add<T: Subscriber>( subscriber: T, _ subscription: @escaping Subscription){
        subscriptions[subscriber.hashValue] = subscription
        subscriber.onNewSubscription {
            self.subscriptions.removeValue(forKey: subscriber.hashValue)
        }
        publish()
    }
    
    public func remove<T: Subscriber>(subscriber: T){
        let key = subscriber.hashValue
        guard subscriptions[key] != nil else { return }
        subscriptions.removeValue(forKey: key)
    }
    
    public func removeAllSubscriptions(){
        subscriptions = [:]
    }
    
    public func publish(){
        subscriptions.forEach{
            //print("Publish \(value)")
            $0.value(value)
        }
    }
}

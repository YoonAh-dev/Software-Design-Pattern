//
//  Bindable.swift
//  Two-Way-Binding-MVVM
//
//  Created by SHIN YOON AH on 2023/06/06.
//

import Foundation

final class Bindable<BindingType> {

    private var observers = [(BindingType) -> Void]()

    private var value: BindingType?

    init(value: BindingType? = nil) {
        self.value = value
    }

    func bind<Object: AnyObject, T>(
        _ sourceKeyPath: KeyPath<BindingType, T>,
        to anyObject: Object,
        _ objectKeyPath: ReferenceWritableKeyPath<Object, T?>
    ) {
        self.addObserver(for: anyObject) { object, observed in
            let value = observed[keyPath: sourceKeyPath]
            anyObject[keyPath: objectKeyPath] = value
        }
    }

    private func addObserver<T: AnyObject>(
        for object: T,
        completion: @escaping (T, BindingType) -> Void
    ) {
        self.value.map { completion(object, $0) }
        self.observers.append { [weak object] value in
            guard let object else { return }
            completion(object, value)
        }
    }
    
}

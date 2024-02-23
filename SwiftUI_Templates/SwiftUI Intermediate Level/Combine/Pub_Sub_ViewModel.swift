//
//  Pub_Sub_ViewModel.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 12.03.23.
//

import Foundation
import Combine

final class Pub_Sub_ViewModel: ObservableObject {
    
    @Published var count:           Int = 0
    @Published var textCount:       Int = 0
    @Published var textFiledText:   String = ""
    @Published var textIsValid:     Bool = false
    @Published var showButton:      Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        print("INITIALIZED ✅")
        setupTimer()
        addTextFiledSubscriber()
        addButtonSubscriber()
    }
    
    private func setupTimer() {
        Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let _ = self else { return }
                self?.count += 1
            }
            .store(in: &cancellables)
    }
    
    //MARK: TextField Subscriber
    private func addTextFiledSubscriber() {
        $textFiledText
            .map { [unowned self] (text) -> Bool in
                textCount = text.count
                return text.count > 3
            }
        ///.assign(to: \.textIsValid, on: self)
        ///BEST PRACTICE NEXT
            .sink(receiveValue: { [unowned self] isValid in
                textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    //MARK: Button Subscriber
    private func addButtonSubscriber() {
        $textIsValid
            .combineLatest($textCount)
            .sink { [unowned self] (isValid, counter) in
                showButton = (isValid && counter >= 10) ? true : false
            }
            .store(in: &cancellables)
    }
    
    /**
     public func invalidate() {
     cancellable?.cancel()
     cancellable = nil
     print("[<<] invalidated")
     }
     */
    
    deinit {
        print("VM is deinited!")
    }
}

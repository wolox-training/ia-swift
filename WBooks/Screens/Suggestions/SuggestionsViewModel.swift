//
//  SuggestionsViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 18/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import ReactiveSwift
import ReactiveCocoa

class SuggestionsViewModel {
    let isFormComplete = MutableProperty<Bool>(false)
    
    func bindFormInputs(bookName: MutableProperty<Bool>,
                        bookAuthor: MutableProperty<Bool>,
                        bookYear: MutableProperty<Bool>,
                        bookTopic: MutableProperty<Bool>,
                        bookDescription: MutableProperty<Bool>) {
        let s1: Signal<Bool, Never> = bookName.signal.map { $0 }
        let s2: Signal<Bool, Never> = bookAuthor.signal.map { $0 }
        let s3: Signal<Bool, Never> = bookYear.signal.map { $0 }
        let s4: Signal<Bool, Never> = bookTopic.signal.map { $0 }
        let s5: Signal<Bool, Never> = bookDescription.signal.map { $0 }
        
        let combination = Signal<Bool, Never>.combineLatest(s1, s2, s3, s4, s5)
        print(combination)
        combination.observeValues { (arg) in
            let (name, author, year, topic, desc) =  arg
            self.isFormComplete.value = name && author && year && topic && desc
        }
    }
}

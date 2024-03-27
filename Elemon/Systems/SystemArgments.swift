//
//  SystemArgments.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/28.
//

import Foundation

struct SystemArgmentsModel {
    
    // EasyStatus.swift
    var openStatus: Bool = false
    var isButtonEnabled: Bool = false
}

class SystemArgmentsViewModel: ObservableObject {
    @Published var sysArgModel = SystemArgmentsModel()
}

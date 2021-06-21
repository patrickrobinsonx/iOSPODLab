//
//  Client.swift
//  MyForo
//
//  Created by Patrick Robinson on 19/6/21.
//

import Foundation


class  Client:NetworkGeneric{
    var session: URLSession
    init(session:URLSession) {
        self.session = session
    }
}

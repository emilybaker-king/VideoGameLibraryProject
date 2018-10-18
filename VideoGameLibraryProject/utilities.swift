//
//  utilities.swift
//  VideoGameLibraryProject
//
//  Created by Emily Baker-King on 10/18/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import Foundation

func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    
    //dateFormatter.dataStyle = .medium This will allow you to set different defauly data styles
    
    formatter.dateFormat = "MM/dd/yyyy"
    
    let formattedString = formatter.string(from: date)
    
    return formattedString
}

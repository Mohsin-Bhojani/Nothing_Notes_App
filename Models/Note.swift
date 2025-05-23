//  Note.swift
//  Notes
//
//  Created by Abbas on 23/05/2025.

import Foundation
import UIKit

struct Note: Identifiable, Codable {
    let id: UUID
    var title: String
    var content: String
    var category: String
    var imageData: Data? // Stores image as binary data
    var createdAt: Date

    // Optional computed property to access the image directly
    var image: UIImage? {
        guard let data = imageData else { return nil }
        return UIImage(data: data)
    }
}

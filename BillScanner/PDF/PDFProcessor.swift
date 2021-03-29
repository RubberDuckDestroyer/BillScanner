//
//  PDFProcessor.swift
//  BillScanner
//
//  Created by Hitarth Asrani on 15/02/21.
//

import Foundation
import VisionKit
import PDFKit

class PDFProcessor {
    
    var processor: PDFDocument
    private var size: Int
    private var title = ""
    
    let EXTENSION = ".pdf"
    
    init() {
        self.processor = PDFDocument()
        self.size = 0
    }
    
    deinit {
        // On deinit, clear processor and start a new one
        self.processor = PDFDocument()
        self.size = 0
        self.title = ""
    }
    
    func setSize(_ toSize: Int) {
        if toSize > 0 {
            self.size = toSize
        }
    }
    
    func setTitle(_ newTitle: String) {
        if newTitle.elementsEqual("") == false {
            self.title = newTitle
        }
    }
    
    func add(image: UIImage, index: Int) {
        
        if let page = PDFPage(image: image) {
            self.processor.insert(page, at: index)
        }
    }
    
    func savePDFToDocuments() {
        if self.size > 0, self.title.elementsEqual("") == false, let data = processor.dataRepresentation(), let documentDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let docUrl = documentDir.appendingPathComponent(self.title + self.EXTENSION)
            
            do {
                try data.write(to: docUrl)
            } catch {
                // Could not save file
                print("Could not save file")
            }
        } else {
            print("There was an error while saving the files...")
        }
    }
    
    
}

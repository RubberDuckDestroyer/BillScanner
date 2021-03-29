//
//  DocumentViewController.swift
//  BillScanner
//
//  Created by Hitarth Asrani on 14/02/21.
//

import Foundation
import SwiftUI
import UIKit
import VisionKit
import PDFKit


struct DocumentViewController: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presenter: Binding<PresentationMode>
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentViewController = VNDocumentCameraViewController()
        documentViewController.delegate = context.coordinator
        
        return documentViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        
    }
    
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        
        var parent: DocumentViewController
        var pdf: PDFProcessor
        var title: String
        
        init(_ documentViewController: DocumentViewController) {
            self.parent = documentViewController
            self.pdf = PDFProcessor()
            self.title = ""
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            print("Cancelled scanning")
            // MARK: TODO Handle notification
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print("Scanning failed")
            // MARK: TODO handle fail logic
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            
            self.title = scan.title
            
            if self.title.elementsEqual("") {
                // Prompt the user for a title and save
                self.title = "Scan-\(Date())"
            }
            
            self.pdf.setTitle(self.title)
            self.pdf.setSize(scan.pageCount)
            
            for page in 0..<scan.pageCount {
                pdf.add(image: scan.imageOfPage(at: page), index: page)
            }
            
            pdf.savePDFToDocuments()
            self.parent.presenter.wrappedValue.dismiss()
            
        }
    }
}

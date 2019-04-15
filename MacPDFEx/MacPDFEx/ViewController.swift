//
//  ViewController.swift
//  MacPDFEx
//
//  Created by Joshua Crane on 4/15/19.
//  Copyright © 2019 Joshua Crane. All rights reserved.
//

import Cocoa
import Quartz.PDFKit

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //create PDFView, add it to controller's View
        let pdfView = PDFView(frame: self.view.bounds)
        //Center Document on Gray Background
        pdfView.autoresizingMask = [.width, .height]
        self.view.addSubview(pdfView)
        //allows drag and drop of PDF files
        pdfView.allowsDragging = true
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


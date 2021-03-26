//
//  QRCodeReaderViewControllerDelegate.swift
//  Activize
//
//  Created by Karan Saini on 3/23/21.
//

import Foundation
import AVFoundation
import QRCodeReader
import UIKit
import QuickLook



class FindObjectsViewController: UIViewController, QRCodeReaderViewControllerDelegate, QLPreviewControllerDataSource {
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = false
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()

    @IBAction func scanAction(_ sender: AnyObject) {
      // Retrieve the QRCode content
      // By using the delegate pattern
        
      //The following code is for generating a URL

        

      readerVC.delegate = self

      // Or by using the closure pattern
      readerVC.completionBlock = { (result: QRCodeReaderResult?) in
        let previewController = QLPreviewController()
        previewController.dataSource = self
        self.readerVC.dismiss(animated: true) {
            self.present(previewController, animated: true)
        }
      }

      // Presents the readerVC as modal form sheet
      readerVC.modalPresentationStyle = .formSheet
     
      present(readerVC, animated: true, completion: nil)
    }
    
//Instance of QLPreviewController ------------- added by Sudharsan Gopalakrishnan 3/25-26/21

    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1// 1 pdf/photo file so far
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        guard let url = Bundle.main.url(forResource: "CAD_Image", withExtension: "png") else {
            fatalError("Could not load CAD_Image.png")
        }

        return url as QLPreviewItem
    }
//-------------------------------
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
      reader.stopScanning()

      dismiss(animated: true, completion: nil)
    }

    //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
    //By pressing on the switch camera button
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        let cameraName = newCaptureDevice.device.localizedName
        print("Switching capture to: \(cameraName)")
    }

    func readerDidCancel(_ reader: QRCodeReaderViewController) {
      reader.stopScanning()

      dismiss(animated: true, completion: nil)
    }
}






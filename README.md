# BillScanner (name not final)

## Problem
  I find it quite terrifying to maintain and keep track of all my receipts/bills while making purchases. They tend to fade away after a while, tear apart or they get lost and filing them does not help. 
  
  iOS 13 added the [VisionKit](https://developer.apple.com/documentation/visionkit) framework which allows me to use the iOS camera to scan documents which can be helpful to maintain a repository of scans for personal use.

## Solution and Current Goals
  * This app aims to initially help me learn SwiftUI and use the VisionKit framework along with AWS Services to allow users to Sign Up and Log in to the App. 
  
  * Additionaly, a user will be able to scan and upload a PDF file of a receipt to an *AWS S3* bucket created for them when they sign up. Perhaps some metadata about the scan can also be added to the bucket.

  * AWS services like *Cognito* will be used to create user pools, identity pools and authorise users to access their scans.

  * A user must also be able to view a list of scans, sorted by either title or date of creation (supplied when uploading files).

## Future goals
  * Store and process data according to GDPR/International Privacy Laws.
  * Add support to use Machine Learning either on AWS or on iOS using CoreML/Vision frameworks for OCR purposes.
  * View OCR data processed.
  * Add visualisation options for the data.

## Main Goal
  * Personal Usage - Scan and forget about receipts until I require them. Use receipt data to track spending.

## Technologies
- SwiftUI for frontend/design.
- AWS Amplify for backend.
- Swift for iOS
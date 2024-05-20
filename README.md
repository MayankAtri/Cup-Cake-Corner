CupcakeCorner is an iOS application designed to make ordering cupcakes easy and convenient.
The app allows users to choose from a variety of cupcake flavors, customize their orders, and have them delivered to their desired location. 
This project demonstrates the use of multiple screens, form validation, and sending/receiving data over the internet using Swift and SwiftUI.

Features

Multi-screen Navigation: Users can navigate through different screens to select cupcake options and review their orders.
Form Handling: The app uses forms for taking user inputs, such as delivery details and cupcake preferences.
Network Communication: Orders are sent to and received from an online server.
Data Encoding/Decoding: Utilizes Codable for safe and easy encoding and decoding of data.
Form Validation: Ensures that all user inputs are validated before an order is placed.
Getting Started

Prerequisites
macOS with the latest version of Xcode installed.
Basic understanding of Swift and SwiftUI.
Installation
Clone the repository:
bash
Copy code
git clone https://github.com/yourusername/CupcakeCorner.git](https://github.com/MayankAtri/Cup-Cake-Corner.git
Open the project in Xcode:
bash
Copy code
cd CupcakeCorner
open CupcakeCorner.xcodeproj
Run the app:
Select the desired simulator or your device from the Xcode toolbar.
Click the "Run" button (or press Cmd + R).
Project Structure

Models: Contains the data structures for handling cupcake orders.
Views: SwiftUI views that make up the UI of the application.
ViewModels: Manages the data flow and business logic between models and views.
Services: Handles network communication and data validation.
Usage

Launch the app.
Navigate through the screens:
Select cupcake flavors.
Customize the order with additional options.
Enter delivery details.
Review and place the order.
Receive confirmation once the order is successfully placed.
Code Highlights

Codable: Used extensively to encode and decode order data.
Form Validation: Ensures user input is correct before allowing order submission.
Network Requests: Demonstrates how to send and receive data from a server using URLSession.

# Shopping Website Frontend (Swift)

## Overview
This repository contains the source code for the iOS front end of a shopping website built using Swift. The project provides a seamless and visually appealing user interface for browsing products, managing carts, and completing purchases. The app communicates with a backend Node.js server that fetches data from a SQL Server database.

## Features
- **Product Browsing**: View a list of available products with images, descriptions, and prices.
- **Search & Filters**: Search for products and filter them based on categories.
- **Shopping Cart**: Add, remove, and update products in the cart.
- **Order Notification**: Receive email notification for successfully placed orders.
- **Smooth UI/UX**: Intuitive and responsive design optimized for mobile devices.

## Tech Stack
- **Language**: Swift
- **Framework**: SwiftUI
- **Persistence**: CoreData
- **Backend**: Node.js (Express.js)
- **Database**: SQL Server

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/shopping-frontend-swift.git
   cd shopping-frontend-swift
   ```
2. Open the project in Xcode:
   ```sh
   open ShoppingApp.xcodeproj
   ```
3. Install dependencies (if applicable):
   ```sh
   pod install  # If using CocoaPods
   ```
4. Build and run the app on a simulator or physical device.

## Configuration
- Set up the API endpoint in `Config.swift`.
- Configure authentication keys if required.
- Modify UI themes in `Theme.swift`.

## API Integration
This frontend communicates with a Node.js backend server that interacts with a SQL Server database. Ensure that:
- The backend is running and accessible.
- The API endpoints are correctly configured in `Config.swift`.
- Proper authentication mechanisms are implemented for secure communication.

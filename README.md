# BabyShopHub Documentation

Welcome to the BabyShopHub documentation. This guide is intended for both developers and end-users, detailing the app's architecture, setup, and usage. BabyShopHub is a mobile application designed to simplify the shopping experience for parents and caregivers by offering a wide range of infant products. The app leverages **Flutter** for its frontend and **Supabase** for backend services and database management.

---

## Table of Contents

1. [Introduction](#introduction)
2. [System Overview](#system-overview)
3. [Functional Requirements](#functional-requirements)
4. [Technology Stack](#technology-stack)
5. [Developer Documentation](#developer-documentation)
   - [Architecture Overview](#architecture-overview)
   - [Project Setup](#project-setup)
   - [Code Structure](#code-structure)
   - [Authentication & User Management](#authentication--user-management)
   - [Product Browsing & Search](#product-browsing--search)
   - [Shopping Cart & Checkout](#shopping-cart--checkout)
   - [Order History & Tracking](#order-history--tracking)
   - [Feedback and Support](#feedback-and-support)
6. [User Guide](#user-guide)
   - [Getting Started](#getting-started)
   - [User Registration & Login](#user-registration--login)
   - [Browsing Products](#browsing-products)
   - [Managing Your Shopping Cart](#managing-your-shopping-cart)
   - [Checkout Process](#checkout-process)
   - [Order History & Tracking](#order-history--tracking-user)
   - [Feedback and Support](#feedback-and-support-user)
7. [Deployment & Maintenance](#deployment--maintenance)
8. [Future Enhancements](#future-enhancements)
9. [FAQ](#faq)
10. [Contact Information](#contact-information)

---

## Introduction

BabyShopHub was conceived to address the growing demand for a user-friendly, dedicated platform for shopping infant products. It provides a comprehensive solution that includes secure user registration, product browsing, shopping cart management, checkout, order tracking, and support. This documentation outlines both the developer and user perspectives of the app.

---

## System Overview

BabyShopHub is a mobile-first application built with:
- **Frontend:** Flutter
- **Backend & Database:** Supabase (leveraging its PostgreSQL database and authentication services)

The app offers a seamless shopping experience tailored specifically for parents and caregivers, with emphasis on security, reliability, and usability.

---

## Functional Requirements

- **User Registration and Authentication**
  - **User Registration:** Account creation using name, email, and password.
  - **User Authentication:** Secure login ensuring only registered users can access their accounts.
  - **User Profile:** Manage personal information, delivery addresses, and payment methods.

- **Product Browsing and Search**
  - **Product Categories:** Display diverse categories (diapers, baby food, clothing, toys, etc.).
  - **Product Search:** Find products by name, brand, or category.
  - **Product Details:** View detailed information such as images, descriptions, and prices.

- **Shopping Cart and Checkout**
  - **Add to Cart:** Option to add products for later purchase.
  - **Cart Management:** Update quantities, remove items, and review cart contents.
  - **Checkout Process:** A streamlined checkout including order review, dummy payment processing, and order confirmation.

- **Order History and Tracking**
  - **Order History:** Display past orders with details.
  - **Order Tracking:** Real-time tracking of delivery status.

- **Feedback and Support**
  - **User Support:** In-app support for assistance, issue reporting, and feedback.

> **Note:** This documentation excludes details regarding Ratings & Reviews and the Admin Panel.

---

## Technology Stack

- **Frontend:** Flutter
- **Backend & Database:** Supabase

---

## Developer Documentation

### Architecture Overview

BabyShopHub is built using a layered architecture:
- **Presentation Layer:** Flutter UI components for an interactive mobile experience.
- **Business Logic Layer:** Handles authentication, product management, cart operations, order processing, and user support.
- **Data Layer:** Utilizes Supabase for secure data storage, real-time data subscriptions, and authentication.

### Project Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/SolomonB127/BabyShopHub.git
   ```
2. **Install Flutter & Dart:**:  Ensure you have the latest version of Flutter installed.
3. **Configure Supabase:** 
        -   Create a Supabase project.
        -   Set up the PostgreSQL database schema.
        -   Configure authentication and real-time subscriptions.
        -   Add Supabase credentials to your Flutter app (usually in an environment configuration file).
4. **Dependencies:**
        - Run flutter pub get to install all necessary dependencies.

### Code Structure
-   **/lib/**
      -   **models/**: Contains data models for users, products, orders, etc.
      -   **screens/**: UI screens including Login, Registration, Product List, Product Details, Cart, Checkout, Order History, and Support.
      -   **services/**: API calls and Supabase integration (authentication, database queries).
      -   **widgets**/: Reusable UI components.

### Authentication & User Management
-   **Authentication:** Utilizes Supabase Auth for user registration and login.
-   **User Profile:** A dedicated screen for updating personal information, managing delivery addresses, and setting payment methods.
-   **Security:** Ensure password encryption and secure token management.

### Product Browsing & Search
-   **Product Categories:** Organized categorically (e.g., diapers, baby food, clothing, toys).
-   **Search Functionality**: Integrated search using Supabase queries to filter products by name, or category.
-   **Product Details Screen:** Displays product images, detailed descriptions, and pricing information.

### Shopping Cart & Checkout
-   **Cart Operations:** Allow users to add items, modify quantities, and remove items.
-   **Checkout Process:**
        -   **Order Review**: Display a summary before finalizing the order.
        -   **Dummy Payment Processing**: Simulate payment processing for order confirmation. 
        -   **Confirmation Screen**: Display order confirmation and details after a successful transaction.

### Order History & Tracking
-   **Order History:** Maintain a log of all past orders with comprehensive details.
-   **Order Tracking:** Real-time tracking powered by Supabase subscriptions to update users on delivery status.

### Feedback and Support
-   **Support System:** In-app form for users to submit queries, report issues, and provide feedback.


### User Guide
## Getting Started
-   **Installation:** Download and install BabyShopHub from your respective app store.
-   **Initial Launch:**  Open the app to view the welcome screen and explore available features.

### User Registration & Login
-   **Creating an Account**:
  -  Navigate to the registration screen.
  -  Enter your name, email, and password.
  -  Complete any email verification steps if prompted.

-   **Logging In**:
  -  Use your registered email and password.
  -  In case of forgotten credentials, utilize the password reset feature.

### Browsing Products
- **Product Categories**: Browse through organized categories such as diapers, baby food, clothing, and toys.
- **Search Bar**: Use the search functionality to quickly locate products by name or brand.
- **Product Details**: Tap on a product to view detailed information including images, descriptions, and pricing.

### Managing Your Shopping Cart
-**Adding Items**: Tap the "Add to Cart" button on product pages to save items for purchase.
-**Viewing Cart:** Access your cart to review all selected items.
- **Editing Cart:** Update quantities or remove items as needed.

### Checkout Process
-**Order Review:** Before confirming, review the complete order summary.
-**Payment Processing:** Proceed with the dummy payment system integrated into the app.
-**Confirmation:** Receive an order confirmation message with a detailed summary of your purchase.

### Order History & Tracking (User)
- **Order History:** Access the Order History section from the main menu to view past orders.
-**Real-Time Tracking:** Check the current status of your orders with real-time updates.
- **Order Details:** Tap on any order to see a comprehensive breakdown of items, status, and tracking information.
### Feedback and Support (User)
-**Accessing Support:** Navigate to the Support section via the main menu.
-**Submitting a Request:** Fill out the support form with your query or feedback.
-**Assistance:** Expect prompt follow-up from the support team for any issues encountered.

### Contact Information
Developer Support Email: support@babyshophub.com
-*Non Existence*

<p>
<img src="https://github.com/user-attachments/assets/04724e09-1e87-4963-8fea-48f530a729e6" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;" width="30%"> 
 <img src="https://github.com/user-attachments/assets/b595b60e-b7bb-4dfd-8c19-cf585d508626" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;" width="30%"> 
 <img src="https://github.com/user-attachments/assets/e1078f4f-8cfe-4350-98cb-73a96242358b" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;"width="30%"> 
  </p>
<p>
<img src="https://github.com/user-attachments/assets/7275cd6d-b9f0-4eea-b690-8edfd7074a81" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;" width="30%"> 
 <img src="https://github.com/user-attachments/assets/4fd2300e-136d-4279-90a1-f7f5477f1808" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;" width="30%"> 
 <img src="https://github.com/user-attachments/assets/d7ea4acb-6b71-40f0-8213-6eb53c1ddeb6" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;"width="30%"> 
  </p>
<p>
<img src="https://github.com/user-attachments/assets/38e1a3a6-8edd-4053-b850-e2b0a9ec6576" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;" width="30%"> 
 <img src="https://github.com/user-attachments/assets/b015a3c1-6bfc-4f41-8b0c-c174b106c966" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;" width="30%"> 
 <img src="https://github.com/user-attachments/assets/4490587d-16c0-42f3-ad69-23143ded9de1" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;"width="30%"> 
  </p>
<p>
<img src="https://github.com/user-attachments/assets/6036459c-c852-434d-bf9f-b1ceb8a21491" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;" width="30%"> 
 <img src="https://github.com/user-attachments/assets/abfd36e7-fae3-405b-8d17-ca2c61ab88fd" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;" width="30%"> 
 <img src="https://github.com/user-attachments/assets/4c30064e-e6ca-48f9-9900-753f8e95d73a" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;"width="30%"> 
  </p>
<p>
<img src="https://github.com/user-attachments/assets/e7dafbc4-2517-4624-8520-5500f152f2fc" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;" width="30%"> 
 <img src="https://github.com/user-attachments/assets/093f3ba1-248d-4745-941c-57cc55711a5d" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;" width="30%"> 
 <img src="https://github.com/user-attachments/assets/0032c7c9-d1d4-40f9-a8ca-d1868688b6bf" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;"width="30%"> 
  </p>
<p>
<img src="https://github.com/user-attachments/assets/f88ded01-1658-4a91-88c9-49e17954ac58" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;" width="30%"> 
 <img src="https://github.com/user-attachments/assets/b9dd82ca-5871-4130-a4d2-a5a6ba782dfa" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;" width="30%"> 
 <img src="https://github.com/user-attachments/assets/0032c7c9-d1d4-40f9-a8ca-d1868688b6bf" alt="Image 1" style="margin-right: 10px; margin-bottom: 10px;"width="30%"> 
  </p>



# Coffee Ordering App


The Coffee Order App allows users to browse and buy different coffee flavors while providing a seamless payment experience through Stripe. Users can also share their favorite coffee flavors with friends using dynamic links. Additionally, the app includes a points-based reward system, where users earn points for purchases and can redeem them for free coffee.



## Features

- **Browse and Buy Coffee**: Users can explore and purchase a variety of coffee flavors.
- **Stripe Payment Integration**: Secure payment handling using Stripe for transactions.
- **Dynamic Linking**: Share coffee flavors with friends via dynamic links.
- **Points System**:
  - Earn 1 point for every $10 spent.
  - Once a user reaches 30 points, they can redeem them for a free coffee.
- **Firebase Backend**: All data is stored and managed via Firebase and Cloud Firestore.
- **GetX State Management**: Efficient handling of state and navigation using GetX.

## Technologies Used



- **Flutter**: Cross-platform mobile app framework.
- **Dart**: Programming language for Flutter.
- **Stripe API**: Payment gateway integration.
- **Firebase**: Backend services, authentication, and Firestore for real-time database.
- **GetX**: State management, routing, and dependency injection.

## Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/coffee-order-app.git
   cd coffee-order-app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**:
   - Set up Firebase for iOS and Android platforms.
   - Add your `google-services.json` and `GoogleService-Info.plist` files for Firebase configuration.

4. **Set up Stripe**:
   - Sign up at [Stripe](https://stripe.com) and get your API keys.
   - Add your Stripe keys in the app's configuration files.

5. **Run the app**:
   ```bash
   flutter run
   ```

## Code Structure

- **lib/controllers/**: Contains GetX controllers for managing business logic, payment, and points system.
- **lib/screens/**: UI screens for browsing, purchasing coffee, and managing points.
- **lib/services/stripe_service.dart**: Manages payment processing using Stripe.
- **lib/services/dynamic_link_service.dart**: Handles dynamic links for sharing coffee flavors.
- **lib/models/**: Data models for coffee products, user points, and more.

## Points System

- **Earn Points**: Users earn 1 point for every $10 spent.
- **Redeem Points**: Once users accumulate 30 points, they can redeem them for one free coffee.
- **Firestore Integration**: Points are stored in the user's Firestore document.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions or feedback, feel free to reach out at [arbabhussain414@gmail.com](arbabhussain414@gmail.com).

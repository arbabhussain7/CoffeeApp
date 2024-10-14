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

For questions or feedback, feel free to reach out at [your-email@example.com].

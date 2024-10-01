import 'package:coffe_app/Views/authentication/controllers/user_controller.dart';
import 'package:coffe_app/Views/cart/controller/cart_controller.dart';
import 'package:coffe_app/Views/dynamicLink/dynamic_links.dart';
import 'package:coffe_app/Views/favorite/controllers/favorite_controller.dart';
import 'package:coffe_app/Views/home/controllers/description_controller.dart';
import 'package:coffe_app/Views/profile/controllers/profile_controller.dart';
import 'package:coffe_app/Views/splash_screen/views/splash_screen.dart';
import 'package:coffe_app/binding/binding_screen.dart';
import 'package:coffe_app/constant/color.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("Some Notification Received  in Background");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DynamicLinks().initDynamicLink();
  Get.put(UserController());
  Get.put(FavoriteController());
  Get.put(CartController());
  Get.put(DescriptionController());
  Get.put(ProfileController());

  Stripe.publishableKey =
      "pk_test_51Q1nGrFHugyQIn2Jo2F4AJUICJQAYwhiZtrZZSab0MBvLUAIChcaTt8bvfQZTL0sqBpoUnq6evjsTeslbzWpwmBb00lQXUvOxN";

  // await PushNotificationServices.init();
  // await PushNotificationServices.localNotiInit();
  // FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    checkNotificationPermission();
    super.initState();
  }

  void checkNotificationPermission() async {
    var settings = await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      setupInteractedMessage();
      initNotificationChannel();
      setupNotificationChannel();
    }
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    FirebaseMessaging.onMessage.listen(_handleMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      AppleNotification? iOS = message.notification?.apple;
    });
  }

  void _handleMessage(RemoteMessage message) {
    print("message: $message");

    // if (message.data['type'] == 'chat') {}
  }

  void initNotificationChannel() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();
    const DarwinInitializationSettings initializationSettingsMacOS =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  void setupNotificationChannel() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const settingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final settingsIOS = DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) {});
    await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(android: settingsAndroid, iOS: settingsIOS));

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      AppleNotification? iOS = message.notification?.apple;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    icon: android.smallIcon,
                    enableVibration: true,
                    // importance: Importance.max,
                    priority: Priority.max,
                    // ongoing: false,
                    // autoCancel: true,
                    // visibility: NotificationVisibility.public,
                    enableLights: true
                    // other properties...
                    ),
                iOS: DarwinNotificationDetails(
                  sound: iOS?.sound?.name,
                  presentAlert: true,
                  presentBadge: true,
                  presentSound: true,
                )));

        // showOngoingNotification(flutterLocalNotificationsPlugin, title: notification.title ?? "", body: notification.body ?? "");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialBinding: BindingScreen(),
            title: 'Coffee App',
            theme: ThemeData(
              scaffoldBackgroundColor: whiteColor,
              primaryColor: brownColor,
              progressIndicatorTheme: ProgressIndicatorThemeData(
                color: brownColor,
                circularTrackColor: brownColor,
              ),
              textSelectionTheme: TextSelectionThemeData(
                  cursorColor: brownColor,
                  selectionColor: brownColor.withOpacity(0.5),
                  selectionHandleColor: brownColor),
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          );
        },
        child: const SplashScreen());
  }
}

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinks {
  Future<String> createLink(String refCode) async {
    final String url = "https://c.e.c?ref=$refCode";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
        androidParameters: const AndroidParameters(
          packageName: 'c.e.c',
          minimumVersion: 0,
        ),
        iosParameters:
            const IOSParameters(bundleId: "c.e.c", minimumVersion: "0"),
        link: Uri.parse(url),
        uriPrefix: " https://coffeapp.page.link ");

    final FirebaseDynamicLinks links = await FirebaseDynamicLinks.instance;
    final refLink = await links.buildShortLink(parameters);
    return refLink.shortUrl.toString();
  }

  ///Intialized dynamic Link
}

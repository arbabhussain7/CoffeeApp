import 'package:coffe_app/Views/home/views/description_screen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';

class DynamicLinks {
  Future<String> createLink(String refCode) async {
    final String url = "https://c.e.c?ref=$refCode";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      androidParameters: const AndroidParameters(
        packageName: 'c.e.c',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: "c.e.c",
        minimumVersion: "0",
      ),
      link: Uri.parse(url),
      uriPrefix: "https://coffeapp.page.link",
    );
    print(refCode);
    print("arbab");
    final FirebaseDynamicLinks links = FirebaseDynamicLinks.instance;
    final ShortDynamicLink refLink = await links.buildShortLink(parameters);
    return refLink.shortUrl.toString();
  }

  void initDynamicLink() async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      final Uri refLink = initialLink.link;
      var id = refLink.toString().split('=').last;
      Get.to(() => DescriptionScreen(), arguments: [id]);
    }

    print(initialLink);
    FirebaseDynamicLinks.instance.onLink
        .listen((PendingDynamicLinkData? dynamicLinkData) {
      if (dynamicLinkData != null) {
        final Uri refLink = dynamicLinkData.link;
        var id = refLink.toString().split('=').last;
        Get.to(() => DescriptionScreen(), arguments: [id]);
      }
    }).onError((error) {
      print('Error occurred while handling dynamic link: $error');
    });
  }
}

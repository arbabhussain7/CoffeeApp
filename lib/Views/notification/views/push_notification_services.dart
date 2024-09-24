import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class PushNotificationServices {
  static Future<String> getAccesssToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "coffeapp-c7c83",
      "private_key_id": "b033629f1db7dbed0543eb51e6d114c18e045965",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC0LkSwJttPihOY\nRaHs4WX6bUrcO9iwiQeBoJx0hHoXWVMPYlIPrxSa1tL9pCn2uVgnUAF2YKtpvuoS\n4N67ki84e5KQu+Uzm03LjQzgLQ9dXmtGKmuOamyhmLUGJqwWa224rQtlLeyhjqOU\naOvoDvSBvTpR6Wr5xnNh53DnUx66yHsVFctf4y/WQxxcTC/PDcVLe8cg0omAz+3V\nzgQsFxFHe/F5irCrh5ZPI7uvukYOdJxLitwfKZ8Ju11mLsFFPqgJlK0fxd4VGzB3\niFts1nv68rqKE+Sl1LLHNPdYDtTAwlwXlJZhNWrzCsFHLFyx7Sd0e4b5HOeCVsQZ\nYCuK5c5FAgMBAAECggEAGFznOcBPSC593smPjwWdMeLkS+olrx0gMDVk4lZlYdHY\nqsxbFzbPvO4OQnCXof5Gvq4RPI3ur5I6eUoBo/AsxWDkHQDjCXrW5o6QbqF5IeFZ\n9PdYar3WKXWKCKZi/3cQM3fmggxXIjM0yCT1vP+ErSRGhfvfVJ2yTUsrl4PENHIb\nqtg/vlhzhL+f9SVNYN0wCBoQnuLyf7DlPFX2XkBdj4PwPtwbLYecko9buv3R0/s4\n6lYiUQgvzLsgsOXfiNYHzuA+IdWD9iZKDBI0gV9L+Q6eDUCe955pm90B3uQUp2BO\ni0xCpxowIt4ebV3mWy+HrfMtBosSO8BpOhte8M3LcQKBgQD0ueFAqFkYJbYTDRQe\nJccDP5ToY69/b+gE9D2dgKZbarqTFNnOdo9ImnPPUVfkbgL2Bwfk3giPixk4v4Bw\n4vjeZ70EzpxJqV0VC8n5hpK5Yfg0aFvjCgipFx+RgomjXoK5+FGg5I8rpOWbzlp8\nPgBon9C58ypo+s5Aw1k6oS9erQKBgQC8ezATcigl9H5l63jhe+d/3irwy70Bstxb\nMDG50g7iGEf75u1KGjImnTAf1rwHeElo+lZt0xc+PU2O8o5ZqmgW04tj59ffg1ol\nO5QSfuuCOP4EMVQLQCZszE4HJzv475bWSusjQ/lIKHscj2McHuD6IEJs8kzHZIP+\nFb8I8YyY+QKBgDtpHLv7opVwIkGBvU6MUUICn33DJYnEewko2gRwhPJQeLbYKwAq\nXCJ+DHtZ/gJgiqt7jXkMRfvDAv55zw6Yq14ixQpzthFT4lsHn6LJ/riuhfkDFLuL\nZgrWqD1E+XEFsqq/E+IBWph30Z3/fIwI6UR898kMtVEDAitKwVCwbLWJAoGABepz\n6thVbEONSBOo+qLR9FB71oz+hLQheHc9yFBQiUYr1Ds+TWofEtkyLn2l7zIWU8Yv\nuki63Qg9i/QPBb90furq4BrhyrErviltj1sOd0rkpisKMUQ1MIsFE/JmTnzuphE5\n6iRzCZHDs3TIrpRFiXRDwXmlcUi1X9883MIAILkCgYBVGosuSsAxbNzfqU4/BHMz\nWwScKSO0/Ba9IJUaY0gY5w/dvFXE/ZQowtOyuUPBgQaU0w06DSXWCMcnwzLGAsx9\npZowuwjort37eizty2uj2gMNSENnD6tUSF5POe9K/ateT3qtbkw0tCz8RdrUKMZ1\ntoeJ1xeklCoU2fqSfCxZ8w==\n-----END PRIVATE KEY-----\n",
      "client_email":
          "flutter-coffee-app@coffeapp-c7c83.iam.gserviceaccount.com",
      "client_id": "100432848139375956951",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/flutter-coffee-app%40coffeapp-c7c83.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];
    http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

//get the accesss Token
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            client);
    client.close();
    return credentials.accessToken.data;
  }

  static sendNotificationToSelectedDriver(
      String deviceToken, BuildContext context, String tripID) async {
    String dropOffDestinationAddress = "Salted caramel Lattle";

    String pickUpAddress = "Cold Brew and Slightly ";

    final String serverAccessTokenKey = await getAccesssToken();
    print('token: ' + serverAccessTokenKey);
    String endpointFirebaseCloudMessaging =
        "https://fcm.googleapis.com/v1/projects/coffeapp-c7c83/messages:send";
    final Map<String, dynamic> message = {
      "message": {
        'token': deviceToken,
        'notification': {
          'title': "NET TRIP REQUEST from Arbab ",
          'body':
              "PickUp Location : $pickUpAddress \n Dropoff Location: $dropOffDestinationAddress"
        },
        'data': {
          'tripID': tripID,
        }
      }
    };
    final http.Response response = await http.post(
      Uri.parse(endpointFirebaseCloudMessaging),
      headers: <String, String>{
        'content-Type': 'appication/json',
        'Authorization': 'Bearer $serverAccessTokenKey'
      },
      body: jsonEncode(message),
    );
    if (response.statusCode == 200) {
      print("Notification Send Succesfully ");
    } else {
      print("Failed Notification${response.body}");
    }
  }
}

import 'dart:async';

import 'package:flutter/services.dart';

class FlutterIsAwesome {
  static const MethodChannel _channel = MethodChannel('flutter_is_awesome');

  static Future<Map> getAContact() async {
    final Map contact = await _channel.invokeMethod('getAContact');
    return contact;
  }
}

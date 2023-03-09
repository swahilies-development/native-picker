import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_is_awesome_platform_interface.dart';

/// An implementation of [FlutterIsAwesomePlatform] that uses method channels.
class MethodChannelFlutterIsAwesome extends FlutterIsAwesomePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_is_awesome');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

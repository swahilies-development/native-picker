import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_is_awesome_method_channel.dart';

abstract class FlutterIsAwesomePlatform extends PlatformInterface {
  /// Constructs a FlutterIsAwesomePlatform.
  FlutterIsAwesomePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterIsAwesomePlatform _instance = MethodChannelFlutterIsAwesome();

  /// The default instance of [FlutterIsAwesomePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterIsAwesome].
  static FlutterIsAwesomePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterIsAwesomePlatform] when
  /// they register themselves.
  static set instance(FlutterIsAwesomePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

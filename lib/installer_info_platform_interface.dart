import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'installer_info_method_channel.dart';

abstract class InstallerInfoPlatform extends PlatformInterface {
  InstallerInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static InstallerInfoPlatform _instance = MethodChannelInstallerInfo();

  static InstallerInfoPlatform get instance => _instance;

  static set instance(InstallerInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getInstallerName() {
    throw UnimplementedError('getInstallerName() has not been implemented.');
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'installer_info_platform_interface.dart';

class MethodChannelInstallerInfo extends InstallerInfoPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('com.caiopo.installer_info');

  @override
  Future<String?> getInstallerName() async {
    final installerName =
        await methodChannel.invokeMethod<String>('getInstallerInfo');
    return installerName;
  }
}

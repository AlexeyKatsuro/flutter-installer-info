import 'package:flutter_test/flutter_test.dart';
import 'package:installer_info/installer_info.dart';
import 'package:installer_info/installer_info_platform_interface.dart';
import 'package:installer_info/installer_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInstallerInfoPlatform
    with MockPlatformInterfaceMixin
    implements InstallerInfoPlatform {
  @override
  Future<String?> getInstallerName() => Future.value('com.android.vending');
}

void main() {
  final InstallerInfoPlatform initialPlatform = InstallerInfoPlatform.instance;

  test('$MethodChannelInstallerInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInstallerInfo>());
  });

  test('getInstallerInfo', () async {
    final plugin = InstallerInfoPlugin();
    final fakePlatform = MockInstallerInfoPlatform();
    InstallerInfoPlatform.instance = fakePlatform;

    final installerInfo = await plugin.getInstallerInfo();
    expect(installerInfo!.installerName, 'com.android.vending');
    expect(installerInfo.installer, Installer.googlePlay);
  });
}

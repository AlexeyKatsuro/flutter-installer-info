import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:installer_info/installer_info_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final platform = MethodChannelInstallerInfo();
  const channel = MethodChannel('com.caiopo.installer_info');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return 'com.android.vending';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getInstallerName', () async {
    expect(await platform.getInstallerName(), 'com.android.vending');
  });
}

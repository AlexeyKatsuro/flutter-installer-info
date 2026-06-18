import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:installer_info/installer_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InstallerInfo? installerInfo;
  String? error;
  final _installerInfoPlugin = InstallerInfoPlugin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    InstallerInfo? installerInfo;
    try {
      installerInfo = await _installerInfoPlugin.getInstallerInfo();
    } on PlatformException catch (e) {
      setState(() => error = e.message);
    }

    if (!mounted) return;

    setState(() => this.installerInfo = installerInfo);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Installer Info'),
        ),
        body: Center(
          child: error != null
              ? Text(error!, textAlign: TextAlign.center)
              : Text(
                  'Installed by:\n${installerInfo?.installer}\n${installerInfo?.installerName}',
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}

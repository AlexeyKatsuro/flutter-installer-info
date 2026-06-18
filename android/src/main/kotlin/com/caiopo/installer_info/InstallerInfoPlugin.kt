package com.caiopo.installer_info

import android.content.Context
import android.content.pm.InstallSourceInfo
import android.os.Build
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class InstallerInfoPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private var context: Context? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.caiopo.installer_info")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getInstallerInfo") {
            val installerName = context?.run { getInstallerPackageName(this) }
            result.success(installerName)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = null
        channel.setMethodCallHandler(null)
    }

    private fun getInstallerPackageName(ctx: Context): String? {
        try {
            val packageName = ctx.packageName
            val pm = ctx.packageManager
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                val info: InstallSourceInfo = pm.getInstallSourceInfo(packageName)
                return info.installingPackageName
            }
            return pm.getInstallerPackageName(packageName)
        } catch (e: Exception) {
            return null
        }
    }
}

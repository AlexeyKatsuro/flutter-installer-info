package com.caiopo.installer_info

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.mockito.Mockito
import kotlin.test.Test

internal class InstallerInfoPluginTest {
    @Test
    fun onMethodCall_getInstallerInfo_withoutContext_returnsNull() {
        val plugin = InstallerInfoPlugin()

        val call = MethodCall("getInstallerInfo", null)
        val mockResult: MethodChannel.Result = Mockito.mock(MethodChannel.Result::class.java)
        plugin.onMethodCall(call, mockResult)

        Mockito.verify(mockResult).success(null)
    }

    @Test
    fun onMethodCall_unknownMethod_returnsNotImplemented() {
        val plugin = InstallerInfoPlugin()

        val call = MethodCall("unknownMethod", null)
        val mockResult: MethodChannel.Result = Mockito.mock(MethodChannel.Result::class.java)
        plugin.onMethodCall(call, mockResult)

        Mockito.verify(mockResult).notImplemented()
    }
}

package org.example.xxread

import android.content.Intent
import android.content.IntentFilter
import android.graphics.Color
import android.os.BatteryManager
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.KeyEvent
import android.view.View
import android.view.WindowInsets
import android.view.WindowInsetsController
import android.view.WindowManager
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    companion object {
        private const val FULLSCREEN_CHANNEL = "org.example.xxread/fullscreen"
        private const val READER_KEYS_CHANNEL = "org.example.xxread/reader_keys"
        private const val READER_STATUS_CHANNEL = "org.example.xxread/reader_status"
    }

    private var readerKeysChannel: MethodChannel? = null

    @Volatile
    private var volumePagingEnabled = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        WindowCompat.setDecorFitsSystemWindows(window, false)
        configureTransparentSystemBars()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger

        MethodChannel(messenger, FULLSCREEN_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "hideSystemUI" -> {
                    hideSystemUI()
                    result.success(null)
                }

                "showSystemUI" -> {
                    showSystemUI()
                    result.success(null)
                }

                "showReaderStatusBar" -> {
                    showReaderStatusBar()
                    result.success(null)
                }

                "setPowerSavingMode" -> {
                    setPowerSavingMode(call.argument<Boolean>("enabled") ?: false)
                    result.success(null)
                }

                "setKeepScreenOn" -> {
                    setKeepScreenOn(call.argument<Boolean>("enabled") ?: false)
                    result.success(null)
                }

                else -> result.notImplemented()
            }
        }

        readerKeysChannel = MethodChannel(messenger, READER_KEYS_CHANNEL).apply {
            setMethodCallHandler { call, result ->
                when (call.method) {
                    "setVolumePagingEnabled" -> {
                        volumePagingEnabled = call.argument<Boolean>("enabled") ?: false
                        result.success(null)
                    }

                    else -> result.notImplemented()
                }
            }
        }

        MethodChannel(messenger, READER_STATUS_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getBatteryStatus" -> result.success(readBatteryStatus())
                else -> result.notImplemented()
            }
        }
    }

    override fun dispatchKeyEvent(event: KeyEvent): Boolean {
        if (
            volumePagingEnabled &&
            (event.keyCode == KeyEvent.KEYCODE_VOLUME_DOWN ||
                event.keyCode == KeyEvent.KEYCODE_VOLUME_UP)
        ) {
            if (event.action == KeyEvent.ACTION_DOWN && event.repeatCount == 0) {
                val direction = if (event.keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) {
                    "next"
                } else {
                    "previous"
                }
                try {
                    readerKeysChannel?.invokeMethod(
                        "onVolumeKey",
                        mapOf("direction" to direction),
                    )
                } catch (error: RuntimeException) {
                    Log.w("xxread", "Unable to dispatch reader volume key", error)
                }
            }
            return true
        }
        return super.dispatchKeyEvent(event)
    }

    override fun onDestroy() {
        volumePagingEnabled = false
        readerKeysChannel?.setMethodCallHandler(null)
        readerKeysChannel = null
        super.onDestroy()
    }

    private fun hideSystemUI() {
        configureTransparentSystemBars()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.insetsController?.let { controller ->
                controller.hide(
                    WindowInsets.Type.statusBars() or WindowInsets.Type.navigationBars(),
                )
                controller.systemBarsBehavior =
                    WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
            }
        } else {
            @Suppress("DEPRECATION")
            window.decorView.systemUiVisibility =
                View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY or
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE or
                View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION or
                View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or
                View.SYSTEM_UI_FLAG_HIDE_NAVIGATION or
                View.SYSTEM_UI_FLAG_FULLSCREEN
        }
    }

    private fun showSystemUI() {
        configureTransparentSystemBars()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.insetsController?.show(
                WindowInsets.Type.statusBars() or WindowInsets.Type.navigationBars(),
            )
        } else {
            @Suppress("DEPRECATION")
            window.decorView.systemUiVisibility =
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE or
                View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION or
                View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
        }
    }

    private fun showReaderStatusBar() {
        configureTransparentSystemBars()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.insetsController?.let { controller ->
                controller.show(WindowInsets.Type.statusBars())
                controller.hide(WindowInsets.Type.navigationBars())
                controller.systemBarsBehavior =
                    WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
            }
        } else {
            @Suppress("DEPRECATION")
            window.decorView.systemUiVisibility =
                View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY or
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE or
                View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION or
                View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or
                View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
        }
    }

    private fun configureTransparentSystemBars() {
        WindowCompat.setDecorFitsSystemWindows(window, false)
        @Suppress("DEPRECATION")
        run {
            window.statusBarColor = Color.TRANSPARENT
            window.navigationBarColor = Color.TRANSPARENT
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            window.navigationBarDividerColor = Color.TRANSPARENT
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            window.isNavigationBarContrastEnforced = false
            window.isStatusBarContrastEnforced = false
        }
    }

    private fun setPowerSavingMode(enabled: Boolean) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) return
        try {
            @Suppress("DEPRECATION")
            val display = windowManager.defaultDisplay
            val modes = display.supportedModes
            if (modes.isEmpty()) return
            val currentMode = display.mode
            val matchingModes = modes.filter {
                it.physicalWidth == currentMode.physicalWidth &&
                    it.physicalHeight == currentMode.physicalHeight
            }.ifEmpty { modes.toList() }
            val selected = if (enabled) {
                matchingModes.minByOrNull { kotlin.math.abs(it.refreshRate - 60f) }
            } else {
                matchingModes.maxByOrNull { it.refreshRate }
            } ?: return
            val attributes = window.attributes
            if (attributes.preferredDisplayModeId != selected.modeId) {
                attributes.preferredDisplayModeId = selected.modeId
                window.attributes = attributes
            }
        } catch (error: RuntimeException) {
            Log.w("xxread", "Unable to update display refresh mode", error)
        }
    }

    private fun setKeepScreenOn(enabled: Boolean) {
        if (enabled) {
            window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        } else {
            window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        }
    }

    private fun readBatteryStatus(): Map<String, Any>? {
        val status = registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            ?: return null
        val level = status.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
        val scale = status.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        if (level < 0 || scale <= 0) return null
        val state = status.getIntExtra(BatteryManager.EXTRA_STATUS, -1)
        return mapOf(
            "level" to ((level * 100f) / scale).toInt().coerceIn(0, 100),
            "charging" to (
                state == BatteryManager.BATTERY_STATUS_CHARGING ||
                    state == BatteryManager.BATTERY_STATUS_FULL
                ),
        )
    }
}

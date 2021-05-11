package com.example.xiag_app

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import androidx.annotation.NonNull
import androidx.core.content.FileProvider.getUriForFile
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File


class MainActivity : FlutterActivity() {
    private val CHANNEL = "xiag.flutter.dev/channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // Note: this method is invoked on the main thread.
                call, result ->
            when (call.method) {
                "getBatteryLevel" -> {
                    val batteryLevel = getBatteryLevel()
                    if (batteryLevel != -1) {
                        result.success(batteryLevel)
                    } else {
                        result.error("UNAVAILABLE", "Battery level not available.", null)
                    }
                }
                "sendMail" -> {
                    val fileName = call.argument<String>("fileName")
                    if (fileName != null) sendMail(fileName)
                    result.success("Done")
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(
                null,
                IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            )
            batteryLevel =
                intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(
                    BatteryManager.EXTRA_SCALE,
                    -1
                )
        }
        return batteryLevel
    }

    private fun sendMail(fileName: String) {
//        val imagePath = File(this.cacheDir, "images")
//        println("Android imagePath: $imagePath")
        val imageFile = File(this.cacheDir, fileName)
        println("Android imageFile: ${imageFile.absolutePath}")
        val contentUri = getUriForFile(this, "com.example.xiag_app.fileprovider", imageFile)
        println("Android fileUri: $contentUri")

        println("Android prepare intent")
        val intent = Intent(Intent.ACTION_SEND)
        intent.type = "image/jpg"
        intent.putExtra(Intent.EXTRA_EMAIL, arrayOf("email@exaple.com"))
        intent.putExtra(Intent.EXTRA_SUBJECT, "subject here")
        intent.putExtra(Intent.EXTRA_STREAM, contentUri)
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        intent.addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
        startActivity(Intent.createChooser(intent, "Send email..."))
    }
}

package com.example.lavender_flutter

import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity : FlutterFragmentActivity() {
    override fun createFlutterFragment(): FlutterFragment =
        super.createFlutterFragment().apply {
            requireArguments().putBoolean("should_delay_first_android_view_draw", false)
        }
}

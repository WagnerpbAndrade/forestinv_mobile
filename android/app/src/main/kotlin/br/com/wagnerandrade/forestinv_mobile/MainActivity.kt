package br.com.wagnerandrade.forestinv_mobile

import android.content.Context
import com.logrocket.core.SDK
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    override fun attachBaseContext(newBase: Context?) {
        super.attachBaseContext(newBase)
        SDK.init(
                newBase
        ) { it.setAppID("sl5mcu/forestinv") }
    }
}

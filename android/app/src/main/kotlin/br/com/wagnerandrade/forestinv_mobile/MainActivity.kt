package br.com.wagnerandrade.forestinv_mobile

import android.content.Context
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    //private val CHANNEL_GEOLOCATOR = "br.com.wagnerandrade.forestinv_mobile/geolocator"

    override fun attachBaseContext(newBase: Context?) {
        super.attachBaseContext(newBase)
//        SDK.init(
//                newBase
//        ) { it.setAppID("sl5mcu/forestinv") }
    }

//    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_GEOLOCATOR).setMethodCallHandler {
//            call, result -> kotlin.run {
//            val latitude: Double? = call.argument("latitude");
//            val longitude: Double? = call.argument("longitude");
//
//            if (latitude != null && longitude != null) {
//                result.success(getAddress(latitude, longitude));
//            } else {
//                result.error("UNAVAILABLE", "Método não recebeu latitude e/ou longitude", null);
//            }
//        }
//        }
//    }
//
//    fun getAddress(latitude: Double, longitude: Double): String{
//        val geocoder: Geocoder = Geocoder(this)
//
//
//
//        val listAddress = geocoder.getFromLocation(latitude, longitude, 1)
//
//        val address = listAddress[0]
//
//        return address.getAddressLine(0)
//    }
}

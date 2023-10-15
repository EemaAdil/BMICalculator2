import 'dart:io';

class AdHelper {
  static String? get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5122520518983133/1744319090";
    } else if (Platform.isIOS) {
      return null;
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  // static String get bannerAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-5122520518983133/7695820635"; //
  //   } else if (Platform.isIOS) {
  //     return null;
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }
  //
  // static String get nativeAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-5122520518983133/1783350103"; //
  //   } else if (Platform.isIOS) {
  //     return null;
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }
}

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

import '../globally.dart';

class AdHelpersofintnavive {
  static InterstitialAd? _interstitialAd;
  static int _numInterstitialLoadAttempts = 0;
  static BannerAd? _bannerAd;
  //static AppOpenAd? _appOpenAd;

  static const AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  static void initialize() {
    WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();
  }

  static void loadBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.banner,

      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111' // Use test banner ad ID
          : 'ca-app-pub-3940256099942544/2934735716', // Use test banner ad ID
      request: request,
      listener: BannerAdListener(),
    )..load();
  }

  static Widget buildBannerAd() {
    return Container(
      alignment: Alignment.center,
      child: AdWidget(ad: _bannerAd!),
      width: _bannerAd?.size.width.toDouble(),
      height: _bannerAd?.size.height.toDouble(),
    );
  }

  static void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-5122520518983133/8892000506'
          : 'ca-app-pub-5122520518983133/8892000506',
      request: request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          _interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          _numInterstitialLoadAttempts += 1;
          _interstitialAd = null;
          loadInterstitialAd();
        },
      ),
    );
  }

  static void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {
            adRunning = true;
            print('ad onAdShowedFullScreenContent.');
            },

        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          adRunning = false;
          loadInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          loadInterstitialAd();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    } else {
      print('Warning: Interstitial ad not shown.');
    }
  }

  static void showBannerAd() {
    _bannerAd?.dispose(); // Dispose of any previous banner ad
    loadBannerAd();
  }

  static AppOpenAd? _appOpenAd;
  static bool _isShowingAd = false;
  static bool isLoaded=false;

  /// Load an AppOpenAd.
  static void loadAd() {
    AppOpenAd.load(
      adUnitId: "ca-app-pub-3940256099942544/3419835294",
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          print("Ad Loadede.................................");
          _appOpenAd = ad;
          isLoaded=true;
        },
        onAdFailedToLoad: (error) {
          // Handle the error.
        },
      ),
    );
  }

  // Whether an ad is available to be shown.
  static bool get isAdAvailable {
    return _appOpenAd != null;
  }

  static void showAdIfAvailable() {
    print("Called=====================================================================");
    if (_appOpenAd == null) {
      print('Tried to show ad before available.');
      loadAd();
      return;
    }
    if (_isShowingAd) {
      print('Tried to show ad while already showing an ad.');
      return;
    }
    // Set the fullScreenContentCallback and show the ad.
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        print('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        print('$ad onAdDismissedFullScreenContent');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        loadAd();
      },
    );
    _appOpenAd!.show();
  }
 // ca-app-pub-5122520518983133/2272569493
 /* static void  loadAppOpenAd() {
    AppOpenAd.load(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/3419835294' // Use test app open ad ID
          : '', // Use your real app open ad ID for iOS
      request: request,
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          print('App open ad is loaded');
          _appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          print('App open ad failed to load $error');
        },
      ),
      orientation: AppOpenAd.orientationPortrait,
    );
  }

 static void showAppOpenAd() {
    if (_appOpenAd == null) {
      print('Trying to show App Open Ad before loading');
      loadAppOpenAd();
    }

    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        print('App open ad shown');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print('App open ad failed to show $error');
        ad.dispose();
        _appOpenAd = null;
        loadAppOpenAd();
      },
      onAdDismissedFullScreenContent: (ad) {
        print('App open ad dismissed');
        ad.dispose();
        _appOpenAd = null;
        loadAppOpenAd();
      },
    );

    _appOpenAd!.show();
  }*/

  static Future<NativeAd> loadNativeAd(TemplateType templateType) async {
    NativeAd nativeAd = NativeAd(
      adUnitId: "ca-app-pub-5122520518983133/1783350103",
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('$NativeAd loaded.');
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('$NativeAd failed to load: $error');
          ad.dispose();
        },
      ),
      request: request,
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: templateType,
        mainBackgroundColor: Colors.purple,
        cornerRadius: 10.0,
        callToActionTextStyle: NativeTemplateTextStyle(
          textColor: Colors.cyan,
          backgroundColor: Colors.red,
          style: NativeTemplateFontStyle.monospace,
          size: 16.0,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.red,
          backgroundColor: Colors.cyan,
          style: NativeTemplateFontStyle.italic,
          size: 16.0,
        ),
        secondaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.green,
          backgroundColor: Colors.black,
          style: NativeTemplateFontStyle.bold,
          size: 16.0,
        ),
        tertiaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.brown,
          backgroundColor: Colors.amber,
          style: NativeTemplateFontStyle.normal,
          size: 16.0,
        ),
      ),
    );

    await nativeAd.load();
    return nativeAd;
  }
}

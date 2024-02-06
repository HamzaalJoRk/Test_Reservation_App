// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get bags => const AssetGenImage('assets/images/bags.jpg');

  AssetGenImage get blazer => const AssetGenImage('assets/images/blazer.jpg');

  AssetGenImage get box => const AssetGenImage('assets/images/box.jpg');

  AssetGenImage get cl => const AssetGenImage('assets/images/cl.jpg');

  AssetGenImage get decore => const AssetGenImage('assets/images/decore.jpg');

  AssetGenImage get denim => const AssetGenImage('assets/images/denim.jpg');

  AssetGenImage get glass => const AssetGenImage('assets/images/glass.jpg');

  AssetGenImage get hat => const AssetGenImage('assets/images/hat.jpg');

  AssetGenImage get jacjket => const AssetGenImage('assets/images/jacjket.jpg');

  AssetGenImage get kids => const AssetGenImage('assets/images/kids.jpg');

  AssetGenImage get mens => const AssetGenImage('assets/images/mens.jpg');

  AssetGenImage get necklaces => const AssetGenImage('assets/images/necklaces.jpg');

  AssetGenImage get off1 => const AssetGenImage('assets/images/off1.jpg');

  AssetGenImage get off2 => const AssetGenImage('assets/images/off2.jpg');

  AssetGenImage get off3 => const AssetGenImage('assets/images/off3.jpg');

  AssetGenImage get off4 => const AssetGenImage('assets/images/off4.jpg');

  AssetGenImage get off5 => const AssetGenImage('assets/images/off5.jpg');

  AssetGenImage get off6 => const AssetGenImage('assets/images/off6.jpg');

  AssetGenImage get off7 => const AssetGenImage('assets/images/off7.jpg');

  AssetGenImage get off8 => const AssetGenImage('assets/images/off8.jpg');

  AssetGenImage get other => const AssetGenImage('assets/images/other.jpg');

  AssetGenImage get shirt => const AssetGenImage('assets/images/shirt.jpg');

  AssetGenImage get shoes => const AssetGenImage('assets/images/shoes.jpg');

  AssetGenImage get sneakers => const AssetGenImage('assets/images/sneakers.jpg');

  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  AssetGenImage get sw => const AssetGenImage('assets/images/sw.jpg');

  AssetGenImage get tShirt => const AssetGenImage('assets/images/t-shirt.jpg');

  AssetGenImage get womens => const AssetGenImage('assets/images/womens.jpg');

  //  Bridge Images
  AssetGenImage get img1 => const AssetGenImage('assets/images/1.jpg');

  AssetGenImage get img2 => const AssetGenImage('assets/images/2.jpg');

  AssetGenImage get img3 => const AssetGenImage('assets/images/3.jpg');

  AssetGenImage get img4 => const AssetGenImage('assets/images/4.jpg');

  AssetGenImage get img5 => const AssetGenImage('assets/images/5.jpg');


}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

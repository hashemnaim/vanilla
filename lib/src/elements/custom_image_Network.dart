
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants.dart';

class CustomerImageNetwork extends StatelessWidget {
  final String urlImage;
  final double widthNumber;
  final double heigthNumber;
  final double borderRadius;
  final bool circle;
  final Color borderColor;
  CustomerImageNetwork(
      this.urlImage, this.heigthNumber, this.widthNumber, this.borderRadius,
      {this.circle = true, this.borderColor = Colors.transparent});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor),
        ),
        child: circle
            ? CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(urlImage),
                maxRadius: borderRadius,
              )
            : Container(
                width: setW(widthNumber, context),
                height: setH(heigthNumber, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
      ),
      placeholder: (context, url) => Center(
          child: circle
              ? CircleAvatar(
                  backgroundImage: ExactAssetImage("assets/img/loading.gif"),
                  maxRadius: borderRadius,
                )
              : Container(
                  width: setW(widthNumber, context),
                  height: setH(heigthNumber, context),
                  child: Image.asset("assets/img/loading.gif"))),
      errorWidget: (context, url, error) =>
          Center(child: Container(
              width: setW(widthNumber, context),
                  height: setH(heigthNumber, context),
            child: Image.asset('assets/images/logo.png'))),
    );
  }
}

import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    this.animation = 'assets/poper.lottie',
    required this.text,
    required this.showactionButton,
    this.actionText,
    this.onPressed,
  });
  final String animation;
  final String text;
  final bool showactionButton;
  final String? actionText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DotLottieLoader.fromAsset(
            animation,
            frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
              if (dotlottie != null) {
                return Lottie.memory(
                  dotlottie.animations.values.single,
                  width: double.infinity,
                  height: 300,
                );
              } else {
                return Container();
              }
            },
          ),
          showactionButton
              ? SizedBox(
                width: 250,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: onPressed,
                  child: Text(
                    actionText!,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.apply(color: Colors.white),
                  ),
                ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}

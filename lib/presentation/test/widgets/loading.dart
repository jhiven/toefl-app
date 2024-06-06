import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String? text;

  const Loading({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: text != null ? 128 : 64,
        height: text != null ? 128 : 64,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.onPrimary,
                  ),
                  strokeWidth: 4,
                ),
              ),
              if (text != null) ...[
                const SizedBox(
                  height: 24,
                ),
                Text(
                  text!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                  textAlign: TextAlign.center,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

VoidCallback showLoading({String? text}) {
  return BotToast.showCustomLoading(
    clickClose: false,
    allowClick: false,
    ignoreContentClick: true,
    backgroundColor: Colors.black.withOpacity(0.5),
    align: Alignment.center,
    toastBuilder: (_) => Loading(
      text: text,
    ),
  );
}

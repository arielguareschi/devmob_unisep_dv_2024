import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotaoAdaptativo extends StatelessWidget {
  final String rotulo;
  final Function() onPressed;

  const BotaoAdaptativo(
    this.rotulo,
    this.onPressed, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(rotulo),
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: Text(
              rotulo,
              style: TextStyle(
                color: Theme.of(context).textTheme.labelLarge?.color,
              ),
            ),
          );
  }
}

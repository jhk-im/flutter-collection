import 'package:flutter/material.dart';

cOutlineInputBorder(BuildContext context) => OutlineInputBorder(
  borderSide: BorderSide(
    color: Theme.of(context).colorScheme.primary,
    width: 2.0,
  ),
  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
);
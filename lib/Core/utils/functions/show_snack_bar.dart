import 'package:flutter/material.dart';

import '../../../Features/Auth/presentation/manager/login_cubit/login_cubit.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    BuildContext context, LoginFailureState state) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(state.errorMessage),
      backgroundColor: Colors.red,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_kullanimi1/bloc/fontsize_bloc.dart';

BlocBuilder<FontSizeBloc, FontSizeState> simpleText(
    BuildContext context, String text) {
  return BlocBuilder<FontSizeBloc, FontSizeState>(
    bloc: BlocProvider.of<FontSizeBloc>(context),
    builder: (context, FontSizeState state) {
      return Text(
        text,
        style: TextStyle(
          fontSize: state.fontSize,
        ),
      );
    },
  );
}

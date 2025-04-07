import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';


part 'language_switch_event.dart';
part 'language_switch_state.dart';


class LanguageSwitchBloc extends Bloc<LanguageSwitchEvent, LanguageSwitchState> {
  LanguageSwitchBloc() : super(LanguageSwitchState(locale: Locale('en'))) {
    on<ChangeLanguage>((event, emit) {
      emit(LanguageSwitchState(locale: event.locale));
    });
  }
}

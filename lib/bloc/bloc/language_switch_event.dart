part of 'language_switch_bloc.dart';

abstract class LanguageSwitchEvent {}

class ChangeLanguage extends LanguageSwitchEvent {
  final Locale locale;

  ChangeLanguage(this.locale);
}

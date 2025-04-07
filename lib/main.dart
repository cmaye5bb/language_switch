import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:language_switch/bloc/bloc/language_switch_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => LanguageSwitchBloc(),
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale _locale = const Locale('en');

  void _changeLanguage(Locale locale)
  {
    setState(() {
      _locale = locale;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageSwitchBloc, LanguageSwitchState>(
      builder: (context, state) {
        return  MaterialApp(
          locale: state.locale,
          supportedLocales: const[
            Locale('en'),
            Locale('my')
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate
          ],
          home: HomeScreen(onLocaleChange: _changeLanguage)
          
        );
      },
    );
  }
}



class HomeScreen extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  const HomeScreen({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.changeLanguage)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.helloWorld),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: ()
              {
                context.read<LanguageSwitchBloc>().add(ChangeLanguage(Locale('en')));
              },
              child: const Text('English'),
            ),
            ElevatedButton(
              onPressed: (){
                context.read<LanguageSwitchBloc>().add(ChangeLanguage(Locale('my')));
              },
              child: const Text('မြန်မာ'),
            ),
          ],
        ),
      ),
    );
  }
}

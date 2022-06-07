// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalisations {
  AppLocalisations();

  static AppLocalisations? _current;

  static AppLocalisations get current {
    assert(_current != null,
        'No instance of AppLocalisations was loaded. Try to initialize the AppLocalisations delegate before accessing AppLocalisations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalisations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalisations();
      AppLocalisations._current = instance;

      return instance;
    });
  }

  static AppLocalisations of(BuildContext context) {
    final instance = AppLocalisations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalisations present in the widget tree. Did you add AppLocalisations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalisations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalisations>(context, AppLocalisations);
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Sincronizando`
  String get sinc {
    return Intl.message(
      'Sincronizando',
      name: 'sinc',
      desc: '',
      args: [],
    );
  }

  /// `Soy Nuevo`
  String get soyNuevo {
    return Intl.message(
      'Soy Nuevo',
      name: 'soyNuevo',
      desc: '',
      args: [],
    );
  }

  /// `iniciar Sesión`
  String get iniciarSesion {
    return Intl.message(
      'iniciar Sesión',
      name: 'iniciarSesion',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalisations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalisations> load(Locale locale) => AppLocalisations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

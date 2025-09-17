import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log('----onCreate----');
    log(bloc.toString());
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('----onChange----');
    log('--bloc-- ===>$bloc');
    log('--change-- ===>$change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('----onError----');
    log('--bloc-- ===>$bloc');
    log('--error-- ===>$error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    log('----onClose----');
    log('--bloc-- ===>$bloc');
    super.onClose(bloc);
  }
}

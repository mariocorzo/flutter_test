import 'package:flutter/material.dart';
import 'package:flutter_module_tests/blocs/bloc_test.dart';

class BlocProviderTest extends InheritedWidget {
  final BlocTest bloc_test;

  BlocProviderTest({Key key, BlocTest bloc_test, Widget child})
      : bloc_test = bloc_test ?? BlocTest(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static BlocTest of(BuildContext context) => (context.inheritFromWidgetOfExactType(BlocProviderTest) as BlocProviderTest).bloc_test;
}

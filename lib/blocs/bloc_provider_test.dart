import 'package:flutter/material.dart';
import 'package:flutter_module_tests/blocs/bloc_test.dart';

class BlocProviderTest extends InheritedWidget {
  final BlocTest blocTest;

  BlocProviderTest({Key key, BlocTest blocTest, Widget child})
      : blocTest = blocTest ?? BlocTest(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static BlocTest of(BuildContext context) => (context.inheritFromWidgetOfExactType(BlocProviderTest) as BlocProviderTest).blocTest;
}

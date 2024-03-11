import 'package:color_changer/features/color_changer/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

///Dependency injection
class InjectionContainer extends Injector with ColorChangerInjector {}

///Dependency injection for App
abstract class Injector {
  @mustCallSuper
  Future<void> init() async {}
}

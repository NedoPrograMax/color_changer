import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:color_changer/core/helper/extensions.dart';
import 'package:color_changer/features/color_changer/presentation/cubits/color_changer_cubit/color_changer_cubit.dart';
import 'package:color_changer/features/color_changer/presentation/widgets/main_text.dart';
import 'package:color_changer/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  @override
  void initState() {
    super.initState();

    cubit = sl();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      cubit.generateColor();
    });
  }

  final formKey = GlobalKey<FormState>();
  final urlFieldController = TextEditingController();
  late final ColorChangerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ThemeSwitcher(
          builder: (context) =>
              BlocListener<ColorChangerCubit, ColorChangerState>(
            bloc: cubit,
            listener: (context, state) {
              if (state is ColorChangerSucess) {
                ThemeSwitcher.of(context).changeTheme(
                  theme: ThemeData(
                    primaryColor: state.color,
                    colorScheme: ThemeData().colorScheme.copyWith(
                          onPrimary: state.color.getOnColor(),
                        ),
                  ),
                );
              }
            },
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: cubit.generateColor,
              child: const Center(
                child: MainText(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

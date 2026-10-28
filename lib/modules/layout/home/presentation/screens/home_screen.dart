import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/widgets/error_message_widget.dart';
import 'package:movie_app/core/widgets/loading_widget.dart';
import 'package:movie_app/modules/layout/home/presentation/manager/home_cubit.dart';
import 'package:movie_app/modules/layout/home/presentation/widgets/home_body.dart';
import 'package:movie_app/modules/layout/home/presentation/widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getMovies(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccess) {
              return SafeArea(
                top: false,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeHeader(availableNow: state.availableNow),
                      const SizedBox(height: 30),
                      HomeBody(actionMovies: state.actionMovies),
                    ],
                  ),
                ),
              );
            }
            if (state is HomeFailure) {
              return ErrorMessageWidget(errorMessage: state.errorMessage);
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }
}

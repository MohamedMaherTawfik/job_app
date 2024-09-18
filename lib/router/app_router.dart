import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_app/buisness_logic_layer/cubit/jobs_cubit.dart';
import 'package:jobs_app/constants/strings.dart';
import 'package:jobs_app/data/model/jobs_model.dart';
import 'package:jobs_app/data/repository/jobs_repository.dart';
import 'package:jobs_app/data/web_services/jobs_web_services.dart';
import 'package:jobs_app/presentation/screens/job_detail_screen.dart';
import 'package:jobs_app/presentation/screens/jobs_screen.dart';

class AppRouter {
  late JobsRepository jobsRepository;
  late JobsCubit jobsCubit;

  AppRouter() {
    jobsRepository = JobsRepository(JobsWebServices());
    jobsCubit = JobsCubit(jobsRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case JobsPageScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => jobsCubit,
                  child: JobsScreen(),
                ));

      case JobDetailsScreen:
        final job = settings.arguments as Job;
        return MaterialPageRoute(
            builder: (_) => JobDetailScreen(
                  job: job,
                ));
    }
  }
}

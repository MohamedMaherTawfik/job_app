import 'package:bloc/bloc.dart';
import 'package:jobs_app/data/repository/jobs_repository.dart';
import 'package:meta/meta.dart';

import '../../data/model/jobs_model.dart';

part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  final JobsRepository jobsRepository;

  JobsCubit(this.jobsRepository) : super(JobsInitial());

  List<Job> jobs = [];

  List<Job> getAllJobs() {
    jobsRepository.getAllJobs().then((jobs) {
      emit(JobsLoaded(jobs));
      this.jobs = jobs;
    });
    return jobs;
  }
}

part of 'jobs_cubit.dart';

@immutable
sealed class JobsState {}

final class JobsInitial extends JobsState {}

final class JobsLoaded extends JobsState {
  final List<Job> jobs;

  JobsLoaded(this.jobs);
}

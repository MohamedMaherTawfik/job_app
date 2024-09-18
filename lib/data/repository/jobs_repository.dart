import 'package:jobs_app/data/model/jobs_model.dart';
import 'package:jobs_app/data/web_services/jobs_web_services.dart';

class JobsRepository {
  final JobsWebServices jobsWebServices;

  JobsRepository(this.jobsWebServices);

  Future<List<Job>> getAllJobs() async {
    final jobs = await jobsWebServices.getAllJobs();
    return jobs
        .map((job) => Job.fromJson(job as Map<String, dynamic>))
        .toList();
  }
}

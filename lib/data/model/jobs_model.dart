class Job {
  late int id;
  late String jobTitle;
  late String companyName;
  late String compnayLogo;
  late String job_location;
  late String job_level;
  late String job_expert;
  late String job_description;
  late String publish_date;

  Job.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitle = json['jobTitle'];
    companyName = json['companyName'];
    compnayLogo = json['companyLogo'];
    job_location = json['jobGeo'];
    job_level = json['jobLevel'];
    job_expert = json['jobExcerpt'];
    job_description = json['jobDescription'];
    publish_date = json['pubDate'];
  }
}

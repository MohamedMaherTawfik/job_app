class Job {
  late int id;
  late String jobTitle;
  late String companyName;
  late String compnayLogo;
  late String job_location;
  late String job_level;
  late String job_description;
  late String publish_date;
  late dynamic annualSalaryMin;
  late dynamic annualSalaryMax;
  late dynamic SalaryCurrency;
  late String jobExcerpt;
  late List<dynamic> jobtype;
  late List<dynamic> jobIndustry;
  late String compnayWebSite;

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitle = json['jobTitle'];
    companyName = json['companyName'];
    compnayLogo = json['companyLogo'];
    job_location = json['jobGeo'];
    job_level = json['jobLevel'];
    job_description = json['jobDescription'];
    publish_date = json['pubDate'];
    annualSalaryMin = json['annualSalaryMin'];
    annualSalaryMax = json['annualSalaryMax'];
    SalaryCurrency = json['salaryCurrency'];
    jobExcerpt = json['jobExcerpt'];
    jobtype = json['jobType'];
    jobIndustry = json['jobIndustry'];
    compnayWebSite = json['url'];
  }
}

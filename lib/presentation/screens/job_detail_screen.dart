import 'package:flutter/material.dart';
import 'package:jobs_app/constants/colors.dart';
import 'package:jobs_app/data/model/jobs_model.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;
  const JobDetailScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget buildSliverAppBar() {
      return SliverAppBar(
        expandedHeight: size.height * 0.75,
        pinned: true,
        stretch: true,
        backgroundColor: MyColors.myGrey,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            job.jobTitle,
            style: TextStyle(color: MyColors.myWhite),
          ),
          background: Hero(
            tag: job.id,
            child: FadeInImage.assetNetwork(
              placeholder: "assets/images/loading.gif",
              image: job.compnayLogo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    Widget buildJobInfo(String title, String value) {
      return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: MyColors.myWhite,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    Widget buildDivider(double endIndent) {
      return Divider(
        color: MyColors.myYellow,
        height: 30,
        endIndent: endIndent,
        thickness: 2,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: MyColors.myGrey,
        body: CustomScrollView(
          slivers: [
            buildSliverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: MyColors.myWhite,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        buildJobInfo('Company: ', job.companyName),
                        buildDivider(size.width * 0.73),
                        buildJobInfo('Loctaion: ', job.job_location),
                        buildDivider(size.width * 0.74),
                        buildJobInfo('jobLevel: ', job.job_level),
                        buildDivider(size.width * 0.75),
                        buildJobInfo('Excerpt: ', job.jobExcerpt.toString()),
                        buildDivider(size.width * 0.69),
                        buildJobInfo('PublishDate: ', job.publish_date),
                        buildDivider(size.width * 0.68),
                        job.annualSalaryMin == null
                            ? Container()
                            : buildJobInfo('annualSalaryMin: ',
                                job.annualSalaryMin.toString()),
                        job.annualSalaryMin == null
                            ? Container()
                            : buildDivider(size.width * 0.59),
                        job.annualSalaryMax == null
                            ? Container()
                            : buildJobInfo('annualSalaryMax: ',
                                job.annualSalaryMax.toString()),
                        job.annualSalaryMax == null
                            ? Container()
                            : buildDivider(size.width * 0.59),
                        job.SalaryCurrency == null
                            ? Container()
                            : buildJobInfo('SalaryCurrency: ',
                                job.SalaryCurrency.toString()),
                        job.SalaryCurrency == null
                            ? Container()
                            : buildDivider(size.width * 0.62),
                        buildJobInfo('jobExcerpt: ', job.jobExcerpt),
                        buildDivider(size.width * 0.71),
                        buildJobInfo('jobtype: ', job.jobtype.join(' , ')),
                        buildDivider(size.width * 0.76),
                        buildJobInfo(
                            'jobIndustry: ', job.jobIndustry.join(' , ')),
                        buildDivider(size.width * 0.69),
                        buildJobInfo('compnayWebSite: ', job.compnayWebSite),
                        buildDivider(size.width * 0.58),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

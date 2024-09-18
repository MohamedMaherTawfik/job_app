import 'package:flutter/material.dart';
import 'package:jobs_app/constants/colors.dart';
import 'package:jobs_app/data/model/jobs_model.dart';
import 'package:jobs_app/presentation/screens/job_detail_screen.dart';

class JobItem extends StatelessWidget {
  final Job job;
  const JobItem({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => JobDetailScreen(job: job))),
        child: GridTile(
          child: Hero(
            tag: job.id,
            child: Container(
                color: MyColors.myGrey,
                child: job.compnayLogo.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: "assets/images/loading.gif",
                        image: job.compnayLogo,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/placeholder.png',
                        fit: BoxFit.cover,
                      )),
          ),
          footer: GridTile(
              child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${job.jobTitle}',
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          )),
        ),
      ),
    );
  }
}

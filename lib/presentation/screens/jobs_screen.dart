import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_app/buisness_logic_layer/cubit/jobs_cubit.dart';
import 'package:jobs_app/constants/colors.dart';
import 'package:jobs_app/data/model/jobs_model.dart';
import 'package:jobs_app/presentation/components/job_Item.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  late List<Job> alljobs;
  late List<Job> searchedForActors;
  bool _is_Searching = false;
  final _searchTextController = TextEditingController();

  Widget _buildsearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: "Find an Actor...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedActors) {
        addSearchedForItemsToSearchedList(searchedActors);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedActors) {
    searchedForActors = alljobs
        .where(
            (actor) => actor.jobTitle.toLowerCase().startsWith(searchedActors))
        .toList();
    setState(() {});
  }

  void initState() {
    super.initState();
    BlocProvider.of<JobsCubit>(context).getAllJobs();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<JobsCubit, JobsState>(builder: (context, state) {
      if (state is JobsLoaded) {
        alljobs = (state).jobs;
        return buildLoadedListWidgets();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        // color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: _searchTextController.text.isEmpty
            ? alljobs.length
            : searchedForActors.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return JobItem(
            job: _searchTextController.text.isEmpty
                ? alljobs[index]
                : searchedForActors[index],
          );
        });
  }

  List<Widget> _buildAppBarActions() {
    if (_is_Searching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear,
              color: MyColors.myGrey,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSeach,
            icon: Icon(
              Icons.search,
              color: MyColors.myGrey,
            )),
      ];
    }
  }

  void _startSeach() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      _is_Searching = true;
    });
  }

  void stopSearching() {
    _clearSearch();
    setState(() {
      _is_Searching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  Widget buildAppBarTitle() {
    return Text(
      'Jobs',
      style: TextStyle(
        color: MyColors.myGrey,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (_, dynamic mode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: Scaffold(
              appBar: AppBar(
                leading: _is_Searching
                    ? BackButton(
                        color: MyColors.myGrey,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    : null,
                title: _is_Searching ? _buildsearchField() : buildAppBarTitle(),
                actions: _buildAppBarActions(),
              ),
              body: buildBlocWidget()),
        );
      },
    );
  }
}

        // IconButton(
        //               onPressed: () => _notifier.value = mode == ThemeMode.light
        //                   ? ThemeMode.dark
        //                   : ThemeMode.light,
        //               icon: Icon(Icons.brightness_4_outlined)),
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polytech/features/question/presentation/bloc/set/set_bloc.dart';
import 'package:polytech/features/question/presentation/pages/set_page.dart';

import '../bloc/subject_bloc.dart';

class SubjectPage extends StatelessWidget {
  static String routeName = '/subject';
  const SubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Subject')),
      body: Column(
        children: [
          BlocListener<SubjectBloc, SubjectState>(
            listener: (context, state) {},
            child: BlocBuilder<SubjectBloc, SubjectState>(
              builder: (context, state) {
                if (state is SubjectLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SubjectLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (_, i) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            BlocProvider.of<SetBloc>(context).add(
                                GetAllSetEvent(state.subjects[i].subjectId));
                            // context.read<SetBloc>().add(
                            //     GetAllSetEvent(state.subjects[i].subjectId));
                            Navigator.pushNamed(context, SetPage.routeName,
                                arguments: state.subjects[i].subjectName);
                          },
                          title: Text(state.subjects[i].subjectName),
                          subtitle: Text(state.subjects[i].subjectId),
                        ),
                      );
                    },
                    itemCount: state.subjects.length,
                  );
                } else if (state is SubjectError) {
                  return Center(
                    child: Text(state.error),
                  );
                }
                return Center(
                  child: Text('error found'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

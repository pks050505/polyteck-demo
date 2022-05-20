import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polytech/features/question/presentation/bloc/questionlist/questionlist_bloc.dart';
import 'package:polytech/features/question/presentation/pages/question_list_page.dart';

import '../bloc/set/set_bloc.dart';

class SetPage extends StatelessWidget {
  static String routeName = '/setPage';
  final String subjectName;
  const SetPage({Key? key, required this.subjectName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName),
        centerTitle: true,
      ),
      body: BlocBuilder<SetBloc, SetState>(
        builder: (context, state) {
          if (state is SetLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SetLoaded) {
            return ListView.builder(
                itemCount: state.sets.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      context
                          .read<QuestionlistBloc>()
                          .add(GetAllQuestionEvent(state.sets[i].setId));
                      Navigator.pushNamed(context, QuestionListPage.routeName,
                          arguments: state.sets[i].setName);
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(state.sets[i].setId),
                        subtitle: Text(state.sets[i].subjectId),
                        trailing: Text(state.sets[i].setName),
                      ),
                    ),
                  );
                });
          } else if (state is SetError) {
            return const Center(
              child: Text('SetError State'),
            );
          }
          return Center(child: Text('Set Error outside'));
        },
      ),
    );
  }
}

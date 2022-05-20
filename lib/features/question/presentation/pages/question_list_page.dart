import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polytech/features/question/presentation/bloc/questionlist/questionlist_bloc.dart';

class QuestionListPage extends StatelessWidget {
  static const String routeName = '/questionlistpage';
  final String setName;
  const QuestionListPage({Key? key, required this.setName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(setName)),
      body: BlocBuilder<QuestionlistBloc, QuestionlistState>(
        builder: (context, state) {
          if (state is QuestionlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is QuestionListLoaded) {
            return ListView.builder(
              itemCount: state.questions.length,
              itemBuilder: (_, i) {
                return Card(
                  child: Text(state.questions[i].questionName),
                );
              },
            );
          } else if (state is QuestionListError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const Center(
            child: Text('Error Outside'),
          );
        },
      ),
    );
  }
}

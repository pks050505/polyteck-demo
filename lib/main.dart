import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polytech/features/question/data/datasources/question_firebase_data_source.dart';
import 'package:polytech/features/question/data/datasources/set_firebase_data_source.dart';
import 'package:polytech/features/question/data/repositories/question_repository_impl.dart';
import 'package:polytech/features/question/data/repositories/set_repository_impl.dart';
import 'package:polytech/features/question/domain/usecases/get_all_question_of_set.dart';
import 'package:polytech/features/question/domain/usecases/get_all_set_usecase.dart';
import 'package:polytech/features/question/presentation/pages/question_list_page.dart';
import 'package:polytech/features/question/presentation/pages/set_page.dart';
import 'features/question/data/datasources/subject_firebase_data_source.dart';
import 'features/question/data/repositories/subject_repository_impl.dart';
import 'features/question/domain/usecases/get_all_subject_tiles_usecase.dart';
import 'features/question/presentation/bloc/questionlist/questionlist_bloc.dart';
import 'features/question/presentation/bloc/subject_bloc.dart';
import 'features/question/presentation/bloc/set/set_bloc.dart';
import 'features/question/presentation/pages/all_subject_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SubjectFirebaseDataSourceImpl>(
            create: (context) => SubjectFirebaseDataSourceImpl(firestore)),
        RepositoryProvider<SetFirebaseDataSourceImpl>(
            create: (context) => SetFirebaseDataSourceImpl(firestore)),
        RepositoryProvider<QuestionFirebaseDataSourceImpl>(
          create: (context) => QuestionFirebaseDataSourceImpl(firestore),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SubjectBloc>(
            create: (context) => SubjectBloc(GetAllSubjectTiles(
                SubjectRepositoryImpl(
                    context.read<SubjectFirebaseDataSourceImpl>())))
              ..add(const GetAllSubjectEvent()),
          ),
          BlocProvider<SetBloc>(
            create: (context) => SetBloc(
              GetAllSetUseCase(
                  SetRepositoryImpl(context.read<SetFirebaseDataSourceImpl>())),
            ),
          ),
          BlocProvider<QuestionlistBloc>(
            create: (context) => QuestionlistBloc(GetAllQuestionUsecase(
                QuestionRepositoryImpl(
                    context.read<QuestionFirebaseDataSourceImpl>()))),
          )
        ],
        child: MaterialApp(
          title: 'Question App',
          initialRoute: SubjectPage.routeName,
          onGenerateRoute: (settings) {
            if (settings.name == SubjectPage.routeName) {
              return MaterialPageRoute(builder: (_) {
                return const SubjectPage();
              });
            } else if (settings.name == SetPage.routeName) {
              return MaterialPageRoute(builder: (_) {
                final args = settings.arguments as String;
                return SetPage(subjectName: args);
              });
            } else if (settings.name == QuestionListPage.routeName) {
              return MaterialPageRoute(builder: (_) {
                final args = settings.arguments as String;
                return QuestionListPage(
                  setName: args,
                );
              });
            }
          },
        ),
      ),
    );
  }
}

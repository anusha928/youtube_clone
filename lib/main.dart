import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunday/features/splash/ui/screens/splash_screens.dart';
import 'Dashboard/bloc/video_list_bloc.dart';
import 'Dashboard/resources/video_repositry.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return RepositoryProvider(
      create: (context) => VideoRepository(),
      child: BlocProvider(
        create: (context) => VideoListBloc(
          videoRepository: RepositoryProvider.of<VideoRepository>(context)
        ),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}

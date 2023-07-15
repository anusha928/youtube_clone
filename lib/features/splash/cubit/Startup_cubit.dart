import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunday/features/splash/cubit/startup_state.dart';
import 'package:sunday/common/utils/shared_pref.dart';

class StartupCubit extends Cubit<SatrtupState> {
  StartupCubit() : super(StartupLoading());

  fetchInitialData() async {
    emit(StartupLoading());
    await Future.delayed(const Duration(seconds: 1));
    final String _userToken = await SharedPref.getUsertoken()??"";
    final _isfirsttime = await SharedPref.isFirstTime();
    
    
    emit(StartupSuccess(isLogedin: _userToken.isNotEmpty,
     isfirsttime: _isfirsttime
     ));
  }
}

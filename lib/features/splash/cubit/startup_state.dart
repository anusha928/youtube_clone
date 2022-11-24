abstract class SatrtupState {}

class StartupLoading extends SatrtupState {}

class StartupSuccess extends SatrtupState {
  final bool isLogedin;
   final bool isfirsttime;
  

  StartupSuccess({required this.isLogedin, required this.isfirsttime  });
}

abstract class CommomEvent {}

class CommonDataFetcheEvent extends CommomEvent {
  String? query;

  CommonDataFetcheEvent({required this.query});
}

class CommonLoadmoreEvent extends CommomEvent {}

class CommonRefresheEvent extends CommomEvent {}

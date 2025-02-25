import 'dart:async';

class Debouncer {
  late final int waitingTime;
  Timer? _timer;
  Debouncer({required this.waitingTime});

  call(Function function) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: waitingTime), (){ function();});
  }


  void dispose() => _timer?.cancel();


}

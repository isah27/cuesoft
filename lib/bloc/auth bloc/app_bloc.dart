import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part 'app_event.dart';
part 'app_state.dart';

class Cuesoft extends Bloc<CuesoftEvent, CuesoftState> {
  Cuesoft() : super(InitialState()) {
    on<LoginEvent>(_onLoginEvent);
  }

  void _onLoginEvent(LoginEvent event, Emitter<CuesoftState> emit) async {
    emit(LoadingState());
    try {
      var data= await get(Uri.parse("http:restapi.adequateshop.com/api/authaccount/login"));
      if(data.statusCode==200){
emit(AuthenticatedState());
      }
      
    } catch (e) {
      print(e);
    }
  }

 
}

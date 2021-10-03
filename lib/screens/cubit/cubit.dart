import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebooktask/data/data.dart';
import 'package:flutter_facebooktask/models/post_model.dart';
import 'package:flutter_facebooktask/screens/cubit/states.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());
  static SocialCubit get(context) => BlocProvider.of(context);
  List<Post> socialposts = [];
  void allposts() {
    Timer(const Duration(seconds: 5), () {
      socialposts = posts;
      emit(SocialUpdataPostsState());
    });
    
   
  }
}

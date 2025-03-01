import 'package:apis_rev/cache/cache_helper.dart';
import 'package:apis_rev/core/api/api_consumer.dart';
import 'package:apis_rev/core/api/end_points.dart';
import 'package:apis_rev/core/errors/exceptions.dart';
import 'package:apis_rev/models/signin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apis_rev/cubit/user_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  SigninModel? user;
  signIn()async {
    try{
      emit(SignInLoading());
      final response = await api.post(
        EndPoint.signIn,
        {
         ApiKey.email: signInEmail.text,
         ApiKey.password: signInPassword.text, 
        },
        null,
      );
      user=SigninModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      print(decodedToken['id']);
      emit(SignInSuccess());
    } on ServerException catch(e){
      emit(SignInFailure(e.errorModel.message));
    }
  }
}

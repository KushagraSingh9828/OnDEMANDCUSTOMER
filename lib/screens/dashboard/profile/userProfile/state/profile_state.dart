import '../../../../../core/api/common_response_model.dart';
import '../repositories/UserProfileResponse.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitialState extends ProfileState {
  const ProfileInitialState(String connecting);
}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState(String loading);
}

class ProfileLoadedState extends ProfileState {
  UserProfileResponse? response;
  CommonResponseModel? commonResponseModel;
  ProfileLoadedState({this.response, this.commonResponseModel});
}

class ProfileErrorState extends ProfileState {
  final String message;
  const ProfileErrorState(this.message);
}
class ProfileRequest {
  String? name;
  String? isd;
  String? mobile;
  String? address;
  String? filePath;
  String? email;
}
import 'package:bloc/bloc.dart';
import 'package:bloc_cubit_project/cubit/home/home_state.dart';
import 'package:bloc_cubit_project/data/model/get_users_model.dart';
import 'package:bloc_cubit_project/data/service/remote/get_users_service.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    getUsers();
  }

  // Home logic here...

  void getUsers() async {
    emit(HomeLoadingState());
    await UsersService.getUsers().then((value) {
      if (value is List<UsersModel>) {
        emit(HomeCompleteState(value));
      } else {
        emit(HomeErrorState(value));
      }
    });
  }
}

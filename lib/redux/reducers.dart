import 'package:sibeton/models/app_state.dart';
import 'package:sibeton/models/user.dart';
import 'package:sibeton/redux/actions.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(user: userReducer(state.user, action));
}

User userReducer(User user, dynamic action) {
  if (action is GetUserAction) {
    return action.user;
  }
  return user;
}

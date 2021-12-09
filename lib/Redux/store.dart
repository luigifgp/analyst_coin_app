import 'package:meta/meta.dart';

//redux
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:analyst_coin/Redux/reducer.dart';
import 'app_state.dart';
import 'action_state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetCoinsStateAction) {
    final nextCoinsState = coinsReducer(state.appDtState, action);

    return state.copyWith(appDtState: nextCoinsState);
  }

  return state;
}

@immutable
class AppState {
  final AppDataState appDtState;

  AppState({
    @required this.appDtState,
  });

  AppState copyWith({
    AppDataState appDtState,
  }) {
    return AppState(
      appDtState: appDtState ?? this.appDtState,
    );
  }
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final coinsStateInitial = AppDataState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(appDtState: coinsStateInitial),
    );
  }
}

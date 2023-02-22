import 'package:equatable/equatable.dart';
import 'package:simpletimer/modules/edit_timer/blocs/timer/exports.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/entities/designation.dart';
import '../../../model/repositories/designation_repository.dart';

part 'designation_bloc.freezed.dart';
part 'designation_event.dart';
part 'designation_state.dart';

class DesignationBloc extends Bloc<DesignationEvent, DesignationState> {
  DesignationBloc() : super(const DesignationState.initial()) {
    final repo = DesignationRepository();
    on<DesignationEvent>((event, emit) async {
      await event.when(fetch: () async {
        try {
          emit(const DesignationState.loading());
          final response = await repo.getDesignation();
          if (response.hasData) {
            List<Designation> list = response.data;
            emit(DesignationState.success(data: list));
          } else {
            emit(DesignationState.failed(
                error: response.error ?? "Error occurred while fetching data"));
          }
        } catch (e) {
          emit(DesignationState.failed(
              error: "Exception occurred while fetching designation:${e}"));
        }
      });
    });
  }
}

part of 'designation_bloc.dart';

@freezed
class DesignationState with _$DesignationState {
  const factory DesignationState.initial() = _Initial;
  const factory DesignationState.loading() = _Loading;
  const factory DesignationState.success({required List<Designation> data}) =
      _Success;
  const factory DesignationState.failed({required String error}) = _Failed;
}

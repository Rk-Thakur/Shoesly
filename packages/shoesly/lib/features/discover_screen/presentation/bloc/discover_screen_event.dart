// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'discover_screen_bloc.dart';

abstract class DiscoverScreenEvent extends Equatable {
  const DiscoverScreenEvent();

  @override
  List<Object> get props => [];
}

class GetAllDiscoverEvent extends DiscoverScreenEvent {}

// ignore: must_be_immutable
class GetBrandDiscoverEvent extends DiscoverScreenEvent {
  String brandName;
  GetBrandDiscoverEvent({
    required this.brandName,
  });
}

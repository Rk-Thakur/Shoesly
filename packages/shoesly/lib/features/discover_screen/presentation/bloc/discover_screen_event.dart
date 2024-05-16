part of 'discover_screen_bloc.dart';

abstract class DiscoverScreenEvent extends Equatable {
  const DiscoverScreenEvent();

  @override
  List<Object> get props => [];
}

class GetAllDiscoverEvent extends DiscoverScreenEvent {}

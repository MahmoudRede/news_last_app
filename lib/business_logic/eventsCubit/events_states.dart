
abstract class EventsState {}
class EventsInitial extends EventsState {}
class EventsImagePickerLoadingState extends EventsState {}
class EventsImagePickerSuccessState extends EventsState {}
class EventsImagePickerFailureState extends EventsState {}
class RemoveEventsImageState extends EventsState {}
class UploadEventsImageLoadingState extends EventsState {}
class UploadEventsImageSuccessState extends EventsState {}
class UploadEventsImageFailureState extends EventsState {}
class AddEventsLoadingState extends EventsState {}
class AddEventsSuccessState extends EventsState {}
class AddEventsFailureState extends EventsState {}
class GetEventsLoadingState extends EventsState {}
class GetEventsSuccessState extends EventsState {}
class GetEventsFailureState extends EventsState {}


class SelectedDateState extends EventsState {}
class SetCalenderDateState extends EventsState {}


class AddDeathEventLoadingState extends EventsState {}
class AddDeathEventSuccessState extends EventsState {}
class AddDeathEventFailureState extends EventsState {}

class GetDeathEventLoadingState extends EventsState {}
class GetDeathEventSuccessState extends EventsState {}
class GetDeathEventFailureState extends EventsState {}

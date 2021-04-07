library common;

const String API_URL = 'https://dart-socket.herokuapp.com/';

class SocketEvent {
  final String name;
  final String room;
  final String message;
  final SocketEventType type;

  SocketEvent(
      {required this.name,
      required this.room,
      this.message = '',
      required this.type});

  Map toJson() {
    return {
      'name': name,
      'room': room,
      'message': message,
      'type': type.toString(),
    };
  }

  factory SocketEvent.fromJson(Map json) {
    return SocketEvent(
        name: json['name'],
        room: json['room'],
        message: json['message'],
        type: SocketEventType.values
            .firstWhere((element) => element.toString() == json['type']));
  }
}

enum SocketEventType { enter_room, leave_room, message }

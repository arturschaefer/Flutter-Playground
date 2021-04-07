import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  test(' from json to json', () {
    final json = {
      'name': 'Joao',
      'room': 'Sala 1',
      'message': '',
      'type': 'SocketEventType.enter_room',
    };

    final event = SocketEvent.fromJson(json);

    expect(event.name, 'Joao');
    expect(event.type, SocketEventType.enter_room);
    expect(event.toJson(), json);
  });
}

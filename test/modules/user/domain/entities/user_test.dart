import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:investapp/modules/user/user.dart';

void main() {
  test("Create user instance", () {
    Faker faker = Faker();
    User user = User(
      uuid: "",
      email: faker.internet.email(),
      name: faker.person.name(),
      token: 0,
      profileImage: faker.lorem.random.toString(),
      accessToken: faker.jwt.secret,
    );

    expect(user, allOf([
      isNotNull,
      isA<User>(),
    ]));
  });
}
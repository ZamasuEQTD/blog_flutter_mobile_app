import 'package:blog/src/modules/domain/features/media/models/spoileable_media.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock/mock_media.dart';

void main() {
  group("Spoileable Media Tests", () {
    test("Debe cambiar el estado del spoiler a true", () {
      var spoileable = SpoileableMedia(media: MockMedia());

      spoileable.switchSpoiler();

      expect(spoileable.spoiler, true);
    });
  });
}

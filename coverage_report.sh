flutter test --coverage
lcov --remove coverage/lcov.info \
'lib/*/*_mock.dart' \
'lib/*/*_model.dart' \
'lib/*/*_bindings.dart' \
'lib/*/entities/*.dart' \
'lib/*/i18n/*.dart' \
'lib/routes/*.dart' \
'lib/core/store/*.dart' \
'lib/core/constants/*.dart' \
'lib/core/presentation/theme/*.dart' \
-o coverage/lcov.info
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
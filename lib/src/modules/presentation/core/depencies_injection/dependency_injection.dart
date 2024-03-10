import 'package:blog/src/modules/application/configuration/dependency_injection.dart';
import 'package:blog/src/modules/infraestructure/configuration/depencency_injection.dart';
import 'package:get_it/get_it.dart';

extension DepenciesInjection on GetIt {
  GetIt addDependencies() {
    addApplication()
    .addInfraestructure();
    return this;
  }
}
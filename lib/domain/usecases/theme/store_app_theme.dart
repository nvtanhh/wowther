import 'package:injectable/injectable.dart';

import '../../../core/params/theme/store_app_theme_data_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/theme_repository.dart';

@injectable
class StoreAppThemeData implements UseCase<void, StoreAppThemeDataParams> {
  final ThemeRepository _themeRepository;

  StoreAppThemeData(this._themeRepository);

  @override
  Future<void> call(StoreAppThemeDataParams params) async {
    return _themeRepository.storeAppThemeData(params.theme);
  }
}

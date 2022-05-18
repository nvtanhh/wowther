import 'package:injectable/injectable.dart';

import '../../../core/params/params.index.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/app_theme_data.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetStoredAppThemeData implements UseCase<AppThemeData, NoParams> {
  final ThemeRepository _themeRepository;

  GetStoredAppThemeData(this._themeRepository);

  @override
  Future<AppThemeData> call(NoParams noParams) async {
    return _themeRepository.getStoredAppThemeData();
  }
}

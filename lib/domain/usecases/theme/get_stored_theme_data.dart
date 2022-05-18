import 'package:injectable/injectable.dart';

import '../../../core/params/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/app_theme_data.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetStoredOrDefaultAppThemeData
    implements UseCase<AppThemeData, NoParams> {
  final ThemeRepository _themeRepository;

  GetStoredOrDefaultAppThemeData(this._themeRepository);

  @override
  Future<AppThemeData> call(NoParams noParams) async {
    return _themeRepository.getStoredOrDefaultAppThemeData();
  }
}

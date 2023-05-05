import 'package:chatgpt_prompts/core/domain/model/config.dart';

abstract class ConfigProvider {
  const ConfigProvider();

  Future<Config> getConfig();
}

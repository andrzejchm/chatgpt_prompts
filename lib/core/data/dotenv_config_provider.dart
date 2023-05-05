import 'package:chatgpt_prompts/core/domain/model/config.dart';
import 'package:chatgpt_prompts/core/domain/providers/config_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotenvConfigProvider implements ConfigProvider {
  @override
  Future<Config> getConfig() {
    //get config from .env file
    return Future.value(
      Config(
        openApiKey: dotenv.env['OPENAI_API_KEY'] ?? (throw 'Missing OpenAI api key'),
      ),
    );
  }
}

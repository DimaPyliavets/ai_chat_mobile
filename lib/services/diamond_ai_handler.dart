import 'package:openai_client/openai_client.dart';

class AIHandler {
  Future<Object> getResponse(String message) async {
    try {
      const conf = OpenAIConfiguration(
        apiKey: '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',
        organizationId: 'org-Xc9t4jPh2EKqOrqPLYIE1gON',
      );

      final client = OpenAIClient(configuration: conf);

      final completion = await client.completions.create(
        model: 'gpt-3.5-turbo',
        prompt: message,
        maxTokens: 1,
      ).data;
      return (completion.toString());
    }
    catch (e) {
      return '$e';
    }
  }
}



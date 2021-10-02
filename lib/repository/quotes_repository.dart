import 'package:quotes/model/character_model.dart';
import 'package:quotes/model/quote_model.dart';
import 'package:quotes/service/api/api_picture_service.dart';
import 'package:quotes/service/api/api_quotes_service.dart';

abstract class QuotesRepository {
  QuotesRepository(
      ApiQuotesService apiQuotesService, ApiPictureService apiPictureService);

  Future<QuoteModel> getRandomQuote();

  Future<String?> getCharacterImageUrl(String character);
}

class QuotesRepositoryImpl implements QuotesRepository {
  final ApiQuotesService apiQuotesService;
  final ApiPictureService apiPictureService;

  QuotesRepositoryImpl(this.apiQuotesService, this.apiPictureService);

  @override
  Future<QuoteModel> getRandomQuote() async {
    return QuoteModel.fromJson(await apiQuotesService.getRandomQuote());
  }

  @override
  Future<String?> getCharacterImageUrl(String characterName) async {
    var data = {
      'q': characterName,
      'limit': 1,
    };
    var response = await apiPictureService.search(data);
    var characterModel =CharacterModel.fromJson(response['results'].first);
    return characterModel.imageUrl;
  }
}

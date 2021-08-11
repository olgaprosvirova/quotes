import 'package:quotes/model/quote_model.dart';
import 'package:quotes/service/api/api_quotes_service.dart';

abstract class QuotesRepository {
  QuotesRepository(ApiQuotesService apiQuotesService);

  Future<QuoteModel> getRandomQuote();
}

class QuotesRepositoryImpl implements QuotesRepository {
  final ApiQuotesService apiQuotesService;

  QuotesRepositoryImpl(this.apiQuotesService);

  @override
  Future<QuoteModel> getRandomQuote() async {
    return QuoteModel.fromJson(await apiQuotesService.getRandomQuote());
  }
}
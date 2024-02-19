import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/core/usecases/usecase.dart';
import 'package:flutter_news_app/features/daily_news/data/models/article.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/article.dart';
import 'package:flutter_news_app/features/daily_news/domain/repositories/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>,void> {

  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) async {
    return await _articleRepository.getSavedArticles();
  }
}
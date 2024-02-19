import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/core/usecases/usecase.dart';
import 'package:flutter_news_app/features/daily_news/data/models/article.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/article.dart';
import 'package:flutter_news_app/features/daily_news/domain/repositories/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void,ArticleEntity> {

  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) async {
    return await _articleRepository.saveArticle(params!);
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/daily_news/domain/usecases/get_saved_articles.dart';
import 'package:flutter_news_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:flutter_news_app/features/daily_news/domain/usecases/save_article.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent,LocalArticleState> {

  final GetSavedArticleUseCase _getSavedArticlesUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
      this._getSavedArticlesUseCase,
      this._removeArticleUseCase,
      this._saveArticleUseCase
    ) : super(const LocalArticleLoading()){
    on <GetSavedArticles> (onGetSavedArticles);
    on <SaveArticle> (onSaveArticle);
    on <RemoveArticle> (onRemoveArticle);
  }

  void onGetSavedArticles(GetSavedArticles getSavedArticles, Emitter<LocalArticleState> state) async {
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticleDone(articles));
  }

  void onRemoveArticle(RemoveArticle removeArticle, Emitter<LocalArticleState> state) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticleDone(articles));
  }

  void onSaveArticle(SaveArticle saveArticle, Emitter<LocalArticleState> state) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticleDone(articles));
  }
}
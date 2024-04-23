import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:perfectpick_wa/data/data_providers/likes/likes_data_provider.dart';
import 'package:perfectpick_wa/data/models/likes/likes_models.dart';

class LikesRepository {
  final GraphQLClient client;

  LikesRepository({required this.client});

  Future<SpecificLikeResponseModel> getSpecificLike(
      String userToken, int id, String mediaID, String mediaType) async {
    final QueryOptions options =
        specificLikeQueryOptions(userToken, id, mediaID, mediaType);
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      throw Exception('GraphQL exception: ${result.exception.toString()}');
    } else if (result.data == null) {
      throw Exception('No data received from the GraphQL query.');
    } else {
      final data = result.data!['specificLike'];
      if (data != null && data is Map<String, dynamic>) {
        return SpecificLikeResponseModel.fromJson(data);
      } else {
        throw Exception('Invalid data format received from the GraphQL query.');
      }
    }
  }

  Future<WishlistByUserIDResponseModel> getWishlistByUserID(
      String token, int id) async {
    final QueryOptions options = wishlistByUserIdQueryOptions(token, id);
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      throw Exception('GraphQL exception: ${result.exception.toString()}');
    } else if (result.data == null) {
      throw Exception('No data received from the GraphQL query.');
    } else {
      final data = result.data!['wishlistByUserId'];
      if (data != null && data is List) {
        List<Like> wishlist = data.map((item) => Like.fromJson(item)).toList();
        return WishlistByUserIDResponseModel(wishlist: wishlist);
      } else {
        throw Exception('Invalid data format received from the GraphQL query.');
      }
    }
  }
}

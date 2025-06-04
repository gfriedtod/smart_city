import 'package:path/path.dart' as path;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

/// Base URL for the API endpoints
const String baseUrl = 'http://192.168.24.164:8080/api/v1';

/// Enum representing API endpoints for authentication and user operations
enum ApiEndpoint {
  /// Authentication endpoint for user login
  login('$baseUrl/auth/authenticate'),


  /// Authentication endpoint for user registration
  register('$baseUrl/auth/register'),
  
  /// User category endpoint
  category('$baseUrl/user/category'),
  
  /// User incidents list endpoint
  incidents('$baseUrl/user/incidents'),

  status('$baseUrl/admin/incident/changeStatus'),
  /// Single incident endpoint
  incident('$baseUrl/user/incident');

  /// Constructor with endpoint URL
  const ApiEndpoint(this.url);

  /// The complete URL for the endpoint
  final String url;
}

@override
Future<String> uploadFile(file) async {
  try {
    Supabase supabase = Supabase.instance;
    final fileExt = path.extension(file!.path);
    final fileName =
        '${Uuid().v4()}${DateTime.now().millisecondsSinceEpoch}$fileExt';
    final response = await supabase.client.storage
        .from('avatars')
        .upload(fileName, file!);

    final imageUrl = await supabase.client.storage
        .from('avatars')
        .getPublicUrl(fileName);

    return imageUrl;
  } catch (e) {
    throw Exception('Error uploading file: $e');
  }
}
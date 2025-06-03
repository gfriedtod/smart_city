/// Base URL for the API endpoints
const String baseUrl = 'http://10.0.2.2:8080/api/v1';

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
  
  /// Single incident endpoint
  incident('$baseUrl/user/incident');

  /// Constructor with endpoint URL
  const ApiEndpoint(this.url);

  /// The complete URL for the endpoint
  final String url;
}
# AuthenticationApi

All URIs are relative to *http://localhost:8080*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**apiAuthLoginPost**](AuthenticationApi.md#apiAuthLoginPost) | **POST** /api/auth/login | Authenticate user |


<a id="apiAuthLoginPost"></a>
# **apiAuthLoginPost**
> AuthenticationResponse apiAuthLoginPost(authenticationRequest)

Authenticate user

### Example
```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.models.*;
import org.openapitools.client.api.AuthenticationApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("http://localhost:8080");

    AuthenticationApi apiInstance = new AuthenticationApi(defaultClient);
    AuthenticationRequest authenticationRequest = new AuthenticationRequest(); // AuthenticationRequest | 
    try {
      AuthenticationResponse result = apiInstance.apiAuthLoginPost(authenticationRequest);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling AuthenticationApi#apiAuthLoginPost");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters

| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **authenticationRequest** | [**AuthenticationRequest**](AuthenticationRequest.md)|  | |

### Return type

[**AuthenticationResponse**](AuthenticationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Successfully authenticated |  -  |
| **401** | Invalid credentials |  -  |


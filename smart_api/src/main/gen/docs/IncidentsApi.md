# IncidentsApi

All URIs are relative to *http://localhost:8080*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**apiIncidentsGet**](IncidentsApi.md#apiIncidentsGet) | **GET** /api/incidents | Get all incidents |
| [**apiIncidentsIdDelete**](IncidentsApi.md#apiIncidentsIdDelete) | **DELETE** /api/incidents/{id} | Delete incident |
| [**apiIncidentsIdGet**](IncidentsApi.md#apiIncidentsIdGet) | **GET** /api/incidents/{id} | Get incident by ID |
| [**apiIncidentsIdPut**](IncidentsApi.md#apiIncidentsIdPut) | **PUT** /api/incidents/{id} | Update incident |
| [**apiIncidentsPost**](IncidentsApi.md#apiIncidentsPost) | **POST** /api/incidents | Create new incident |


<a id="apiIncidentsGet"></a>
# **apiIncidentsGet**
> List&lt;Incident&gt; apiIncidentsGet(status)

Get all incidents

### Example
```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.auth.*;
import org.openapitools.client.models.*;
import org.openapitools.client.api.IncidentsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("http://localhost:8080");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    IncidentsApi apiInstance = new IncidentsApi(defaultClient);
    String status = "REPORTED"; // String | Filter incidents by status
    try {
      List<Incident> result = apiInstance.apiIncidentsGet(status);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling IncidentsApi#apiIncidentsGet");
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
| **status** | **String**| Filter incidents by status | [optional] [enum: REPORTED, IN_PROGRESS, RESOLVED] |

### Return type

[**List&lt;Incident&gt;**](Incident.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | List of incidents |  -  |

<a id="apiIncidentsIdDelete"></a>
# **apiIncidentsIdDelete**
> apiIncidentsIdDelete(id)

Delete incident

### Example
```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.auth.*;
import org.openapitools.client.models.*;
import org.openapitools.client.api.IncidentsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("http://localhost:8080");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    IncidentsApi apiInstance = new IncidentsApi(defaultClient);
    UUID id = UUID.randomUUID(); // UUID | Incident ID
    try {
      apiInstance.apiIncidentsIdDelete(id);
    } catch (ApiException e) {
      System.err.println("Exception when calling IncidentsApi#apiIncidentsIdDelete");
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
| **id** | **UUID**| Incident ID | |

### Return type

null (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | Incident deleted |  -  |
| **404** | Incident not found |  -  |

<a id="apiIncidentsIdGet"></a>
# **apiIncidentsIdGet**
> Incident apiIncidentsIdGet(id)

Get incident by ID

### Example
```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.auth.*;
import org.openapitools.client.models.*;
import org.openapitools.client.api.IncidentsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("http://localhost:8080");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    IncidentsApi apiInstance = new IncidentsApi(defaultClient);
    UUID id = UUID.randomUUID(); // UUID | Incident ID
    try {
      Incident result = apiInstance.apiIncidentsIdGet(id);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling IncidentsApi#apiIncidentsIdGet");
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
| **id** | **UUID**| Incident ID | |

### Return type

[**Incident**](Incident.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Incident details |  -  |
| **404** | Incident not found |  -  |

<a id="apiIncidentsIdPut"></a>
# **apiIncidentsIdPut**
> Incident apiIncidentsIdPut(id, incident)

Update incident

### Example
```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.auth.*;
import org.openapitools.client.models.*;
import org.openapitools.client.api.IncidentsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("http://localhost:8080");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    IncidentsApi apiInstance = new IncidentsApi(defaultClient);
    UUID id = UUID.randomUUID(); // UUID | Incident ID
    Incident incident = new Incident(); // Incident | 
    try {
      Incident result = apiInstance.apiIncidentsIdPut(id, incident);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling IncidentsApi#apiIncidentsIdPut");
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
| **id** | **UUID**| Incident ID | |
| **incident** | [**Incident**](Incident.md)|  | |

### Return type

[**Incident**](Incident.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Incident updated |  -  |
| **404** | Incident not found |  -  |

<a id="apiIncidentsPost"></a>
# **apiIncidentsPost**
> Incident apiIncidentsPost(incident)

Create new incident

### Example
```java
// Import classes:
import org.openapitools.client.ApiClient;
import org.openapitools.client.ApiException;
import org.openapitools.client.Configuration;
import org.openapitools.client.auth.*;
import org.openapitools.client.models.*;
import org.openapitools.client.api.IncidentsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("http://localhost:8080");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    IncidentsApi apiInstance = new IncidentsApi(defaultClient);
    Incident incident = new Incident(); // Incident | 
    try {
      Incident result = apiInstance.apiIncidentsPost(incident);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling IncidentsApi#apiIncidentsPost");
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
| **incident** | [**Incident**](Incident.md)|  | |

### Return type

[**Incident**](Incident.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Incident created |  -  |
| **400** | Invalid input |  -  |


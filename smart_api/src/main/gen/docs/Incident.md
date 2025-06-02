

# Incident


## Properties

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
|**id** | **UUID** |  |  [optional] |
|**title** | **String** |  |  [optional] |
|**description** | **String** |  |  [optional] |
|**status** | [**StatusEnum**](#StatusEnum) |  |  [optional] |
|**location** | [**IncidentLocation**](IncidentLocation.md) |  |  [optional] |
|**createdAt** | **OffsetDateTime** |  |  [optional] |
|**updatedAt** | **OffsetDateTime** |  |  [optional] |



## Enum: StatusEnum

| Name | Value |
|---- | -----|
| REPORTED | &quot;REPORTED&quot; |
| IN_PROGRESS | &quot;IN_PROGRESS&quot; |
| RESOLVED | &quot;RESOLVED&quot; |




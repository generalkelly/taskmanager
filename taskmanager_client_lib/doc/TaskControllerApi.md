# openapi.api.TaskControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080/taskmanager*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addTask**](TaskControllerApi.md#addtask) | **PUT** /add | 
[**deleteTask**](TaskControllerApi.md#deletetask) | **DELETE** /delete/{id} | 
[**getAllTasks**](TaskControllerApi.md#getalltasks) | **GET** /get-all | 
[**updateTask**](TaskControllerApi.md#updatetask) | **PATCH** /update/{id} | 


# **addTask**
> addTask(addTaskRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = TaskControllerApi();
final addTaskRequest = AddTaskRequest(); // AddTaskRequest | 

try {
    api_instance.addTask(addTaskRequest);
} catch (e) {
    print('Exception when calling TaskControllerApi->addTask: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addTaskRequest** | [**AddTaskRequest**](AddTaskRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteTask**
> deleteTask(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = TaskControllerApi();
final id = 56; // int | 

try {
    api_instance.deleteTask(id);
} catch (e) {
    print('Exception when calling TaskControllerApi->deleteTask: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllTasks**
> GetAllTasksResponse getAllTasks()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = TaskControllerApi();

try {
    final result = api_instance.getAllTasks();
    print(result);
} catch (e) {
    print('Exception when calling TaskControllerApi->getAllTasks: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetAllTasksResponse**](GetAllTasksResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateTask**
> updateTask(id, updateTaskRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = TaskControllerApi();
final id = 56; // int | 
final updateTaskRequest = UpdateTaskRequest(); // UpdateTaskRequest | 

try {
    api_instance.updateTask(id, updateTaskRequest);
} catch (e) {
    print('Exception when calling TaskControllerApi->updateTask: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **updateTaskRequest** | [**UpdateTaskRequest**](UpdateTaskRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


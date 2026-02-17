package com.fairsource.taskmanager.adapter.api.rest.model;

public record UpdateTaskRequest(String name, boolean done, Priority priority) {

}

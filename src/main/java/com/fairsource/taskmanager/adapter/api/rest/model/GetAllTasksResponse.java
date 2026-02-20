package com.fairsource.taskmanager.adapter.api.rest.model;

import java.util.List;

public record GetAllTasksResponse(List<Task> tasks) {

	public record Task(int id, String name, boolean done, Priority priority, long created) {

	}

}

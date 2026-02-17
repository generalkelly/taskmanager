package com.fairsource.taskmanager.adapter.api.rest.model;

import java.time.OffsetDateTime;
import java.util.List;

public record GetAllTasksResponse(List<Task> tasks) {

	public record Task(int id, String name, boolean done, OffsetDateTime created) {

	}

}

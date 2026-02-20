package com.fairsource.taskmanager.adapter.api.rest;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fairsource.taskmanager.adapter.api.rest.model.GetAllTasksResponse;
import com.fairsource.taskmanager.adapter.api.rest.model.Priority;
import com.fairsource.taskmanager.domain.model.Task;

@Component
public class DomainToRestConverter {

	public GetAllTasksResponse convert(List<Task> tasks) {
		return new GetAllTasksResponse(tasks.stream().map(this::convertTask).toList());
	}

	private GetAllTasksResponse.Task convertTask(Task task) {
		return new GetAllTasksResponse.Task(task.getId(), task.getName(), task.isDone(), convert(task.getPriority()),
				task.getCreated().toInstant().toEpochMilli());
	}

	private Priority convert(com.fairsource.taskmanager.domain.model.Priority priority) {
		switch (priority) {
		case LOW: {
			return Priority.LOW;
		}
		case NORMAL: {
			return Priority.NORMAL;
		}
		case URGENT: {
			return Priority.URGENT;
		}
		default:
			return Priority.LOW;
		}
	}

}

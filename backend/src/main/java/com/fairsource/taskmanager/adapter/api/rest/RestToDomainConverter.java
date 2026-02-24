package com.fairsource.taskmanager.adapter.api.rest;

import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;

import com.fairsource.taskmanager.adapter.api.rest.model.AddTaskRequest;
import com.fairsource.taskmanager.adapter.api.rest.model.UpdateTaskRequest;
import com.fairsource.taskmanager.domain.model.Priority;
import com.fairsource.taskmanager.domain.model.Task;

import jakarta.validation.constraints.NotNull;

@Component
public class RestToDomainConverter {

	public @NonNull Task convert(AddTaskRequest addTaskRequest) {
		Task task = new Task();
		task.setName(addTaskRequest.name());
		task.setPriority(convert(addTaskRequest.priority()));
		return task;
	}

	public @NonNull Task convert(UpdateTaskRequest updateTaskRequest) {
		Task task = new Task();
		task.setName(updateTaskRequest.name());
		task.setDone(updateTaskRequest.done());
		return task;
	}

	private Priority convert(com.fairsource.taskmanager.adapter.api.rest.model.@NotNull Priority priority) {
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
		default: // LOW is the default priority expected from the frontend
			return Priority.LOW;
		}
	}

}

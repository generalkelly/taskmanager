package com.fairsource.taskmanager.adapter.api.rest;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.fairsource.taskmanager.adapter.internal.db.TaskEntityWasAlteredOrRemovedException;
import com.fairsource.taskmanager.domain.exception.TaskNotFoundException;

@RestControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(TaskNotFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handleTaskNotFound(TaskNotFoundException ex) {
		return ex.getMessage() != null ? ex.getMessage() : "Task not found";
	}

	@ExceptionHandler(TaskEntityWasAlteredOrRemovedException.class)
	@ResponseStatus(HttpStatus.CONFLICT)
	public String handleTaskAlteredOrRemoved(TaskEntityWasAlteredOrRemovedException ex) {
		return "Task was altered or removed by another request";
	}

}

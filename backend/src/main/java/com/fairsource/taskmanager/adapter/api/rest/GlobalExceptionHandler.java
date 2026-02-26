package com.fairsource.taskmanager.adapter.api.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.fairsource.taskmanager.adapter.internal.db.TaskEntityWasAlteredOrRemovedException;
import com.fairsource.taskmanager.domain.exception.TaskNotFoundException;

@RestControllerAdvice
public class GlobalExceptionHandler {

	private static final Logger LOG = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	@ExceptionHandler(TaskNotFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handleTaskNotFound(TaskNotFoundException ex) {
		if (LOG.isWarnEnabled()) {
			LOG.warn(ex.getMessage());
		}
		return ex.getMessage() != null ? ex.getMessage() : "Task not found";
	}

	@ExceptionHandler(TaskEntityWasAlteredOrRemovedException.class)
	@ResponseStatus(HttpStatus.CONFLICT)
	public String handleTaskAlteredOrRemoved(TaskEntityWasAlteredOrRemovedException ex) {
		if (LOG.isWarnEnabled()) {
			LOG.warn("Task was altered or removed by another request");
		}
		return "Task was altered or removed by another request";
	}

}

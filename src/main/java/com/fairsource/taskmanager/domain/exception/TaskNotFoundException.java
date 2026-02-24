package com.fairsource.taskmanager.domain.exception;

public class TaskNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 5448165553261170311L;

	public TaskNotFoundException() {
	}

	public TaskNotFoundException(int id) {
		super("Task with id " + id + " not found");
	}

	@Override
	public synchronized Throwable fillInStackTrace() {
		return this;
	}

}

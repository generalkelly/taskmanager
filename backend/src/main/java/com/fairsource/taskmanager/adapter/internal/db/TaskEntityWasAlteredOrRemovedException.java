package com.fairsource.taskmanager.adapter.internal.db;

public class TaskEntityWasAlteredOrRemovedException extends RuntimeException {

	private static final long serialVersionUID = 1925799308969183746L;

	@Override
	public synchronized Throwable fillInStackTrace() {
		return this;
	}
}

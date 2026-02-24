package com.fairsource.taskmanager.domain.usecases.scenarios;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fairsource.taskmanager.domain.model.Task;
import com.fairsource.taskmanager.domain.usecases.acl.TaskAdministrationPort;

@Service
public class RetrieveTasksScenario {

	private final TaskAdministrationPort taskAdministrationPort;

	public RetrieveTasksScenario(TaskAdministrationPort taskAdministrationPort) {
		this.taskAdministrationPort = taskAdministrationPort;
	}

	public List<Task> retrieveTasks() {
		return taskAdministrationPort.retrieveTasks();
	}

}

package com.fairsource.taskmanager.domain.usecases.scenarios;

import org.springframework.stereotype.Service;

import com.fairsource.taskmanager.domain.usecases.acl.TaskAdministrationPort;

@Service
public class DeleteTaskScenario {

	private final TaskAdministrationPort taskAdministrationPort;

	public DeleteTaskScenario(TaskAdministrationPort taskAdministrationPort) {
		this.taskAdministrationPort = taskAdministrationPort;
	}

	public void deleteTask(int id) {
		taskAdministrationPort.deleteTask(id);
	}

}

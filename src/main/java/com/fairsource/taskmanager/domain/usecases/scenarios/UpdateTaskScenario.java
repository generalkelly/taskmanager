package com.fairsource.taskmanager.domain.usecases.scenarios;

import org.springframework.stereotype.Service;

import com.fairsource.taskmanager.domain.model.Task;
import com.fairsource.taskmanager.domain.usecases.acl.TaskAdministrationPort;

@Service
public class UpdateTaskScenario {

	private final TaskAdministrationPort taskAdministrationPort;

	public UpdateTaskScenario(TaskAdministrationPort taskAdministrationPort) {
		this.taskAdministrationPort = taskAdministrationPort;
	}

	public void updateTask(int id, Task task) {
		taskAdministrationPort.updateTask(id, task);
	}

}

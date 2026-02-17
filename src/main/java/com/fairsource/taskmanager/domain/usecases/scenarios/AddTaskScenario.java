package com.fairsource.taskmanager.domain.usecases.scenarios;

import org.springframework.stereotype.Service;

import com.fairsource.taskmanager.domain.model.Task;
import com.fairsource.taskmanager.domain.usecases.acl.TaskAdministrationPort;

@Service
public class AddTaskScenario {

	private final TaskAdministrationPort taskAdministrationPort;

	public AddTaskScenario(TaskAdministrationPort taskAdministrationPort) {
		this.taskAdministrationPort = taskAdministrationPort;
	}
	
	public void addTask(Task task) {
		taskAdministrationPort.addTask(task);
	}
	
	
}

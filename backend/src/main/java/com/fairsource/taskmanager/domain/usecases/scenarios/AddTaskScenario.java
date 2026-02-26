package com.fairsource.taskmanager.domain.usecases.scenarios;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;

import com.fairsource.taskmanager.domain.model.Task;
import com.fairsource.taskmanager.domain.usecases.acl.TaskAdministrationPort;

@Service
public class AddTaskScenario {

	private static final Logger LOG = LoggerFactory.getLogger(AddTaskScenario.class);

	private final TaskAdministrationPort taskAdministrationPort;

	public AddTaskScenario(TaskAdministrationPort taskAdministrationPort) {
		this.taskAdministrationPort = taskAdministrationPort;
	}

	public void addTask(@NonNull Task task) {
		if (LOG.isDebugEnabled()) {
			LOG.debug("Adding task: {}", task.getName());
		}
		taskAdministrationPort.addTask(task);
	}
	
	
}

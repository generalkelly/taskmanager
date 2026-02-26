package com.fairsource.taskmanager.domain.usecases.scenarios;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;

import com.fairsource.taskmanager.domain.model.Task;
import com.fairsource.taskmanager.domain.usecases.acl.TaskAdministrationPort;

@Service
public class UpdateTaskScenario {

	private static final Logger LOG = LoggerFactory.getLogger(UpdateTaskScenario.class);

	private final TaskAdministrationPort taskAdministrationPort;

	public UpdateTaskScenario(TaskAdministrationPort taskAdministrationPort) {
		this.taskAdministrationPort = taskAdministrationPort;
	}

	public void updateTask(int id, @NonNull Task task) {
		if (LOG.isDebugEnabled()) {
			LOG.debug("Updating task with id: {}", id);
		}
		taskAdministrationPort.updateTask(id, task);
	}

}

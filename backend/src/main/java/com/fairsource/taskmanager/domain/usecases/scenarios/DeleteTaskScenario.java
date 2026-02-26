package com.fairsource.taskmanager.domain.usecases.scenarios;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.fairsource.taskmanager.domain.usecases.acl.TaskAdministrationPort;

@Service
public class DeleteTaskScenario {

	private static final Logger LOG = LoggerFactory.getLogger(DeleteTaskScenario.class);

	private final TaskAdministrationPort taskAdministrationPort;

	public DeleteTaskScenario(TaskAdministrationPort taskAdministrationPort) {
		this.taskAdministrationPort = taskAdministrationPort;
	}

	public void deleteTask(int id) {
		if (LOG.isDebugEnabled()) {
			LOG.debug("Deleting task with id: {}", id);
		}
		taskAdministrationPort.deleteTask(id);
	}

}

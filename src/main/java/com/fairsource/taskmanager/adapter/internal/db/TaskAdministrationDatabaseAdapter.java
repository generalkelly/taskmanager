package com.fairsource.taskmanager.adapter.internal.db;

import java.util.List;

import com.fairsource.taskmanager.adapter.internal.db.jpa.TaskRepository;
import com.fairsource.taskmanager.domain.model.Task;
import com.fairsource.taskmanager.domain.usecases.acl.TaskAdministrationPort;

public class TaskAdministrationDatabaseAdapter implements TaskAdministrationPort {

	private final DomainToJpaConverter domainToJpaConverter;
	private final JpaToDomainConverter jpaToDomainConverter;
	private final TaskRepository taskRepository;

	public TaskAdministrationDatabaseAdapter(DomainToJpaConverter domainToJpaConverter,
			JpaToDomainConverter jpaToDomainConverter, TaskRepository taskRepository) {
		this.domainToJpaConverter = domainToJpaConverter;
		this.jpaToDomainConverter = jpaToDomainConverter;
		this.taskRepository = taskRepository;
	}

	@Override
	public void addTask(Task task) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateTask(Integer id, Task task) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteTask(Integer id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Task> retrieveTasks() {
		// TODO Auto-generated method stub
		return null;
	}

}

package com.fairsource.taskmanager.adapter.internal.db;

import java.util.List;
import java.util.Optional;

import org.springframework.dao.OptimisticLockingFailureException;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;

import com.fairsource.taskmanager.adapter.internal.db.jpa.TaskRepository;
import com.fairsource.taskmanager.adapter.internal.db.jpa.model.TaskEntity;
import com.fairsource.taskmanager.domain.exception.TaskNotFoundException;
import com.fairsource.taskmanager.domain.model.Task;
import com.fairsource.taskmanager.domain.usecases.acl.TaskAdministrationPort;

import org.springframework.transaction.annotation.Transactional;

@Component
public class TaskAdministrationDatabaseAdapter implements TaskAdministrationPort {

	private final JpaToDomainConverter jpaToDomainConverter;
	private final TaskRepository taskRepository;

	public TaskAdministrationDatabaseAdapter(JpaToDomainConverter jpaToDomainConverter, TaskRepository taskRepository) {
		this.jpaToDomainConverter = jpaToDomainConverter;
		this.taskRepository = taskRepository;
	}

	@Override
	public void addTask(@NonNull Task task) {
		TaskEntity taskEntity = new TaskEntity();
		taskEntity.setName(task.getName());
		taskEntity.setPriority(task.getPriority().name());
		taskRepository.save(taskEntity);
	}

	@Transactional
	@Override
	public void updateTask(@NonNull Integer id, @NonNull Task task) {
		Optional<TaskEntity> optionalTaskEntity = taskRepository.findById(id);
		optionalTaskEntity.ifPresentOrElse(taskEntity -> {
			taskEntity.setDone(task.isDone());
			taskEntity.setName(task.getName());
			taskRepository.save(taskEntity);
		}, () -> {
			throw new TaskNotFoundException(id);
		});
	}

	@Transactional
	@Override
	public void deleteTask(@NonNull Integer id) {
		if (!taskRepository.existsById(id)) {
			throw new TaskNotFoundException(id);
		}
		try {
			taskRepository.deleteById(id);
		} catch (OptimisticLockingFailureException e) {
			throw new TaskEntityWasAlteredOrRemovedException();
		}
	}

	@Override
	public List<Task> retrieveTasks() {
		return jpaToDomainConverter.convert(taskRepository.findAllByOrderByIdAsc());
	}

}

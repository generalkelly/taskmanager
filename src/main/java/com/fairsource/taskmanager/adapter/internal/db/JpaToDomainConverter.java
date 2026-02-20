package com.fairsource.taskmanager.adapter.internal.db;

import java.util.List;

import org.springframework.stereotype.Component;

import com.fairsource.taskmanager.adapter.internal.db.jpa.model.TaskEntity;
import com.fairsource.taskmanager.domain.model.Priority;
import com.fairsource.taskmanager.domain.model.Task;

@Component
public class JpaToDomainConverter {

	public List<Task> convert(List<TaskEntity> taskEntities) {
		return taskEntities.stream().map(this::convert).toList();
	}

	private Task convert(TaskEntity taskEntity) {
		Task task = new Task();
		task.setId(taskEntity.getId());
		task.setName(taskEntity.getName());
		task.setDone(taskEntity.isDone());
		task.setPriority(Priority.valueOf(taskEntity.getPriority()));
		task.setCreated(taskEntity.getCreated());
		return task;
	}

}

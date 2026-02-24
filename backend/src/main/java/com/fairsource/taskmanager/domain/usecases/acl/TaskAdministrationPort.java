package com.fairsource.taskmanager.domain.usecases.acl;

import java.util.List;

import org.springframework.lang.NonNull;

import com.fairsource.taskmanager.domain.model.Task;

public interface TaskAdministrationPort {

	public void addTask(@NonNull Task task);

	public void updateTask(@NonNull Integer id, @NonNull Task task);

	public void deleteTask(@NonNull Integer id);

	public List<Task> retrieveTasks();

}

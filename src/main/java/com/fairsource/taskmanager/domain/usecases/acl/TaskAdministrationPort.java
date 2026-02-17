package com.fairsource.taskmanager.domain.usecases.acl;

import java.util.List;

import com.fairsource.taskmanager.domain.model.Task;

public interface TaskAdministrationPort {

	public void addTask(Task task);

	public void updateTask(Integer id, Task task);

	public void deleteTask(Integer id);

	public List<Task> retrieveTasks();

}

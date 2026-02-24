package com.fairsource.taskmanager.adapter.api.rest;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fairsource.taskmanager.adapter.api.rest.model.AddTaskRequest;
import com.fairsource.taskmanager.adapter.api.rest.model.GetAllTasksResponse;
import com.fairsource.taskmanager.adapter.api.rest.model.UpdateTaskRequest;
import com.fairsource.taskmanager.domain.usecases.scenarios.AddTaskScenario;
import com.fairsource.taskmanager.domain.usecases.scenarios.DeleteTaskScenario;
import com.fairsource.taskmanager.domain.usecases.scenarios.RetrieveTasksScenario;
import com.fairsource.taskmanager.domain.usecases.scenarios.UpdateTaskScenario;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;

@RestController
@RequestMapping("task/v1")
public class TaskController {

	private final RestToDomainConverter restToDomainConverter;

	private final DomainToRestConverter domainToRestConverter;

	private final AddTaskScenario addTaskScenario;

	private final UpdateTaskScenario updateTaskScenario;

	private final DeleteTaskScenario deleteTaskScenario;

	private final RetrieveTasksScenario retrieveTasksScenario;

	public TaskController(RestToDomainConverter converter, DomainToRestConverter domainToRestConverter,
			AddTaskScenario addTaskScenario, UpdateTaskScenario updateTaskScenario,
			DeleteTaskScenario deleteTaskScenario, RetrieveTasksScenario retrieveTasksScenario) {
		this.restToDomainConverter = converter;
		this.domainToRestConverter = domainToRestConverter;
		this.addTaskScenario = addTaskScenario;
		this.updateTaskScenario = updateTaskScenario;
		this.deleteTaskScenario = deleteTaskScenario;
		this.retrieveTasksScenario = retrieveTasksScenario;
	}

	@PostMapping(value = "add")
	public void addTask(@RequestBody @Valid AddTaskRequest addTaskRequest) {
		addTaskScenario.addTask(restToDomainConverter.convert(addTaskRequest));
	}

	@PatchMapping(value = "update/{id}")
	public void updateTask(@PathVariable @NotNull Integer id,
			@RequestBody @Valid @NotNull UpdateTaskRequest updateTaskRequest) {
		updateTaskScenario.updateTask(id, restToDomainConverter.convert(updateTaskRequest));
	}

	@DeleteMapping(value = "delete/{id}")
	public void deleteTask(@PathVariable @NotNull Integer id) {
		deleteTaskScenario.deleteTask(id);
	}

	@GetMapping(value = "get-all")
	public GetAllTasksResponse getAllTasks() {
		return domainToRestConverter.convert(retrieveTasksScenario.retrieveTasks());
	}

}

package com.fairsource.taskmanager.adapter.api.rest.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record AddTaskRequest(@NotBlank String name, @NotNull Priority priority) {

}

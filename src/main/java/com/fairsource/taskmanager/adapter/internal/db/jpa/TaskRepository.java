package com.fairsource.taskmanager.adapter.internal.db.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fairsource.taskmanager.adapter.internal.db.jpa.model.TaskEntity;

@Repository
public interface TaskRepository extends JpaRepository<Integer, TaskEntity> {

}

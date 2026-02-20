package com.fairsource.taskmanager.adapter.internal.db.jpa.model;

import java.time.OffsetDateTime;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Version;

@Table(name = "tasks")
@Entity
public class TaskEntity implements Comparable<TaskEntity> {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "task_id_gen")
	@SequenceGenerator(name = "task_id_gen", sequenceName = "task_seq", allocationSize = 1)
	private int id;

	@Version
	private Integer version;

	private String name;

	private boolean done;

	@CreationTimestamp
	private OffsetDateTime created;

	private String priority;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isDone() {
		return done;
	}

	public void setDone(boolean done) {
		this.done = done;
	}

	public OffsetDateTime getCreated() {
		return created;
	}

	public void setCreated(OffsetDateTime created) {
		this.created = created;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	@Override
	public int compareTo(TaskEntity arg0) {
		return this.id - arg0.id;
	}

}

package com.deltaww.flowapi.entity;

import lombok.Data;
import org.flowable.ui.task.model.runtime.CompleteFormRepresentation;

@Data
public class CompleteFormEntity extends CompleteFormRepresentation {
    private String processInstanceId;
    private String taskId;
    private String comment;
}

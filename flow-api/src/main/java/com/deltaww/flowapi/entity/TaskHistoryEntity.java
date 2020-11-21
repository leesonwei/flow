package com.deltaww.flowapi.entity;

import lombok.Data;
import org.flowable.engine.task.Comment;
import org.flowable.ui.idm.model.UserInformation;
import org.flowable.ui.task.model.runtime.TaskRepresentation;

import java.util.Map;

@Data
public class TaskHistoryEntity {
    private UserInformation user;
    private TaskRepresentation task;
    private Map<String, Object> values;
    private Comment comment;
}

package com.deltaww.flowapi.service;

import org.flowable.idm.api.User;
import org.flowable.ui.common.model.UserRepresentation;

import java.util.List;
import java.util.Map;

public interface DeltaUserService {
    User getManager(User user);
    User getManager(String userId);
    Map<String, String> getMesAssignee(List<String> assignees);
    UserRepresentation getUser(String userId);
    UserRepresentation getCurrentUser();
    User getProcessStartUser(String processInstanceId);
}

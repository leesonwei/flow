package com.deltaww.flowapi.service;

import org.flowable.idm.api.User;
import org.flowable.ui.common.model.UserRepresentation;

public interface DeltaUserService {
    User getManager(User user);
    User getManager(String userId);
    UserRepresentation getUser(String userId);
    UserRepresentation getCurrentUser();
    User getProcessStartUser(String processInstanceId);
}

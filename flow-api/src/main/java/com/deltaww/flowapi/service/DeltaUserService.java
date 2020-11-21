package com.deltaww.flowapi.service;

import org.flowable.idm.api.User;

public interface DeltaUserService {
    User getManager(User currentUser);
    User getCurrentUser();
    User getProcessStartUser(String processInstanceId);
}

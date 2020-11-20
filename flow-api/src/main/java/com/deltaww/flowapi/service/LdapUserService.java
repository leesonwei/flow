package com.deltaww.flowapi.service;

import org.flowable.idm.api.User;

public interface LdapUserService {
    User getManager(User currentUser);
}

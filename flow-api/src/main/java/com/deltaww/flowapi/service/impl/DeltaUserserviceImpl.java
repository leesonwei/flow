package com.deltaww.flowapi.service.impl;


import com.deltaww.flowapi.service.DeltaUserService;
import org.flowable.common.engine.impl.identity.Authentication;
import org.flowable.engine.ProcessEngine;
import org.flowable.idm.api.Group;
import org.flowable.idm.api.User;
import org.flowable.idm.engine.impl.persistence.entity.MembershipEntity;
import org.flowable.ui.common.model.GroupRepresentation;
import org.flowable.ui.common.model.UserRepresentation;
import org.flowable.ui.idm.model.UserInformation;
import org.flowable.ui.idm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class DeltaUserserviceImpl implements DeltaUserService {
    @Qualifier("processEngine")
    @Autowired
    private ProcessEngine processEngine;
    @Autowired
    private UserService userService;

    @Override
    public User getManager(User currentUser) {
        String tablename = processEngine.getManagementService().getTableName(MembershipEntity.class);
        String sql = "select user_id_ from #{tablename} m where m.group_id_ = #{manager}";
        User user = processEngine.getIdentityService().createNativeUserQuery().sql(sql)
                .parameter("tablename", tablename)
                .parameter("manager", "manager")
                .singleResult();
        return user;
    }

    @Override
    public UserRepresentation getUser(String userId) {
        UserInformation userInformation = userService.getUserInformation(userId);
        if (userInformation != null) {
            UserRepresentation userRepresentation = new UserRepresentation(userInformation.getUser());
            if (userInformation.getGroups() != null) {
                for (Group group : userInformation.getGroups()) {
                    userRepresentation.getGroups().add(new GroupRepresentation(group));
                }
            }
            if (userInformation.getPrivileges() != null) {
                for (String privilege : userInformation.getPrivileges()) {
                    userRepresentation.getPrivileges().add(privilege);
                }
            }
            return userRepresentation;
        }

        return null;
    }

    @Override
    public UserRepresentation getCurrentUser() {
        return getUser(Authentication.getAuthenticatedUserId());
    }

    @Override
    public User getProcessStartUser(String processInstanceId) {
        return null;
    }
}

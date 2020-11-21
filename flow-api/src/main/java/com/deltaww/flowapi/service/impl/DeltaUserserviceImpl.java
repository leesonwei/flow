package com.deltaww.flowapi.service.impl;


import com.deltaww.flowapi.service.DeltaUserService;
import org.flowable.engine.ProcessEngine;
import org.flowable.idm.api.User;
import org.flowable.idm.engine.impl.persistence.entity.MembershipEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class DeltaUserserviceImpl implements DeltaUserService {
    @Qualifier("processEngine")
    @Autowired
    private ProcessEngine processEngine;

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
    public User getCurrentUser() {
        return null;
    }

    @Override
    public User getProcessStartUser(String processInstanceId) {
        return null;
    }
}

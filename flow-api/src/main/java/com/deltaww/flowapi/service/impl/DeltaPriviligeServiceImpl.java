package com.deltaww.flowapi.service.impl;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.entity.DeltaPrivilige;
import com.deltaww.flowapi.service.DeltaPrivilligeService;
import com.deltaww.flowapi.service.DeltaUserService;
import org.flowable.idm.api.User;
import org.flowable.ui.common.model.UserRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class DeltaPriviligeServiceImpl implements DeltaPrivilligeService {
    @Autowired
    private DeltaUserService deltaUserService;
    @Override
    public List<DeltaPrivilige> getUserPrivilige(String userId) {
        UserRepresentation user = deltaUserService.getUser(userId);

        /*if (user.getGroups().contains(Constant.ADMIN)) {
            return priviges().stream().filter(x -> x.getLevel() >= 1).collect(Collectors.toList());
        }
        if (user.getGroups().contains(Constant.USER)) {
            return priviges().stream().filter(x -> x.getLevel() >= 2).collect(Collectors.toList());
        }*/

        return priviges();
    }

    private List<DeltaPrivilige> priviges(){
        List<DeltaPrivilige> deltaPriviliges = new ArrayList<>();
        DeltaPrivilige privilige = new DeltaPrivilige();
        privilige.setId("1");
        privilige.setName("首页");
        privilige.setIcon("icon-home");
        privilige.setType(0);
        privilige.setLevel(1);
        privilige.setUrl("/deltaflow/index");
        deltaPriviliges.add(privilige);
        DeltaPrivilige privilige2 = new DeltaPrivilige();
        privilige2.setId("3");
        privilige2.setName("表单中心");
        privilige2.setIcon("icon-form");
        privilige2.setType(0);
        privilige2.setLevel(1);
        privilige2.setUrl("/deltaflow/forms");
        deltaPriviliges.add(privilige2);
        /*DeltaPrivilige privilige3 = new DeltaPrivilige();
        privilige3.setId("34");
        privilige3.setName("任务中心");
        privilige3.setIcon("icon-form");
        privilige3.setType(0);
        privilige3.setLevel(1);
        privilige3.setUrl("/deltaflow/tasks");
        deltaPriviliges.add(privilige3);*/
        DeltaPrivilige privilige4 = new DeltaPrivilige();
        privilige4.setId("2");
        privilige4.setName("流程中心");
        privilige4.setIcon("icon-form");
        privilige4.setType(0);
        privilige4.setLevel(1);
        privilige4.setUrl("/deltaflow/processes");
        deltaPriviliges.add(privilige4);

        return deltaPriviliges.stream().sorted(Comparator.comparing(DeltaPrivilige::getId)).collect(Collectors.toList());
    }
}

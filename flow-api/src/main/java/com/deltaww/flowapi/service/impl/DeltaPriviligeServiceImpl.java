package com.deltaww.flowapi.service.impl;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.entity.DeltaPriviligeEntity;
import com.deltaww.flowapi.service.DeltaPrivilligeService;
import com.deltaww.flowapi.service.DeltaUserService;
import org.flowable.ui.common.model.UserRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
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
    public List<DeltaPriviligeEntity> getUserPrivilige(String userId) {
        UserRepresentation user = deltaUserService.getUser(userId);

        if (user.getGroups().stream().filter(x -> x.getId().equals(Constant.ADMIN)).findFirst().isPresent()) {
            return priviges().stream().filter(x -> x.getLevel() < 5 && x.getType() == 0).collect(Collectors.toList());
        }
        if (user.getGroups().stream().filter(x -> x.getId().equals(Constant.MANAGER)).findFirst().isPresent()) {
            return priviges().stream().filter(x -> x.getLevel() < 4 && x.getType() == 0).collect(Collectors.toList());
        }
        if (user.getGroups().stream().filter(x -> x.getId().equals(Constant.USER)).findFirst().isPresent()) {
            return priviges().stream().filter(x -> x.getLevel() < 3 && x.getType() == 0).collect(Collectors.toList());
        }
        return priviges();
    }

    @Override
    public List<DeltaPriviligeEntity> getUserButtonPrivilige(String userId, String parentId) {
        UserRepresentation user = deltaUserService.getUser(userId);
        List<DeltaPriviligeEntity> priviges = priviges();
        if (user.getGroups().stream().filter(x -> x.getId().equals(Constant.ADMIN)).findFirst().isPresent()) {
            return priviges().stream().filter(x -> x.getLevel() < 5 && x.getType() == 1 && x.getParentId().equals(parentId)).collect(Collectors.toList());
        }
        if (user.getGroups().stream().filter(x -> x.getId().equals(Constant.MANAGER)).findFirst().isPresent()) {
            return priviges().stream().filter(x -> x.getLevel() < 4 && x.getType() == 1 && x.getParentId().equals(parentId)).collect(Collectors.toList());
        }
        if (user.getGroups().stream().filter(x -> x.getId().equals(Constant.USER)).findFirst().isPresent()) {
            return priviges().stream().filter(x -> x.getLevel() < 3 && x.getType() == 1 && x.getParentId().equals(parentId)).collect(Collectors.toList());
        }
        return priviges;
    }

    private List<DeltaPriviligeEntity> priviges(){
        List<DeltaPriviligeEntity> deltaPriviligeEntities = new ArrayList<>();
        DeltaPriviligeEntity privilige = new DeltaPriviligeEntity();
        privilige.setId("1");
        privilige.setName("首页");
        privilige.setIcon("icon-home");
        privilige.setType(0);
        privilige.setLevel(1);
        privilige.setUrl("/deltaflow/index");
        deltaPriviligeEntities.add(privilige);
        DeltaPriviligeEntity privilige4 = new DeltaPriviligeEntity();
        privilige4.setId("2");
        privilige4.setName("流程中心");
        privilige4.setIcon("icon-form");
        privilige4.setType(0);
        privilige4.setLevel(4);
        privilige4.setUrl("/deltaflow/processes");
        deltaPriviligeEntities.add(privilige4);
        DeltaPriviligeEntity privilige2 = new DeltaPriviligeEntity();
        privilige2.setId("3");
        privilige2.setName("表单中心");
        privilige2.setIcon("icon-form");
        privilige2.setType(0);
        privilige2.setLevel(1);
        privilige2.setUrl("/deltaflow/forms");
        deltaPriviligeEntities.add(privilige2);
        DeltaPriviligeEntity privilige3 = new DeltaPriviligeEntity();
        privilige3.setId("4");
        privilige3.setName("任务中心");
        privilige3.setIcon("icon-form");
        privilige3.setType(0);
        privilige3.setLevel(1);
        privilige3.setUrl("/deltaflow/tasks");
        deltaPriviligeEntities.add(privilige3);


        //buttons
        DeltaPriviligeEntity button1 = new DeltaPriviligeEntity();
        button1.setId("101");
        button1.setName("新增/编辑流程");
        button1.setIcon("icon-form");
        button1.setType(1);
        button1.setLevel(4);
        button1.setParentId("2");
        button1.setUrl("/modeler/#/processes");
        deltaPriviligeEntities.add(button1);

        DeltaPriviligeEntity button21 = new DeltaPriviligeEntity();
        button21.setId("131");
        button21.setName("审批");
        button21.setIcon("icon-form");
        button21.setType(1);
        button21.setLevel(3);
        button21.setParentId("4");
        button21.setUrl("/deltaflow/forms/{formId}/{taskId}/audit");
        deltaPriviligeEntities.add(button21);

        DeltaPriviligeEntity button25 = new DeltaPriviligeEntity();
        button25.setId("132");
        button25.setName("修改");
        button25.setIcon("icon-form");
        button25.setType(1);
        button25.setLevel(2);
        button25.setParentId("4");
        button25.setUrl("/deltaflow/forms/{formId}/{taskId}/check");
        deltaPriviligeEntities.add(button25);

        DeltaPriviligeEntity button22 = new DeltaPriviligeEntity();
        button22.setId("112");
        button22.setName("取消申请");
        button22.setIcon("icon-form");
        button22.setType(1);
        button22.setLevel(1);
        button22.setParentId("3");
        button22.setUrl("/#");
        deltaPriviligeEntities.add(button22);
        DeltaPriviligeEntity button24 = new DeltaPriviligeEntity();
        button24.setId("114");
        button24.setName("查看进度");
        button24.setIcon("icon-form");
        button24.setType(1);
        button24.setLevel(1);
        button24.setParentId("3");
        button24.setUrl("/#");
        deltaPriviligeEntities.add(button24);
        DeltaPriviligeEntity button23 = new DeltaPriviligeEntity();
        button23.setId("113");
        button23.setName("删除实例");
        button23.setIcon("icon-form");
        button23.setType(1);
        button23.setLevel(5);
        button23.setParentId("3");
        button23.setUrl("/#");
        deltaPriviligeEntities.add(button23);

        return deltaPriviligeEntities.stream().sorted(Comparator.comparing(DeltaPriviligeEntity::getId)).collect(Collectors.toList());
    }
}

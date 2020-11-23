package com.deltaww.flowapi.service;

import com.deltaww.flowapi.entity.DeltaPriviligeEntity;

import java.util.List;

public interface DeltaPrivilligeService {
    List<DeltaPriviligeEntity> getUserPrivilige(String userId);
    List<DeltaPriviligeEntity> getUserButtonPrivilige(String userId, String parentId);
}

package com.deltaww.flowapi.service;

import com.deltaww.flowapi.entity.DeltaPrivilige;

import java.util.List;

public interface DeltaPrivilligeService {
    List<DeltaPrivilige> getUserPrivilige(String userId);
}

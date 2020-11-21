package com.deltaww.flowapi.service;

public interface GraghService {
    String createImageByInstanceId(String processInstanceId);
    String createImageByDefinitionId(String processDefinitionId);
}

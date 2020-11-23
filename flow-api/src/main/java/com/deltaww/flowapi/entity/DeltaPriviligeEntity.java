package com.deltaww.flowapi.entity;

import lombok.Data;

@Data
public class DeltaPriviligeEntity {
    private String id;
    private String name;
    private String url;
    private String icon;
    private Integer type;
    private Integer level;
    private String parentId;
}

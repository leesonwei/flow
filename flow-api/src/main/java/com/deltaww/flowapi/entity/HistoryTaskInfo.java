package com.deltaww.flowapi.entity;

import lombok.Data;

import java.util.Date;

@Data
public class HistoryTaskInfo {
    private Date endDate;
    private String operationInfo;
    private String commentInfo;
    private String link;

    public HistoryTaskInfo() {
    }

    public HistoryTaskInfo(Date endDate, String operationInfo, String commentInfo, String link) {
        this.endDate = endDate;
        this.operationInfo = operationInfo;
        this.commentInfo = commentInfo;
        this.link = link;
    }
}

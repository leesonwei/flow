package com.deltaww.flowapi.service;

import org.flowable.bpmn.model.BpmnModel;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.image.ProcessDiagramGenerator;
import org.flowable.image.impl.DefaultProcessDiagramGenerator;
import org.flowable.spring.boot.FlowableProperties;
import org.flowable.task.api.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class FlowProcessDiagramGenerator extends DefaultProcessDiagramGenerator {

    private static final String IMAGE_TYPE = "png";
    private static final String BASE64_PREFIX="data:image/png;base64,";
    @Autowired
    private FlowableProperties flowableProperties;
    @Qualifier("processEngine")
    @Autowired
    private ProcessEngine processEngine;

    /**
     * 生成图片流
     *
     * @param bpmnModel             模型
     * @param highLightedActivities 活动节点
     * @param highLightedFlows      高亮线
     * @return
     */
    public InputStream generateDiagram(BpmnModel bpmnModel, List<String> highLightedActivities, List<String> highLightedFlows) {
        return generateDiagram(bpmnModel, IMAGE_TYPE, highLightedActivities,
                highLightedFlows, flowableProperties.getActivityFontName(), flowableProperties.getLabelFontName(), flowableProperties.getAnnotationFontName(),
                null, 1.0, true);
    }

    /**
     * 生成图片流
     *
     * @param bpmnModel 模型
     * @return
     */
    public InputStream generateDiagram(BpmnModel bpmnModel) {
        return generateDiagram(bpmnModel, IMAGE_TYPE, flowableProperties.getActivityFontName(),
                flowableProperties.getLabelFontName(), flowableProperties.getAnnotationFontName(),
                null, 1.0, true);
    }

    public String getBase64Prefix(){
        return BASE64_PREFIX;
    }

    /**
     * 显示流程图,并高亮当前任务
     * @param processInstanceId
     * @param httpServletResponse
     * @throws IOException
     */
    public InputStream showDiagram(String processInstanceId, HttpServletResponse httpServletResponse) throws IOException {
        ProcessInstance pi = processEngine.getRuntimeService().createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        //流程走完的不显示图
        if (pi == null) {
            return null;
        }
        Task task = processEngine.getTaskService().createTaskQuery().processInstanceId(pi.getId()).singleResult();
        //使用流程实例ID，查询正在执行的执行对象表，返回流程实例对象
        String InstanceId = task.getProcessInstanceId();
        List<Execution> executions = processEngine.getRuntimeService().createExecutionQuery().processInstanceId(InstanceId).list();

        //得到正在执行的Activity的Id
        List<String> activityIds = new ArrayList<>();
        List<String> flows = new ArrayList<>();
        for (Execution exe : executions) {
            List<String> ids = processEngine.getRuntimeService().getActiveActivityIds(exe.getId());
            activityIds.addAll(ids);
        }

        //获取流程图
        BpmnModel bpmnModel = processEngine.getRepositoryService().getBpmnModel(pi.getProcessDefinitionId());
        ProcessEngineConfiguration engconf = processEngine.getProcessEngineConfiguration();
        ProcessDiagramGenerator diagramGenerator = engconf.getProcessDiagramGenerator();
        InputStream in = diagramGenerator.generateDiagram(bpmnModel, "png", activityIds, flows, engconf.getActivityFontName(), engconf.getLabelFontName(), engconf.getAnnotationFontName(), engconf.getClassLoader(), 1.0, false);
        return in;
    }
}

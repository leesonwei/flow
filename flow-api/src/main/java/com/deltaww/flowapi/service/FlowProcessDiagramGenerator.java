package com.deltaww.flowapi.service;

import org.flowable.bpmn.model.BpmnModel;
import org.flowable.image.impl.DefaultProcessDiagramGenerator;
import org.flowable.spring.boot.FlowableProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.List;

@Service
public class FlowProcessDiagramGenerator extends DefaultProcessDiagramGenerator {

    private static final String IMAGE_TYPE = "png";
    private static final String BASE64_PREFIX="data:image/png;base64,";
    @Autowired
    private FlowableProperties flowableProperties;

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
}

package com.kaka.service;

import com.kaka.pojo.DO.ClazzCountOption;
import com.kaka.pojo.VO.GenderCountVO;
import com.kaka.pojo.VO.JobReporter;

import java.util.List;
import java.util.Map;

public interface ReportService {
    JobReporter getEmpJobData();

    List<GenderCountVO> getEmpGenderData();

    List<Map> getStudentDegreeData();

    /**
     * 统计班级人数
     */
    ClazzCountOption getStudentCountData();
}

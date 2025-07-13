package com.kaka.service;

import com.kaka.pojo.VO.GenderCountVO;
import com.kaka.pojo.VO.JobReporter;

import java.util.List;

public interface ReportService {
    JobReporter getEmpJobData();

    List<GenderCountVO> getEmpGenderData();
}

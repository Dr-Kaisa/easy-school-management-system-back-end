package com.kaka.service.impl;

import com.kaka.pojo.DTO.JobCountDTO;
import com.kaka.pojo.VO.GenderCountVO;
import com.kaka.pojo.VO.JobReporter;
import com.kaka.mapper.ReportMapper;
import com.kaka.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private ReportMapper reportMapper;

    @Override
    public JobReporter getEmpJobData() {
        List<JobCountDTO> list=reportMapper.getCountList();
        String[] jobList = list.stream().map(JobCountDTO::getJobName).toArray(String[]::new);
        Integer[] dataList = list.stream().map(JobCountDTO::getJobCount).toArray(Integer[]::new);
        return new JobReporter(jobList, dataList);
    }

    @Override
    public List<GenderCountVO> getEmpGenderData() {
        List<GenderCountVO> list=reportMapper.getGenderCount();
        return list;
    }

}

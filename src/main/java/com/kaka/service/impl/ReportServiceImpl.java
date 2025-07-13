package com.kaka.service.impl;

import com.kaka.mapper.StudentMapper;
import com.kaka.pojo.DO.ClazzCountOption;
import com.kaka.pojo.DTO.JobCountDTO;
import com.kaka.pojo.VO.GenderCountVO;
import com.kaka.pojo.VO.JobReporter;
import com.kaka.mapper.ReportMapper;
import com.kaka.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Map;

@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private ReportMapper reportMapper;

    @Autowired
    private StudentMapper studentMapper;

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

    @Override
    public List<Map> getStudentDegreeData() {
        return studentMapper.countStudentDegreeData();
    }

    @Override
    public ClazzCountOption getStudentCountData() {
        List<Map<String, Object>> countList = studentMapper.getStudentCount();
        if(!CollectionUtils.isEmpty(countList)){
            List<Object> clazzList = countList.stream().map(map -> {
                return map.get("cname");
            }).toList();

            List<Object> dataList = countList.stream().map(map -> {
                return map.get("scount");
            }).toList();

            return new ClazzCountOption(clazzList, dataList);
        }
        return null;
    }
}

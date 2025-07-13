package com.kaka.controller;

import com.kaka.pojo.VO.GenderCountVO;
import com.kaka.pojo.VO.JobReporter;
import com.kaka.pojo.DO.Result;
import com.kaka.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/report")
@RestController
public class ReportController {
    @Autowired
    private ReportService reportService;
    @RequestMapping("/empJobData")
    public Result empJobData(){
        JobReporter jobReporter =reportService.getEmpJobData();

        return Result.success(jobReporter);
    }
    @RequestMapping("/empGenderData")
    public Result empGenderData(){

        List<GenderCountVO> genderCountVOList =reportService.getEmpGenderData();

        return Result.success(genderCountVOList);
    }
}

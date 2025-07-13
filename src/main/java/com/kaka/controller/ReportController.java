package com.kaka.controller;

import com.kaka.pojo.DO.ClazzCountOption;
import com.kaka.pojo.VO.GenderCountVO;
import com.kaka.pojo.VO.JobReporter;
import com.kaka.pojo.DO.Result;
import com.kaka.service.ReportService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RequestMapping("/report")
@RestController
@Slf4j
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

    /**
     * 统计学员的学历信息
     */
    @GetMapping("/studentDegreeData")
    public Result getStudentDegreeData(){
        log.info("统计学员的学历信息");
        List<Map> dataList = reportService.getStudentDegreeData();
        return Result.success(dataList);
    }

    /**
     * 班级人数统计
     */
    @GetMapping("/studentCountData")
    public Result getStudentCountData(){
        log.info("班级人数统计");
        ClazzCountOption clazzCountOption = reportService.getStudentCountData();
        return Result.success(clazzCountOption);
    }
}

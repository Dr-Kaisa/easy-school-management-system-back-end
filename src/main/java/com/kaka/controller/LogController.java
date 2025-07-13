package com.kaka.controller;

import com.kaka.pojo.DO.Result;
import com.kaka.pojo.DTO.LogPageParm;
import com.kaka.pojo.DTO.OperateLogSelectResult;
import com.kaka.pojo.VO.LogPageResult;
import com.kaka.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/log")
public class LogController {
    @Autowired
    LogService logService;
    @GetMapping("/page")
    public Result page(LogPageParm parm){

        LogPageResult<OperateLogSelectResult> logPageResult= logService.getLogs(parm);
        return Result.success(logPageResult);
    }
}

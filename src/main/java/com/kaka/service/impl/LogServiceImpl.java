package com.kaka.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kaka.mapper.OperationLogMapper;
import com.kaka.pojo.DO.Emp;
import com.kaka.pojo.DTO.LogPageParm;
import com.kaka.pojo.DTO.OperateLogSelectResult;
import com.kaka.pojo.VO.LogPageResult;
import com.kaka.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements LogService {
    @Autowired
    OperationLogMapper operationLogMapper;
    @Override
    public LogPageResult<OperateLogSelectResult> getLogs(LogPageParm parm) {
        PageHelper.startPage(parm.getPage(), parm.getPageSize());
        //执行查询，PageHelper对其进行了处理
        List<OperateLogSelectResult> list = operationLogMapper.list();


        //解析并封装
        Page page=(Page<OperateLogSelectResult>) list;
        return new LogPageResult<OperateLogSelectResult>(page.getTotal(), page.getResult());
    }
}

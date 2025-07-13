package com.kaka.service;

import com.kaka.pojo.DTO.LogPageParm;
import com.kaka.pojo.DTO.OperateLogSelectResult;
import com.kaka.pojo.VO.LogPageResult;
import org.springframework.stereotype.Service;

@Service
public interface LogService {
    LogPageResult<OperateLogSelectResult> getLogs(LogPageParm parm);
}

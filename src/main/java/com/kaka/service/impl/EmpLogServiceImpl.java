package com.kaka.service.impl;

import com.kaka.mapper.EmpLogMapper;
import com.kaka.pojo.DO.EmpLog;
import com.kaka.service.EmpLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EmpLogServiceImpl implements EmpLogService {

    @Autowired
    private EmpLogMapper empLogMapper;

    @Override
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void insertLog(EmpLog empLog) {

        empLogMapper.insert(empLog);
    }
}

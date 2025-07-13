package com.kaka.aop;

import com.kaka.Utils.CurrentHolder;
import com.kaka.mapper.OperationLogMapper;
import com.kaka.pojo.DTO.OperateLogSelectResult;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Arrays;


@Aspect
@Slf4j@Component
public class OperationLogAspect {
    @Autowired
    OperationLogMapper operationLogMapper;
    @Around("@annotation(com.kaka.anno.OperationLog)")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        // 记录开始时间
        long startTime = System.currentTimeMillis();
        // 执行方法
        Object result = joinPoint.proceed();
        // 当前时间
        long endTime = System.currentTimeMillis();
        // 耗时
        long costTime = endTime - startTime;

        // 构建日志对象
        OperateLogSelectResult operateLogSelectResult = new OperateLogSelectResult();
        operateLogSelectResult.setOperateEmpId(CurrentHolder.getCurrentId());
        operateLogSelectResult.setOperateTime(LocalDateTime.now());
        operateLogSelectResult.setClassName(joinPoint.getTarget().getClass().getName());
        operateLogSelectResult.setMethodName(joinPoint.getSignature().getName());
        operateLogSelectResult.setMethodParams(Arrays.toString(joinPoint.getArgs()));
        operateLogSelectResult.setReturnValue(result.toString());
        operateLogSelectResult.setCostTime(costTime);
        log.info("日志对象为:{}", operateLogSelectResult);
        // 插入日志
        operationLogMapper.insert(operateLogSelectResult);
        return result;
    }
}

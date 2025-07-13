package com.kaka.exception;

import com.kaka.pojo.DO.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
    @ExceptionHandler(DuplicateKeyException.class)
    public Result handleDuplicateKeyException(DuplicateKeyException e) {
        log.error("业务异常: {}", e.getMessage());
        String message = e.getMessage();
        String []arr = message.split(" ");
        return Result.error(arr[arr.length - 4]+"已存在");
    }
    @ExceptionHandler(Exception.class)
    public Result handleException(Exception e) {
        log.error("服务器发生异常: {}", e.getMessage());
        log.error("异常类型：{}", e.getClass().getName()); // 打印真实类型
        return Result.error("服务器发生异常,请联系管理员~");
    }


}

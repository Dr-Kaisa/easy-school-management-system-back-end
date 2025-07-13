package com.kaka.controller;

import com.kaka.pojo.DO.Emp;
import com.kaka.pojo.DO.Result;
import com.kaka.pojo.DTO.EmpPageParm;
import com.kaka.pojo.VO.EmpPageResult;
import com.kaka.service.EmpService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

@RestController
@Slf4j
@RequestMapping("/emps")
public class EmpController {
    @Autowired
    EmpService empService;

    //条件分页查询员工
    @GetMapping
    public Result page(EmpPageParm parm) {
//        log.info("分页查询");
//        log.info("分页查询");
        log.info("嗨嗨嗨——————name:{},gender:{},begin:{},end:{},pageNum:{},pageSize:{}", parm);
        EmpPageResult<Emp> empPageResult = empService.page(parm);
        return Result.success(empPageResult);
    }
    //添加员工
    @PostMapping
    public Result add(@RequestBody Emp emp) {
        log.info("添加员工");
        log.info("员工信息:{}", emp);
        empService.add(emp);
        return Result.success();
    }
    //根据删除员工
    @DeleteMapping
    public Result deleteById(Integer [] ids) {
        log.info("删除员工:{}", Arrays.toString(ids));
//        log.info("员工id:{}", id);
        empService.delete(ids);
        return Result.success();
    }

    // 修改员工
    //回显
    @GetMapping("/{id}")
    public Result get(@PathVariable Integer id) {
        log.info("回显员工:{}", id);
        Emp emp = empService.getById(id);
        return Result.success(emp);
    }
    //修改员工信息
    @PutMapping
    public Result update(@RequestBody Emp emp) {
        log.info("修改员工:{}", emp);
        empService.update(emp);
        return Result.success();
    }
}

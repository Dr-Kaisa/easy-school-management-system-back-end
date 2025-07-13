package com.kaka.controller;

import com.kaka.anno.OperationLog;
import com.kaka.pojo.DO.Dept;
import com.kaka.pojo.DO.Result;
import com.kaka.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
//给整个类设置一个公共路径
@RequestMapping("/depts")
@RestController
public class DeptController {
    @Autowired
    private DeptService deptService;

    @GetMapping
    public Result list() {
        System.out.println("查询全部部门信息");
        List<Dept> deptList = deptService.findAll();
        System.out.println("11111111111111:" + deptList);
        return Result.success(deptList);
    }
    //删除部门
    //url中获取参数@RequestParam，和函数入口参数一致可以省略
    @OperationLog
    @DeleteMapping
    public Result delete(Integer id) {
        System.out.println("删除部门:id=" + id);
        deptService.delete(id);
        return Result.success();
    }

    //增加部门
    //请求体中获取参数@RequestBody
    @OperationLog
    @PostMapping
    public Result add(@RequestBody Dept dept) {
        System.out.println("添加部门:" + dept);
        deptService.add(dept);
        return Result.success();
    }

    //路径中获取参数@PathVariable(xx), 和函数入口参数一致可以省略
    @GetMapping("/{id}")
    public Result get(@PathVariable Integer id) {
        System.out.println("查询部门:id=" + id);
        Dept dept = deptService.get(id);
        return Result.success(dept);
    }
    //修改部门
    @OperationLog
    @PutMapping
    public Result update(@RequestBody Dept dept) {
        System.out.println("修改部门:" + dept);
        deptService.update(dept);
        return Result.success();
    }
}
